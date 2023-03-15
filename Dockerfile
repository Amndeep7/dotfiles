# syntax=docker/dockerfile:1
FROM debian:unstable

ARG USERNAME=dev
ARG UID=1000
ARG GID=1000

RUN <<EOF
groupadd -g "${GID}" "${USERNAME}"
useradd --create-home --no-log-init -u "${UID}" -g "${GID}" "${USERNAME}"
EOF

# RUN mkdir -p /home/dev/config

# RUN apt update && apt install -y curl git xclip vim

# multistage the chezmoi for the templating and then drag/drop into here
# COPY dot_vimrc /home/dev/config/.vimrc
# ENV MYVIMRC=/home/dev/config/.vimrc
# ENV VIMINIT=":source $MYVIMRC"

# gotta add it as a submodule i think or something so it's not this fully external dep
# RUN git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
# RUN tic -xe alacritty,alacritty-direct /tmp/alacritty/extra/alacritty.info
# ENV TERM=alacritty

# RUN git clone https://github.com/seebi/dircolors-solarized /tmp/dircolors-solarized
# ENV SHELL="$(echo $0)"
# doesn't actually set ls_colors like it ought to and even when you do it manually it still don't work
# RUN eval `dircolors /tmp/dircolors-solarized/dircolors.256dark`

WORKDIR /workspace

USER "${USERNAME}"

CMD ["/bin/bash"]
