#!/bin/bash

rm -rf docs
zola build -u https://dontlaugh.github.io/docs/ -o docs

