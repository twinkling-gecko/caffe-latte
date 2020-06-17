# stage for development
FROM golang:1.14 as dev

LABEL maintainer "Akira Shinohara <k017c1067@it-neec.jp>"

# ***************************
# * support Japanese string *
# ***************************
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US:

# *************************
# * enable go mod support *
# *************************
ENV GO11MODULE=on

# *******************
# * Create the user *
# *******************
ARG USERNAME=lonewolf
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ****************************
# * resolve dev dependencies *
# ****************************
RUN go get github.com/pilu/fresh

# ***************************
# * start go app with fresh *
# ***************************
USER $USERNAME
EXPOSE 3000
WORKDIR /go/src/github.com/twinkling-gecko/caffe-latte
COPY . .

CMD ["fresh"]
