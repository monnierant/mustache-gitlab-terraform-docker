#!/bin/bash

pwd

ls -l $CI_BUILDS_DIR/$CI_PROJECT_DIR

ls -l $CI_BUILDS_DIR/$CI_PROJECT_DIR/$TEMPLATE_SOURCE_DIR

# mustache template secrets files
for file in $TEMPLATE_SOURCE_DIR/*.secrets.auto.tfvars; do
  mo $file >$file
done

# move to the terraform folder
for file in $TEMPLATE_SOURCE_DIR/*.auto.tfvars; do
  mv $file $TF_ROOT/
done

# # remove the run.sh call from the args
# shift

echo $@

gitlab-terraform "${@}"
