FROM kasmweb/core-ubuntu-focal:1.12.0
LABEL maintainer="https://github.com/asabhi6776"
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########


COPY asset/wallpaper-custom.jpg /usr/share/extra/backgrounds/bg_default.png

RUN apt update ; apt upgrade -y
RUN apt install wget curl git -y
RUN apt install python3 python3-dev build-essential -y
RUN wget -O hyper_3.2.3_amd64.deb https://releases.hyper.is/download/deb
RUN apt install ./hyper_3.2.3_amd64.deb -y

RUN apt-get update \
    && apt-get install -y sudo \
    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/list/*

RUN  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - \
    && apt-get update \
    && apt-get install -y apt-transport-https \
    && echo "deb https://download.sublimetext.com/ apt/stable/" |  tee /etc/apt/sources.list.d/sublime-text.list \
    && apt-get update \
    && apt-get install sublime-text \
    && cp /usr/share/applications/sublime_text.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/sublime_text.desktop \
    && chown 1000:1000 $HOME/Desktop/sublime_text.desktop

RUN mkdir -p $HOME/project
RUN chmod -R 777 $HOME/project




######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000

