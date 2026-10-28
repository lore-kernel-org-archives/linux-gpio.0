Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185031;
	b=sxvcH95htKgMJFVUifz23uDikAWR4kxtV6Em/UCrKWxSgLDI+p4s+yBHpwaKhwHPnmw5
	 g6MQ75ozVZ3HO3Ze+LY5LdMmEiK/OsgJ4uOPKooOrRRnMe2mfMLA0iJE4+blrF8oGYnNI
	 +bSORG0802pyYNVzeFwWMxeFv3t7gYd+O4Nsa4V0e6Mg7on8Px35cm8nV5VbUquQyYn0x
	 gr0/M9RVrs/P5jq7EWx6S2HOhdUBdAb/WeohR2K1wGtGztziDQLyWuFM5EIByKa/jnDoZ
	 1q3Gd0av2SV8o7uYyuQLufUwlvQ5dHo7Pp/ETjy+X550JcYHiWmsoMaUXxrGpqVKm7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185031;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=CnOfciE7aUrsUL79ZmXxiiRCjQcI0KLaL6MOJkO769w=;
	b=p5lH+Tj7Y+91nfbaVrVBgI/o8chEnbbnqTZj3KU+SDeJHhEFCHqkKdXwY7Fq4/8zRVQV
	 CGug9GJ8JVfTZi97OT/CCM4j0VMEFA5fFr8pIuEarY+3c20h7kDItdVaBkBepqkSMnzl+
	 ar1Kor7XKg7gq7wdJ1d0M3zVekqpOoOxq7ATKh7tFWugtm0JA1zNU1eLwvdT9ae10eJ+G
	 g0A8CehSQThfitcUj+3t5mpDNBI73gudzIRdlSCHOCvtLO5F8OSpvS0y9uYBbW91qZ43t
	 1rbKspDkr6OiZonFej7B6yiu4FsMfafADQ6UWKQFKGFadAMjbXB5VQf5oRIIBMwLskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1SXBczy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21601606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1SXBczy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4901F01825
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793185030;
	bh=CnOfciE7aUrsUL79ZmXxiiRCjQcI0KLaL6MOJkO769w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=l1SXBczyP1b8Lygm4Ce/uhM+zC/Qj/IxcKjsZhkOSKUdva7tRRDl+D8IttoFSZJpR
	 po6eruzeaNnaENKPjmp8zWsJZO4pELFdUq7G2vEe/3YufM/6+eVMLa7WwAk7rQutOG
	 2xycxbQfjmd4BMi21MRCaiAE/671sjD9eZ2LBpZfFqQaoPy5UrQtsoCpluVRlptC+m
	 HoQ8L6uWi4xj5YnYi3Jg58srgO056Md2s+BhnhAnV8XcY1mhmEi4GvfOj2Nyd7H3IQ
	 5bnk3hg28SfU6PdRCLvMoXWewj2v0L3BvdFdFPBFgyxma2Fd2LuNrHyN6qhyuj8omD
	 FPAFyrhHAEqgA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so7354871fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 03:57:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFz7EA3raS2peJqAR/CFD9ooeLAaX/u0v9NiZlNUAR+gbxWVX5dtaU+iCpXZ6x7F1gxt5YC271tbjk@vger.kernel.org
X-Gm-Message-State: AFq9FYKF1AzlFS2x69Vi1pPg5bA1jM01dHuAvuguLoU62IuNcPPd8Co8
	fLt9tKChuoG8FBeLFcA/jkd7ZW/GQjAwuHgTuEfFsLpKJlTm/rCTLAVX/SV2VZlnbCbK1C9mqI5
	RKSEb10G7WGbwxlppZaRm2Jmp3uSeOmmUWKwjprlexw==
X-Received: by 2002:a2e:b887:0:b0:3ab:483c:914c with SMTP id
 38308e7fff4ca-3ac9cf85f47mr4115441fa.21.1793185029389; Wed, 28 Oct 2026
 03:57:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 06:57:07 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 06:57:07 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024123124.3700266-1-yegorslists@googlemail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024123124.3700266-1-yegorslists@googlemail.com>
Date: Wed, 28 Oct 2026 06:57:07 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdC4D4C98TH5scL7gF-hw5CZ=YtLDdi1HjWnkpzXL5vQw@mail.gmail.com>
X-Gm-Features: AclHuK9umZMmCucMgObwTARfXvC1oHbKQaNmgh44QlS7RTcp41hXWS6hgysmqIk
Message-ID: <CAMRc=MdC4D4C98TH5scL7gF-hw5CZ=YtLDdi1HjWnkpzXL5vQw@mail.gmail.com>
Subject: Re: [PATCH libgpiod] build: honor default_library for the installed libraries
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 14:31:24 +0200, Yegor Yefremov
<yegorslists@googlemail.com> said:
> The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
> libgpiodbus) are built with both_libraries(), so the shared variant is
> always built, even with -Ddefault_library=static. When the toolchain
> or the environment requests a fully static link (e.g. LDFLAGS=-static,
> as done by Buildroot for static-only builds), linking the shared
> library then fails:
>
>   FAILED: lib/libgpiod.so.3.1.2
>   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
>
> Use library() instead, which follows default_library, and set
> default_library=both in the project's default options, so that a
> default build still installs both the shared and static libraries. As
> library() returns an object behaving like the shared library when both
> are built, the users of these objects (link_with, pkgconfig.generate,
> generate_gir, full_path) keep working as before.
>

