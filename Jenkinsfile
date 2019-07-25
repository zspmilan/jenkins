#!/usr/bin/env groovy

stage 'get code'
node {
    checkout scm
}
stage 'build'
dockerfile {
     additionalBuildArgs '--name jendfmd'
     sh """
     hostname >/tmp/hostnamefile
     hanme=readFile '/tmp/hostnamefile'
     echo "I am in the container ${hname} now!"
"""
}
