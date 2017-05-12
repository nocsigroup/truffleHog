
### truffleHog-CI

Fork of [truffleHog](https://github.com/dxa4481/truffleHog) with needed unicode handling and other stuff. Also dockerized.

### Build

```
docker build -t trufflehog .
```

### Usage

```
docker run --rm -v $(pwd):/src nocsigroup/trufflehog:latest file:///src >> trufflehog.txt
```


### CI Usage

Gitlab-CI
```
trufflehog:
   stage: scan
   dependencies: []
   services:
   - docker:dind
   script:
     - docker run --rm -v $(pwd):/src nocsigroup/trufflehog:latest file:///src >> trufflehog.txt
   artifacts:
     name: "${CI_BUILD_NAME}_${CI_BUILD_REF_NAME}"
     when: on_success
     expire_in: 1 week
     untracked: true
     paths:
     - ./trufflehog.txt 
   tags:
     - docker
   except:
     - master
```
