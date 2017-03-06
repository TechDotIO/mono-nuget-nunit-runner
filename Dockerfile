FROM mono:4.8
MAINTAINER CodinGame <coders@codingame.com>
COPY run.sh /
COPY build /project/
ENTRYPOINT ["/run.sh"]
