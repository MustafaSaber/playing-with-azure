#!/bin/bash

airflow webserver -D &

/apache-druid-0.21.0/bin/start-micro-quickstart &

nginx -g 'daemon off;'