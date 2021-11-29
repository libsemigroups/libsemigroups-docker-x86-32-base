This repository contains the sources used to create the base Docker image at
[libsemigroups-docker-x86-32-base][].  Everything that is required to install
[libsemigroups][] is in the container but [libsemigroups][] itself is not
installed. 

If you have [Docker](https://www.docker.com) installed, you can download this
container using:

~~~~
docker pull libsemigroups/libsemigroups-docker-x86-32-base
~~~~

and run it by doing

~~~~
docker run --rm -it libsemigroups/libsemigroups-docker-x86-32-base
~~~~

[libsemigroups]:  libsemigroups.rtfd.io/en/latest/
[libsemigroups-docker-x86-32-base]: https://hub.docker.com/repository/docker/libsemigroups/libsemigroups-docker-x86-32-base
