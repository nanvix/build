# Copyright(c) 2011-2024 The Maintainers of Nanvix.
# Licensed under the MIT License.

# Update package repository.
pacman -Syu

# Install required packages.
pacman -S --noconfirm   \
    bison               \
    base-devel          \
    clang               \
    doxygen             \
    flex                \
    graphviz            \
    grub                \
    glib2               \
    gmp                 \
    ncurses             \
    pixman              \
    sdl2                \
    mtools              \
    ninja               \
    pkgconf             \
    python-virtualenv   \
    qemu-system-x86     \
    texinfo             \
    xorriso             

