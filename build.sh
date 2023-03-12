#!/bin/bash

if ! which cargo >/dev/null; then
    echo -e "Cargo and Rust is not installed! Install? (y/n) \c"
    read
    if "$REPLY" = "Y"; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
else
    if ! which mdbook >/dev/null; then
        echo -e "mdbook is not installed! Install? (y/n) \c"
        read
        if "$REPLY" = "Y"; then
            cargo install mdbook
        fi
    else
        mdbook serve --open
    fi
fi
