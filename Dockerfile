FROM contiamo/datascience-lab-all:latest

USER root

RUN conda update -n base conda
COPY environment.yml .
RUN conda env update

USER $NB_USER
