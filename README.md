# randomdlstuff

## Docker Setup

* To play around with the docker setup and allow program installs within the Docker container as root, comment out the following line in the docker file and build:

```
USER $NB_UID
```
* This will allow the docker container to be run as root for experimentation and building purposes. Once the dockerfile is built and completed, you can un-comment out the above line to run again as the jovyan user, which does not have the capability to run sudo from terminal.

## Examples

### Image Classification

* Grab a link from https://PracticalDeepLearning.ai and navigate to [code/chapter-2](https://github.com/PracticalDL/Practical-Deep-Learning-Book/tree/master/code/chapter-2)

