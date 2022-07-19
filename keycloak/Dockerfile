ARG KEYCLOAK_VERSION
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres
# Install custom providers
RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

USER root
COPY themes/ /opt/keycloak/themes
RUN rm -f /opt/keycloak/conf/keycloak.conf
# RUN rm -f /opt/keycloak/conf/cache-ispn.xml
COPY keycloak.conf  /opt/keycloak/conf/

COPY predefined-realms/ /opt/keycloak/data/import

USER 1000
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "--verbose -cf /opt/keycloak/conf/keycloak.conf", "start-dev --import-realm"]