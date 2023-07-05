#!/bin/bash

git init

echo >fruits apple
git add fruits
git commit --author="Alice <alice>" -m "create fruits"
echo >>fruits grape
git commit --author="Bob <bob>" -am "add grape"
echo >>fruits orange
git commit --author="Carol <carol>" -am "add orange"

echo >veggies celery
git add veggies
git commit --author="David <david>" -m "create veggies"
echo >>veggies lettuce
git commit --author="Eve <eve>" -am "add lettuce"
echo >>veggies peas
git commit --author="Frank <frank>" -am "add peas"

git tag ready
