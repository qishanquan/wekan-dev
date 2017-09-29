#FROM wekan_8
#
#WORKDIR /home/wekan/app
#COPY \
#    src/.meteor/.finished-upgraders \
#    src/.meteor/.id \
#    src/.meteor/cordova-plugins \
#    src/.meteor/packages \
#    src/.meteor/platforms \
#    src/.meteor/release \
#    src/.meteor/versions \
#    .meteor/
#
#RUN \
#    groupmod -g 1000 wekan && \
#    usermod -u 1000 wekan && \
#    usermod -g 1000 wekan && \
#    chown -R wekan:wekan /home/wekan && \
#    chmod g+s /home/wekan && \
#    gosu wekan /home/wekan/.meteor/meteor build --directory /home/wekan/app_build
#
#RUN \
#    chown wekan:wekan --recursive .meteor


# 二、
#USER wekan
#CMD ["/home/wekan/.meteor/meteor", "run", "--verbose"]
#
#FROM wekan_final
#
#RUN /home/wekan/.meteor/meteor npm install --save babel-runtime
#
#ENV MONGO_URL=mongodb://10.10.6.56:27017/wekan
#ENV ROOT_URL=http://10.10.6.56
#
#EXPOSE $PORT

# docker-compose stop && docker-compose rm -f
# docker-compose up --build -d && docker-compose logs -f

#   三、

FROM wekan_9_qisq

WORKDIR /home/wekan/app

RUN chown -Rh wekan:wekan .meteor/local

RUN /home/wekan/.meteor/meteor npm install --save babel-runtime

EXPOSE $PORT

#USER wekan
#CMD ["/home/wekan/.meteor/meteor", "run", "--verbose"]

CMD ["/home/wekan/.meteor/meteor", "run", "--verbose","--allow-superuser"]

