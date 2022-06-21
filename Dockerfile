FROM debian:unstable

RUN mkdir -p /home/dev/config

RUN apt update && apt install -y curl git xclip vim

# multistage the chezmoi for the templating and then drag/drop into here
COPY dot_vimrc /home/dev/config/.vimrc
ENV MYVIMRC=/home/dev/config/.vimrc
ENV VIMINIT=":source $MYVIMRC"

# gotta add it as a submodule i think or something so it's not this fully external dep
RUN git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
RUN tic -xe alacritty,alacritty-direct /tmp/alacritty/extra/alacritty.info
ENV TERM=alacritty

WORKDIR /workspace

CMD ["/bin/bash"]
