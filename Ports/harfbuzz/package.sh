#!/usr/bin/env -S bash ../.port_include.sh
port='harfbuzz'
version='9.0.0'
files=(
    "https://github.com/harfbuzz/harfbuzz/releases/download/${version}/harfbuzz-${version}.tar.xz#a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e"
)
useconfigure='true'
depends=("freetype" "libicu")
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt"
    '-DCMAKE_BUILD_TYPE=Release'
    '-DBUILD_SHARED_LIBS=ON'
    '-DHB_HAVE_FREETYPE=ON'
    '-DHB_HAVE_ICU=ON'
)

configure() {
    run mkdir -p build
    run cmake -S . -B build "${configopts[@]}"
}

build() {
    run sh -c "cd build && make ${makeopts[@]}"
}

install() {
    run sh -c "cd build && make install"
}
