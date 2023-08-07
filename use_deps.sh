#!/bin/bash

mkdir ~/.julia
mv deps/artifacts  ~/.julia/artifacts
mv deps/compiled   ~/.julia/compiled
mv deps/packages   ~/.julia/packages
mv deps/registries ~/.julia/registries
mv deps/julia      ~/julia
export PATH=~/julia/bin:$PATH

echo "Running julia"
juila -e 'using Pkg; Pkg.add("PyCall"); using PyCall'
