# Distroless dbt

[dbt (data build tool)](https://www.getdbt.com/) enables analytics engineers to transform data in their warehouses by simply writing select statements. dbt handles turning these select statements into tables and views.  dbt does the T in ELT (Extract, Load and Transform) processes.

["Distroless"](https://github.com/GoogleContainerTools/distroless) images contain only your application and its runtime dependencies. They do not contain package managers, shells or any other programs you would expect to find in a standard Linux distribution.

This project takes "dbt" and deploys it onto a "distroless" image using [Google Cloud Build](https://cloud.google.com/cloud-build).  This then provides you with the most compact container image for the purpose of executing "dbt" projects.

The project is split into 2 parts:
- Build Image - which builds a base container image for "dbt" on "distroless".
- Build Project - which extends the base image, providing a simple structure to execute an embedded "dbt" project.

## Clone GitHub Repository

From within [Cloud Shell](https://cloud.google.com/shell), first clone this GitHub repository.

    git clone https://github.com/winterlabs-dev/dbt-distroless.git
    cd dbt-distroless

## Build Base Image

Executing the following will build the base image for "dbt" version 0.17.0 and push the image to the [Google Container Registry](https://cloud.google.com/container-registry) with a repository name of:  gcr.io/[PROJECT ID]/dbt/distroless

    cd build-image
    ./build.sh

Once the image has been built you can execute a simple verification test by executing the following.

    ./test.sh
    cd ..

## Build Project Image

Executing the following will build a container image, embedding a "dbt" project, using the previously built image as a base.

    cd build-project
    ./build

Once the image has been built you can execute the dbt project via Cloud Build as follows.

    ./test.sh
    cd ..


