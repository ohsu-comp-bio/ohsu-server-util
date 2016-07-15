FROM python:2.7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


ADD .  /usr/src/app/

# PROTOBUF
RUN apt-get update
RUN apt-get install -y autoconf automake libtool curl make g++ unzip vim
RUN pwd
RUN git clone https://github.com/google/protobuf
RUN ls -l
RUN cd protobuf && ./autogen.sh && ./configure && make && make check && make install && ldconfig


RUN pip install pip --upgrade
 
RUN mkdir $HOME/.python-eggs \
  && chmod og-w $HOME/.python-eggs \
  && pip install -r dev-requirements.txt \
  && pip install ipython \
  && pip install pdb
 
 
 
# JAVA
RUN curl -sL --retry 3 --insecure \
   --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
   "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/server-jre-8u31-linux-x64.tar.gz" \
   | gunzip \
   | tar x -C /opt/
   ENV JAVA_HOME /opt/jdk1.8.0_31
   RUN ln -s $JAVA_HOME /opt/java
   ENV PATH $JAVA_HOME/bin:$PATH


# SAM TOOLS 
# install required packages
RUN apt-get update && apt-get install -y \
    ant \
    build-essential \
    cmake \
    g++ \
    gfortran \
    git \
    hdf5-tools \
    libboost-date-time-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    libbz2-dev \
    libhdf5-dev \
    libncurses-dev \
    python \
    python-dev \
    python-pip \
    zlib1g-dev \
    && apt-get clean

# set environment
ENV BOOST_ROOT /usr
ENV SEQTK_ROOT /opt/htslib

# install delly
RUN cd /opt \
    && git clone https://github.com/samtools/htslib.git \
    && cd /opt/htslib \
    && make \
    && make lib-static \
    && make install
RUN cd /opt \
    && git clone https://github.com/samtools/bcftools.git \
    && cd /opt/bcftools \
    && make all \
    && make install
RUN cd /opt \
    && git clone https://github.com/samtools/samtools.git \
    && cd /opt/samtools \
    && make all \
    && make install
RUN cd /opt \
    && git clone https://github.com/tobiasrausch/delly.git \
    && cd /opt/delly/ \
    && touch .bcftools .htslib .boost \
    && make all \
    && install -p /opt/delly/src/delly /usr/local/bin/ \
    && install -p /opt/delly/src/stats /usr/local/bin/ \
    && install -p /opt/delly/src/cov /usr/local/bin/

