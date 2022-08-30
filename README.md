# Kusteval - K8s Kustomize + Kubeval Github Action
Allows for the evaluation of kustomize files "in-memory", so that you don't have to generate, store or continually update generated Kubernetes files in Git.

## Usage

### Locally
`docker run {image}`

### Github Action
```yaml
on: push
name: mattwithoos/kusteval K8s validation
jobs:
  kusteval-pass:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Kusteval PASS test
      uses: mattwithoos/kusteval@main
```

## Inputs
Envs are set to be Github Actions friendly
`INPUT_KUSTOMIZE_VER` - Defaults to 4.5.7
`INPUT_TARGET_DIR` - Path to the target kustomize file

## Tests

### Run a sample PASS test
`docker run -it -v "$(pwd)"/tests:/tests -e INPUT_KUSTOMIZE_VER='4.5.7' -e INPUT_TARGET_DIR=/tests/overlays/pass-test $(docker build -q .)`

### Run a sample FAIL test
`docker run -it -v "$(pwd)"/tests:/tests -e INPUT_KUSTOMIZE_VER='4.5.7' -e INPUT_TARGET_DIR=/tests/overlays/fail-test $(docker build -q .)`