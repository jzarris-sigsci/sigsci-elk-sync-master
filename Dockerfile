FROM python:3
RUN apt-get update -y
RUN apt-get install cron -yqq
COPY crontab /etc/cron.d/sigsci-cron
RUN crontab /etc/cron.d/sigsci-cron
RUN touch /var/log/cron.log
ENV APP_DIR /app
COPY VERSION requirements.txt  SigSci.py  SigSciELK.sh $APP_DIR/
WORKDIR $APP_DIR
RUN chmod +x SigSci.py
RUN chmod +x SigSciELK.sh
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
CMD ["cron", "-f"]
