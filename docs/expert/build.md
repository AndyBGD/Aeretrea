---
layout: default
title: Build Aeretrea
parent: Developer guides
nav_order: 1
---

# Build Aeretrea
{: .pb-2 }
Building Aeretrea is pretty straightforward and only requires running a few commands to get the job done. However, setting up your environment correctly is necessary before proceeding to avoid errors/issues.

## Minimum requirements
{: .pb-2 }
- Linux-based OS x64
- 16 GB+ RAM
- 40 GB+ free space

## System dependencies
{: .pb-2 }
The following dependencies must be installed:
- [brotli](https://github.com/google/brotli)
- [Ccache](https://ccache.dev/)
- [Clang](https://clang.llvm.org/)
- [CMake](https://cmake.org/)
- [Git](https://git-scm.com/)
- [Google Test](https://github.com/google/googletest)
- [Node.js](https://nodejs.org/) (installing via [nvm](https://github.com/nvm-sh/nvm) is suggested)
- [protobuf](https://github.com/protocolbuffers/protobuf)
- [Python 3](https://www.python.org/) (or newer)
- [Java 11](https://www.java.com/) (or newer)
- [libusb](https://libusb.info/)
- [lz4](https://github.com/lz4/lz4)
- [PCRE](https://pcre.sourceforge.net/)
- [Perl](https://www.perl.org/)
- [zip](https://www.unix.com/man-page/v7/1/zip/)
- [zipalign](https://developer.android.com/tools/zipalign)
- [zstd](https://facebook.github.io/zstd/)

For reference, here's an example on how to install most of the dependencies via APT:
```bash
sudo apt install -y \
    attr ccache clang git golang libbrotli-dev \
    libgtest-dev liblz4-dev libpcre2-dev libprotobuf-dev libunwind-dev libusb-1.0-0-dev \
    libzstd-dev lld openjdk-11-jdk protobuf-compiler zip zipalign
```

## Building Aeretrea
{: .pb-2 }
Once you have made sure all the dependencies are installed, you can now clone the repository via git:
```bash
git clone --recurse-submodules https://github.com/Aeretrea/Aeretrea.git && cd Aeretrea
```

If you have the repository cloned already, but didn't clone the submodules, you can do so afterwards with the following command:
```bash
git submodule update --init --recursive
```

It's now time to set up the build system. The following command will automatically build all the required tools by the build system and generate the build config for the choosen target device.
```bash
. ./buildenv.sh <target>
```

Now you just have to build the ROM with:
```bash
run_cmd make_rom
```

If everything went right, you'll find the generated flashable zip/tar file inside the `out` folder.

{: .highlight }
*Continue to [How the build system works]({% link expert/details.md %})*
