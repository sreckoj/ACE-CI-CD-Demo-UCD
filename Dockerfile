#FROM ibmcom/ace-server:latest
#FROM ibmcom/ace-server:11.0.0.9-r3-20200724-030239-amd64
FROM cp.icr.io/cp/appc/ace-server-prod@sha256:8df2fc5e76aa715e2b60a57920202cd000748476558598141a736c1b0eb1f1a3
ENV LICENSE accept
COPY PingService /home/aceuser/PingService
RUN mkdir /home/aceuser/bars
RUN source /opt/ibm/ace-11/server/bin/mqsiprofile
RUN /opt/ibm/ace-11/server/bin/mqsipackagebar -a bars/PingService.bar -k PingService
RUN ace_compile_bars.sh
RUN chmod -R 777 /home/aceuser/ace-server/run/PingService
