#!/bin/bash

echo "Download julia"
wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.2-linux-x86_64.tar.gz
tar -xf julia-1.9.2-linux-x86_64.tar.gz
mv julia-1.9.2 ~/julia
export PATH=~/julia/bin:$PATH

echo "Install julia packages"
julia <<HERE_JULIA
using Pkg
# Pkg.Registry.add(RegistrySpec(url="git@github.com:Toolpath/ToolpathRegistry.git"))
Pkg.add("PyCall")
Pkg.add("Conda")
# Pkg.add("ToolpathLambda")
using Conda
# Conda.add("pythonocc-core=7.7.0", channel="conda-forge")
using PyCall
# pyimport_conda("OCC")
HERE_JULIA

echo "Creating Github Artifact"
rm -rf deps
mkdir deps
mkdir -p ~/.julia/artifacts # make sure it exists to avoid error
cp -r ~/julia deps/julia
cp -r ~/.julia/artifacts deps/artifacts
cp -r ~/.julia/packages deps/packages
cp -r ~/.julia/compiled deps/compiled
cp -r ~/.julia/registries deps/registries
tar -czf deps.tar.gz deps
