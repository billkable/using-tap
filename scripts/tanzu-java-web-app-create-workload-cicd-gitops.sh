#!/usr/bin/env bash

# parameter descriptions
#
# - $COMPONENT_NAME is the name associated with your workload component
#   bootstrapped from the accelerator.
#   It will be set as the `part-of` annotation used by TAP GUI to select
#   it for runtime resource visualization.
#
# - <source code git repository> is the git repository URL associated
#   with the source code repository.
#
# - <git delivery repository> is the git repository URL associated
#   with the delivery git repository.
#
#  - <git email> is the git user email address for the delivery repo
#  - <git user> is the git user account for the delivery repo
#  - <k8s auth secret> is the git authorization configured in the
#    k8s basic-auth secret with push access to the delivery repository.
#

tanzu apps workload create <component-name> \
  --git-repo <source code git repository> \
  --git-branch main \
  --param "gitops_branch=main" \
  --param "gitops_commit_message=bump" \
  --param "gitops_repository=<git delivery repository>" \
  --param "gitops_user_email=<git email>" \
  --param "gitops_user_name=<git user>" \
  --param "gitops_ssh_secret=<k8s auth secret>" \
  --label apps.tanzu.vmware.com/has-tests=true \
  --label app.kubernetes.io/part-of=<component-name> \
  --type web