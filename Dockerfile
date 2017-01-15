FROM java:8
MAINTAINER coola58 "yankaili2006@gmail.com"

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

#update system timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#update application timezone
RUN echo "Asia/Shanghai" >> /etc/timezone

ADD run.sh $APP_HOME/run.sh

CMD ["sh", "run.sh"]
