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

Executing the following will build a base image containing a ready to execute version of "dbt".  The argument passed specifies which version of "dbt" to deploy and will also be used as the image tag when it is pushed to the [Google Container Registry](https://cloud.google.com/container-registry). The repository name being:  gcr.io/[PROJECT ID]/dbt/distroless:[TAG_NAME]

    cd build-image
    ./build.sh 0.17.0

Once the image has completed building you can perform a simple verification test by executing the following. The argument passed specifies the image tag of the base "dbt" image to test.

    ./test.sh 0.17.0
    cd ..

## Build Project Image

Executing the following will build a container image, embedding a "dbt" project. The argument passed specifies the image tag of the base "dbt" image to use.

    cd build-project 0.17.0
    ./build

Once the project image has completed building you can quickly test the "dbt" project via Cloud Build using the "test.sh" script, as shown below:

    ./test.sh
    cd ..

## Modifying the "dbt" Project

The "dbt" Project which is executed via the above Project Image is located within the ["build-project/project"](https://github.com/winterlabs-dev/dbt-distroless/tree/master/build-project/project) directory.  Replacing the contents of this directory with your own "dbt" Project and rebuilding the Project Image will embedd your transformations for execution on the next run.

When you invoke "dbt" it will first parse the "dbt_project.yml" file within the Project directory to determine the name of the profile to use to connect to your data warehouse.  "dbt" will then check you "profiles.yml" file for a profile of the same name.  The location of the "profiles.yml" can be found within the ["build-project/profiles"](https://github.com/winterlabs-dev/dbt-distroless/tree/master/build-project/project) directory.

