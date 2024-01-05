# nomad-oasis-imem-cnr-image

Link to the custom docker image of NOMAD Oasis created in this repo:

```sh
    image: ghcr.io/aalbino2/nomad-oasis-imem-cnr-image:pr-1
```

To create a custom docker image of NOMAD Oasis, you need to clone this repo with the `--recurse-submodules` flag:

```sh
git clone --recurse-submodules https://github.com/aalbino2/nomad-oasis-imem-cnr-image.git
```

To update the submodules:

```sh
cd nomad-oasis-imem-cnr-image
git submodule update --remote
git add .
git commit -m "git submodule updated"
git push 
```

After pushing a new commit, the github workflow will run and create a new image.