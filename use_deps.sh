#!/bin/bash

mkdir ~/.julia
mkdir -p deps/artifacts
mv deps/artifacts  ~/.julia/artifacts
mv deps/compiled   ~/.julia/compiled
mv deps/packages   ~/.julia/packages
mv deps/registries ~/.julia/registries
mv deps/julia      ~/julia
export PATH=~/julia/bin:$PATH

echo "Running julia"
julia -e 'using Pkg; Pkg.add("PyCall"); using PyCall'
