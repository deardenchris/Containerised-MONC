# Containerised-MONC
A Singularity container for running the Met Office NERC Cloud model (MONC)

The container definition file is based on the [Vagrant metomi-vms Virtual Machine](https://github.com/metomi/metomi-vms) and the libraries listed under the [MONC dependencies page](https://code.metoffice.gov.uk/trac/monc/wiki/MoncDoc/MoncUserguide/MoncDependencies) (MOSRS access required)

This Singularity container is bootstrapped from the Docker Ubuntu 18.04 image. Installed within the container are the following libraries:

   * FCM
   * subversion - SVN
   * netcdf-parallel
   * hdf5
   * fftw
   * mpich
   * gpg-agent (for password caching) 
   
To build the Singularity image:

`sudo singularity build monc.simg Singularity`

To load an interactive shell within the container:

`singularity shell -H /path/to/sanitised/home monc.simg`

NOTE - without the `-H` option, Singularity will bind your host $HOME inside the container, so that it has read-write access to $HOME on your host machine. However, in this instance it is recommended to use the `-H` option in order to specify a sanitisied $HOME for use inside the container instead. For more info on the `-H` option, see [The Singularity FAQ page](https://singularity.lbl.gov/faq), under 'The container isn't working on a different host!' section.

Once inside the container, you will need to cache your MOSRS password by running the following:

`. /usr/local/bin/mosrs-setup-gpg-agent`

You will then be able to use fcm commands to create new MONC branches, check out existing branches and commit code changes back to MOSRS.
