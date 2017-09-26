#FROM wekan_8
#
#WORKDIR /home/wekan/app
#
#RUN \
#    chown wekan:wekan --recursive .meteor
#
#USER wekan
#CMD ["/home/wekan/.meteor/meteor", "run", "--verbose"]

FROM wekan_final

RUN /home/wekan/.meteor/meteor npm install --save babel-runtime

ENV MONGO_URL=mongodb://10.10.6.56:27017/wekan
ENV ROOT_URL=http://10.10.6.56

EXPOSE $PORT