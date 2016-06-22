FROM python:2.7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


ADD .  /usr/src/app/


RUN apt-get update
RUN apt-get install -y autoconf automake libtool curl make g++ unzip
RUN pwd
RUN git clone https://github.com/google/protobuf
RUN ls -l
RUN cd protobuf && ./autogen.sh && ./configure && make && make check && make install && ldconfig


RUN pip install pip --upgrade
 
RUN mkdir $HOME/.python-eggs \
  && chmod og-w $HOME/.python-eggs \
  && pip install -r dev-requirements.txt
 
 
 

RUN curl -sL --retry 3 --insecure \
   --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
   "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/server-jre-8u31-linux-x64.tar.gz" \
   | gunzip \
   | tar x -C /opt/
   ENV JAVA_HOME /opt/jdk1.8.0_31
   RUN ln -s $JAVA_HOME /opt/java
   ENV PATH $JAVA_HOME/bin:$PATH

