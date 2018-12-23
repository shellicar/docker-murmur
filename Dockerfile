FROM busybox:latest
MAINTAINER Stephen Hellicar <shellicar@gmail.com>

ENV version=1.3.0~2586~g894ade2~snapshot

ADD https://dl.mumble.info/murmur-static_x86-${version}.tar.bz2 /opt/

RUN adduser -S murmur && \
    bzcat /opt/murmur-static_x86-${version}.tar.bz2 | tar -x -C /opt -f - && \
    rm /opt/murmur-static_x86-${version}.tar.bz2 && \
    mv /opt/murmur-static_x86-${version} /opt/murmur

CMD ["/opt/murmur/murmur.x86", "-fg", "-v", "-ini", "/etc/murmur.ini"]

RUN chown murmur:nogroup /home/murmur

