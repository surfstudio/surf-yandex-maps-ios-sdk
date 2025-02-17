#!/bin/bash

rm -r Output/*
cd Input/*
cp -r YandexMapsMobile.xcframework ../../Output
cd ../../Output
zip -r -m YandexMapsMobile.xcframework.zip YandexMapsMobile.xcframework
swift package compute-checksum YandexMapsMobile.xcframework.zip