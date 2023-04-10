# syntax=docker/dockerfile:1-labs
# need to use labs due to `ADD giturl` still being in beta

FROM scratch as alacritty
ADD https://github.com/alacritty/alacritty.git /alacritty

FROM scratch as vim-colors-solarized
ADD https://github.com/altercation/vim-colors-solarized.git /vim-colors-solarized

FROM debian:unstable as devenv

ARG USERNAME=amn
ARG UID=1000
ARG GID=1000

RUN <<EOF
groupadd -g "${GID}" "${USERNAME}"
useradd --create-home --no-log-init -u "${UID}" -g "${GID}" "${USERNAME}"
EOF

WORKDIR /home/"${USERNAME}"/

RUN <<EOF
apt update && apt upgrade
apt install -y --no-install-recommends ca-certificates
apt install -y --no-install-recommends curl
apt install -y --no-install-recommends git
apt install -y --no-install-recommends vim
apt install -y --no-install-recommends wget
apt install -y --no-install-recommends xclip
apt clean
rm -rf /var/lib/apt/lists/*
EOF

ENV TERM=alacritty
COPY --from=alacritty --link --chown="${UID}":"${GID}" /alacritty/extra/ ./.config/alacritty/extra/
RUN <<EOF
# terminfo
if ! infocmp alacritty; then
  tic -xe alacritty,alacritty-direct ./.config/alacritty/extra/alacritty.info
fi
# manpage
mkdir -p /usr/local/share/man/man1
gzip -c ./.config/alacritty/extra/alacritty.man | tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c ./.config/alacritty/extra/alacritty-msg.man | tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null 
EOF

COPY --from=vim-colors-solarized --link --chown="${UID}":"${GID}" /vim-colors-solarized/colors/solarized.vim ./.vim/colors/
COPY --link --chown="${UID}":"${GID}" .vimrc ./.vimrc

# RUN git clone https://github.com/seebi/dircolors-solarized /tmp/dircolors-solarized
# ENV SHELL="$(echo $0)"
# doesn't actually set ls_colors like it ought to and even when you do it manually it still don't work
# RUN eval `dircolors /tmp/dircolors-solarized/dircolors.256dark`

USER "${USERNAME}"

CMD ["/bin/bash"]
