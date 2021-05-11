FROM centos:8

RUN  yum -y update && yum -y install \
                            zlib-devel \
                            bzip2-devel \
                            openssl-devel \
                            ncurses-devel \
                            sqlite-devel \
                            python3-devel \
                            python3-setuptools \
                            wget \
                            cyrus-sasl-devel.x86_64

# ARG AIRFLOW_VERSION=2.0.2
COPY requirements.txt requirements.txt


RUN pip3 install --upgrade pip && pip3 install -r requirements.txt