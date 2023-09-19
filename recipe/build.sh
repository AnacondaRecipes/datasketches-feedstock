#!/bin/bash
echo "Building ${PKG_NAME}."

${PYTHON} -m pip install . --no-deps --no-build-isolation -vv
