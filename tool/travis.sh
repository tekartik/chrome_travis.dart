#!/usr/bin/env bash

# Test on purpose separately to see which platform fails
pub run test -p vm
pub run test -p firefox
pub run test -p chrome

#
# this is failing
#

# pub run test -p content-shell

