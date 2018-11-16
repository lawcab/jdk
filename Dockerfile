FROM lawcab/baseimage
MAINTAINER Lawrence Cabal <lawcab@gmail.com>

#install firefox 63.0
RUN wget https://ftp.mozilla.org/pub/firefox/releases/63.0.1/linux-x86_64/en-US/firefox-63.0.1.tar.bz2
RUN tar -xvjf firefox-63.0.1.tar.bz2 -C /opt
RUN ln -s /opt/firefox/firefox /usr/bin/firefox

#install JDK
RUN mkdir /usr/local/java \
&& cd /usr/local/java \
&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u191-b12/jdk-8u191-linux-x64.tar.gz \
&& tar xvzf jdk-8u191-linux-x64.tar.gz \
&& echo 'JAVA_HOME=/usr/local/java/jdk1.8.0_191' >> /etc/profile \
&& echo 'PATH=$PATH:$HOME/bin:$JAVA_HOME/bin' >> /etc/profile \
&& echo 'export JAVA_HOME' >> /etc/profile \
&& echo 'export PATH' >> /etc/profile 
RUN  update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_191/bin/java" 1 \
&& update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_191/bin/javaws" 1 \
&& update-alternatives --set java /usr/local/java/jdk1.8.0_191/bin/java \
&& update-alternatives --set javaws /usr/local/java/jdk1.8.0_191/bin/javaws

#install IntelliJ
RUN wget https://download-cf.jetbrains.com/idea/ideaIC-2018.2.6.tar.gz \
&& mkdir /Programs \
&& tar xvzf ideaIC-2018.2.6.tar.gz -C /Programs \
&& cd /Programs \
&& mv idea* idea \
&& mkdir /prj
