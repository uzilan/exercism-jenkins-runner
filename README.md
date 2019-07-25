# Exercism Jenkins Runner
This docker image runs a Jenkins server which can be used to run [Exercism](https://exercism.io) builds given a UUID.

As an Exercism mentor, you usually want to make sure that the solution you are looking at pasts the tests. 
In order to do that you can simply copy the solutions UUID and run the jenkins job with it. 
Jenkins will download the solution, comment the Junit's `@Ignore` annotations and then run the tests. 
If the job is green, then all the tests have passed. If it is red, then something went wrong and you 
can look at the log to see which tests have failed.

## SETUP
1. Clone this repo
1. Edit the Dockerfile and replace `<your token here>` with your token, which can be found here:
 https://exercism.io/my/settings
1. In your terminal, run `docker-compose up`

## Running
1. Copy a UUID from an exercise your want to check, for example 347ebe43ad5748b2b1075326835c46f7
1. Open your browser at http://localhost:8080/job/exercism
1. Click the `Build with Parameters` button in the upper left and enter the copied UUID, then click the `Build` button
1. Watch Jenkins run all the steps and rejoice!

## Limitations
1. The Jenkins job can only run Gradle builds