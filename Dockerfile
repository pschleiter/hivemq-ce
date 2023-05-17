FROM busybox AS loader

ARG EXTENSION_VERSION=4.5.3

RUN wget https://github.com/hivemq/hivemq-file-rbac-extension/releases/download/${EXTENSION_VERSION}/hivemq-file-rbac-extension-${EXTENSION_VERSION}.zip -O hivemq-file-rbac-extension.zip && \
    unzip hivemq-file-rbac-extension.zip


FROM hivemq/hivemq-ce:2023.3

RUN rm -r /opt/hivemq-ce-2023.3/extensions/hivemq-allow-all-extension

COPY --from=loader /hivemq-file-rbac-extension /opt/hivemq-ce-2023.3/extensions/hivemq-file-rbac-extension