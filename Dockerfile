FROM alpine:latest

RUN apk add --no-cache --upgrade expect
RUN apk add --no-cache --update openssh 

WORKDIR /ptt/crontabjob
COPY ./*.exp /ptt/crontabjob/

RUN chmod 0644 acc1.exp
RUN chmod 0644 acc2.exp

RUN echo '45 */5 * * * expect /ptt/crontabjob/acc1.exp' >> /etc/crontabs/root
RUN echo '30 */5 * * * expect /ptt/crontabjob/acc2.exp' >> /etc/crontabs/root

CMD ["crond", "-f"]