I'm not sure this is true, see below.

> With a default build, the only change in the installed files is that
> libgpiotools, already declared with library(), is now also installed as
> a static library, like the other libraries.
>
> Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---

With this patch, the following commands:

    meson setup ./build -Ddefault_library=static -Dintrospection=enabled
    ninja -C ./build

fail like so:

ninja: Entering directory `./build/'
[111/166] Generating bindings/glib/Gpiodglib-1.0.gir with a custom
command (wrapped by meson to set env)
FAILED: bindings/glib/Gpiodglib-1.0.gir
env PKG_CONFIG_PATH=/tmp/libgpiod/build/meson-uninstalled
PKG_CONFIG=/usr/bin/pkg-config CC=cc
/usr/bin/x86_64-linux-gnu-g-ir-scanner --quiet --no-libtool
--namespace=Gpiodglib --nsversion=1.0 --warn-all --output
bindings/glib/Gpiodglib-1.0.gir --c-include=gpiod-glib.h
--c-include=gpiod-glib.h --warn-all -DGPIODGLIB_COMPILATION
-I/tmp/libgpiod/bindings/glib -I/tmp/libgpiod/build/bindings/glib
-I/tmp/libgpiod/bindings/glib/. -I/tmp/libgpiod/build/bindings/glib/.
-I/tmp/libgpiod/bindings/glib/../../include
-I/tmp/libgpiod/build/bindings/glib/../../include
-I/tmp/libgpiod/include -I/tmp/libgpiod/build/include
--filelist=/tmp/libgpiod/build/bindings/glib/libgpiod-glib.a.p/Gpiodglib_1.0_gir_filelist
--include=Gio-2.0 --symbol-prefix=gpiodglib
--identifier-prefix=Gpiodglib --pkg-export=gpiod-glib --cflags-begin
-D_GNU_SOURCE '-DGPIOD_VERSION_STR="2.4+devel"'
'-DGPIOD_API_VERSION_STR="2.2.1"' -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/sysprof-6
-I/usr/include/libmount -I/usr/include/blkid
-I/usr/include/gio-unix-2.0 -I/usr/include/gobject-introspection-1.0
--cflags-end -I/tmp/libgpiod/bindings/glib/.
-I/tmp/libgpiod/build/bindings/glib/.
-I/tmp/libgpiod/bindings/glib/../../include
-I/tmp/libgpiod/build/bindings/glib/../../include
--add-include-path=/usr/share/gir-1.0
--add-include-path=/tmp/libgpiod/bindings/glib/.
--add-include-path=/tmp/libgpiod/build/bindings/glib/.
--add-include-path=/tmp/libgpiod/bindings/glib/../../include
--add-include-path=/tmp/libgpiod/build/bindings/glib/../../include
--library /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a
--extra-library=glib-2.0 --extra-library=gobject-2.0
--extra-library=gio-2.0 --extra-library=girepository-1.0
--sources-top-dirs /tmp/libgpiod/ --sources-top-dirs
/tmp/libgpiod/build/
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_on_info_event':
/tmp/libgpiod/build/../bindings/glib/chip.c:47:(.text+0x119):
undefined reference to `gpiod_chip_read_info_event'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_constructed':
/tmp/libgpiod/build/../bindings/glib/chip.c:92:(.text+0x401):
undefined reference to `gpiod_chip_open'
/usr/bin/ld: /tmp/libgpiod/build/../bindings/glib/chip.c:100:(.text+0x45d):
undefined reference to `gpiod_chip_get_fd'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_close':
/tmp/libgpiod/build/../bindings/glib/chip.c:141:(.text+0x744):
undefined reference to `gpiod_chip_close'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_get_info':
/tmp/libgpiod/build/../bindings/glib/chip.c:251:(.text+0xaee):
undefined reference to `gpiod_chip_get_info'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_get_line_info':
/tmp/libgpiod/build/../bindings/glib/chip.c:289:(.text+0xc1e):
undefined reference to `gpiod_chip_get_line_info'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_watch_line_info':
/tmp/libgpiod/build/../bindings/glib/chip.c:297:(.text+0xc54):
undefined reference to `gpiod_chip_watch_line_info'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_unwatch_line_info':
/tmp/libgpiod/build/../bindings/glib/chip.c:315:(.text+0xcdf):
undefined reference to `gpiod_chip_unwatch_line_info'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_get_line_offset_from_name':
/tmp/libgpiod/build/../bindings/glib/chip.c:345:(.text+0xdd4):
undefined reference to `gpiod_chip_get_line_offset_from_name'
/usr/bin/ld: /tmp/libgpiod/build/bindings/glib/libgpiod-glib.a(chip.c.o):
in function `gpiodglib_chip_request_lines':
/tmp/libgpiod/build/../bindings/glib/chip.c:388:(.text+0xf24):
undefined reference to `gpiod_chip_request_lines'
[...]

Thanks,
Bartosz
