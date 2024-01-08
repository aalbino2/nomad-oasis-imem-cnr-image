FROM gitlab-registry.mpcdf.mpg.de/nomad-lab/nomad-fair:develop

# TODO:
# - install plugin from package
# - add the dependency here: https://github.com/FAIRmat-NFDI/nomad-measurements/blob/main/pyproject.toml

# Workaround
RUN pip install xmltodict


COPY --chown=nomad:1000 ./plugins/nomad-measurements/src/nomad_measurements /app/plugins/nomad_measurements
COPY --chown=nomad:1000 ./plugins/nomad-measurements/src/nomad_measurements/xrd /app/plugins/xrd
COPY --chown=nomad:1000 ./plugins/nomad-material-processing/src/nomad_material_processing /app/plugins/nomad_material_processing
COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/IMEM-CNR_plugin/src/movpe_IMEM /app/plugins/movpe_IMEM
# COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/RTG_SIMS/nomadschemartgsims /app/plugins/nomadschemartgsims
# COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/LayTec_EpiTT/laytec_epitt_plugin/src/laytec_epitt /app/plugins/laytec_epitt
# COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/PVD/PLD/jeremy_ikz/ikz_pld_plugin/src/ikz_pld /app/plugins/ikz_pld
# COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/hall/Lakeshore_plugin/lakeshore /app/plugins/lakeshore
# COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/IKZ_plugin/src/movpe_IKZ /app/plugins/movpe_IKZ
# COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/IKZ_plugin/src/basesections_IKZ /app/plugins/basesections_IKZ

# RUN pip install build
#
# COPY \
#     nomadschemaexample \
#     tests \
#     README.md \
#     LICENSE \
#     pyproject.toml \
#     .
#
# RUN python -m build --sdist
#
# RUN pip install dist/nomad-schema-plugin-example-*.tar.gz