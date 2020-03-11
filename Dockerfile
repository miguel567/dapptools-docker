FROM ubuntu

LABEL key="Ubuntu image for runnig dapptools" 

RUN apt-get update && \
    apt-get -y install automake autoconf python3 zsh curl git vim nano tmux npm iputils-ping

RUN git config --global user.name "Miguel Cabeza"
RUN git config --global user.email miguel567@gmail.com


# Install ZSH
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd
ENV SHELL /bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#create migue user, prepare for /nix installation and instal zsh on migue user also
RUN useradd -s /bin/zsh -d /home/migue/ -m -G sudo migue
RUN mkdir -m 0755 /nix
RUN chown migue /nix
RUN su migue sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN su - migue sh -c "$(curl -fsSL https://dapp.tools/install)"

RUN mkdir /root/dev
VOLUME /root/devub

WORKDIR /root

ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

CMD ["zsh"]