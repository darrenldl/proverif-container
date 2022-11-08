# FROM docker.io/ocaml/opam:alpine-ocaml-4.14
FROM docker.io/ocaml/opam
USER root
WORKDIR /root
RUN apt-get install --yes pkg-config
RUN apt-get install --yes libexpat1-dev libgtk2.0-dev
RUN apt-get install --yes graphviz
RUN curl -L https://proverif.inria.fr/proverif2.04.tar.gz -o proverif2.04.tar.gz
RUN md5sum proverif2.04.tar.gz
RUN tar xfz proverif2.04.tar.gz --no-same-owner 
RUN opam pin add proverif.2.04 proverif2.04
RUN opam install --verbose proverif
