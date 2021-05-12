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
                            cyrus-sasl-devel.x86_64 \
                            nginx


RUN wget https://downloads.apache.org/druid/0.21.0/apache-druid-0.21.0-bin.tar.gz && tar -xzf apache-druid-0.21.0-bin.tar.gz


# ARG AIRFLOW_VERSION=2.0.2
ARG AIRFLOW_PASSWORD=password
COPY requirements.txt requirements.txt


RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY airflow.cfg /root/airflow/airflow.cfg

RUN airflow db init; airflow users create \
    --username admin \
    --firstname Mustafa \
    --lastname Saber \
    --role Admin \
    --email mostafa.saber3789@gmail.com \
    --password ${AIRFLOW_PASSWORD}

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh entrypoint.sh
EXPOSE 80

ENTRYPOINT [ "./entrypoint.sh" ]