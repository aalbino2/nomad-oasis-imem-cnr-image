# nomad-oasis-imem-cnr-image

Link to the custom docker image of NOMAD Oasis created in this repo:

```sh
    image: ghcr.io/aalbino2/nomad-oasis-imem-cnr-image:pr-1
```

## Create a custom docker image of NOMAD Oasis

clone this repo with the `--recurse-submodules` flag:

```sh
git clone --recurse-submodules https://github.com/aalbino2/nomad-oasis-imem-cnr-image.git
```

If you want to load a plugin from another repository you need to add it here as a submodule:

```sh
git submodule add https://github.com/my_repo_url
git status
git git add .
git git commit -m "add submodule"
```

To update the submodules:

```sh
cd nomad-oasis-imem-cnr-image
git submodule update --remote
git add .
git commit -m "git submodules updated"
git push 
```

che the Dockerfile in the root of this repo and modify the `COPY` commands to include all the packages from your submodule repositories that you need to load in your Oasis:

```sh
COPY --chown=nomad:1000 ./plugins/AreaA-data_modeling_and_schemas/IMEM-CNR_plugin/src/movpe_IMEM /app/plugins/movpe_IMEM
```

Install an Oasis on your machine following the [Official NOMAD docs](https://nomad-lab.eu/prod/v1/staging/docs/howto/oasis/install.html).

Add the following lines to the `configs/nomad.yaml` to include the plugins:

```yaml
plugins:
  # We only include our schema here. Without the explicit include, all plugins will be
  # loaded. Many build in plugins require more dependencies. Install nomad-lab[parsing]
  # to make all default plugins work.
  include:
    - 'schemas/nomad_material_processing'
    - 'schemas/nomad_measurements'
    - 'parsers/movpe_IMEM'
  options:
    schemas/nomad_material_processing:
      python_package: nomad_material_processing
    parsers/laytec_epitt:
      python_package: laytec_epitt
    parsers/XRD:
      python_package: xrd
    schemas/nomad_measurments:
      python_package: nomad_measurements
    parsers/movpe_IMEM:
      python_package: movpe_IMEM
```

Add the proper image to the `docker-compose.yaml` in the `worker`, `app`, `north`, `logtransfer` containers.

After pushing a new commit, the github workflow will run and create a new image.