FROM jupyter/base-notebook

USER root


ENV ALLURE_DIR /opt/allure

# oracle java 8 installation
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
 && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  \
 && apt-get update \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
 && DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default \
 && rm -rf /var/cache/oracle-jdk8-installer

# allure installation
RUN cd /tmp \
 && wget --quiet https://github.com/allure-framework/allure1/releases/download/allure-core-1.5.0/allure-commandline.tar.gz \
 && mkdir $ALLURE_DIR \
 && cd $ALLURE_DIR \
 && tar -xvzf /tmp/allure-commandline.tar.gz \
 && ln -s /opt/allure/bin/allure /usr/bin/

# install behave
COPY requirements.txt /var/requirements.txt
RUN cd /var \
 && pip install -r requirements.txt \
 && rm -f requirements.txt

RUN apt-get install -yq openssh-client git vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# disable auth token
CMD ["start-notebook.sh", "--NotebookApp.token="]

USER $NB_USER
