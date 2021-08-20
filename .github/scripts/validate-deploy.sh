#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname "$0"); pwd -P)

NAME=$(cat .resourcename)
ID=$(cat .resourceid)
SERVICE=$(cat .resourceservice)
INPUT_SERVICE=$(cat .inputservice)

if [[ -z "${NAME}" ]] || [[ -z "${ID}" ]]; then
  echo "Resource values are missing. Nothing provisioned"
  exit 1
fi

if [[ "${INPUT_SERVICE}" == "keyprotect" ]] && [[ "${SERVICE}" != "kms" ]] || [[ "${INPUT_SERVICE}" == "hpcs" ]] && [[ "${SERVICE}" != "hs-crypto" ]]; then
  echo "Provisioned service does not match requested: ${SERVICE}, ${INPUT_SERVICE}"
  exit 1
fi
