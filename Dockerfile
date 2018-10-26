FROM contiamo/datascience-all-lab

USER root

RUN conda install --quiet --yes -c conda-forge \
    pymc3=3.3 \
    r-ggraph=1.0.0 \
    r-sparklyr=0.7.0

USER $NB_USER