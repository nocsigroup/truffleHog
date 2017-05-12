FROM alpine:3.4
MAINTAINER l@nocsi.com

RUN apk add -U \
    git==2.8.5-r0 \
    python==2.7.12-r0 \
    py-pip==8.1.2-r0 \
    openssh-client==7.2_p2-r4

ADD src/ /truffleHog/
RUN pip install -r /truffleHog/requirements.txt
ENTRYPOINT ["python", "/truffleHog/truffleHog/truffleHog.py"]
