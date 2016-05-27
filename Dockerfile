FROM python:2.7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


ADD .  /usr/src/app/


RUN pip install pip --upgrade

RUN mkdir $HOME/.python-eggs \
  && chmod og-w $HOME/.python-eggs \
  && pip install -r dev-requirements.txt

# RUN python setup.py sdist
# RUN pip install /usr/src/app/dist/ga4gh-0.3.0.tar.gz


# RUN ga4gh_client --version \
#   && ga4gh_configtest --version \
#   && ga4gh_server --version \
#   && ga2vcf --version \
#   && ga2sam --version \
#   && ga4gh_repo --version

# RUN python setup.py sdist \



# RUN mkdir $HOME/.python-eggs \
#  && chmod og-w $HOME/.python-eggs \
#  && pip install -r dev-requirements.txt

RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/server-jre-8u31-linux-x64.tar.gz" \
  | gunzip \
  | tar x -C /opt/
  ENV JAVA_HOME /opt/jdk1.8.0_31
  RUN ln -s $JAVA_HOME /opt/java
  ENV PATH $JAVA_HOME/bin:$PATH
