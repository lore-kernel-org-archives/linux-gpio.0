Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669A46A5EE
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945713; cv=none; b=gRYxFo4qjx0TPkXXecsu50NhED0gKP15cTKj8xyRCo2AJTGrYmkqCo+Ut/Y12OG/loqdnlTnZujXHPx0gYfiYM4A5bA6H1AU8Fr7NwdhJQp84DHW1zx41rtK25QICEXXyDKqQZuaL3DaZjSMJbDB7gGI5xWtXh0nXNS/CJ7Yg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945713; c=relaxed/simple;
	bh=vwFoyYFNblHuOjQD2wTs82kHOetNQh5rkCkHM/W68VM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I6GUE+Gu5HnfjiRW278DecagJTw3HaAzDKe/IlsID5TZdgjcm36HYUxBwjIL1V+a1iYYo/lM5xBDiLL7NLTCPeaaeTyHD1DZ6eH4XqzBORyJKrYJAZGJAQdMDpNQATF1h9jFLF06JNtgtXg4vJYPjUUa4K7q7UAHg2gTw5A3Bb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwGy6LC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwGy6LC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EDE1F000FF;
	Fri,  2 Oct 2026 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945712;
	bh=kcIzxiRw5j/Q7N0XZjGQiEgSRJ2+Okdi8LPzKUU6yPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IwGy6LC1YJ+1XIgjfX36OQGEFE+HySHHG7mpCf6Y1ORqBSNEl4p05MXAHpEMuZbfm
	 hLeZgr5PNzoxh+EquamMbrMLsfg0XbomE8iwC2eSVRNwKxrfb698p5QrQFgiwCah/x
	 0kiYlfx9il7s48MHFAJONpcEkOKs3/RmXSre7rIWIqkDrvpcUn6H3n7y/cPZ1k2b6m
	 Vo2GwMVzZCefETsu30gYnCJvWMyFwkCmhrS/AaL+p5B4aPrlRZEJbBylR9P7aEOMZN
	 7qDk41N3MipwrNTpPOQbzj+7LT8xceP+T/8BvSh4NpzPoVia9SC2BSSvJp7Y6rI+nF
	 p3yX+FjP7M/OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] gpiolib: annotate struct acpi_gpio_mapping with
 __counted_by_ptr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bill Wendling" <morbo@google.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261002124226.435265-1-morbo@google.com>
References: <20260928063824.1386524-1-morbo@google.com>
 <20261002124226.435265-1-morbo@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:55:11 +0000
Message-Id: <20261002125512.16EDE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] efi/libstub: incomplete removal of __counted_by attribute
--

commit db43ca0ac71b2e4fee34adfbd304bb5744b340e2
Author: Bill Wendling <morbo@google.com>

gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr

This commit annotates the data pointer in struct acpi_gpio_mapping with the
__counted_by_ptr attribute to improve bounds checking. It also undefines the
__counted_by and __counted_by_ptr macros in some of the EFI stub library
source files to prevent unsupported bounds-checking instrumentation that co=
uld
crash the boot firmware.

> diff --git a/drivers/firmware/efi/libstub/alignedmem.c b/drivers/firmware=
/efi/libstub/alignedmem.c
> index 31928bd87e0ff..36248a13f15b4 100644
> --- a/drivers/firmware/efi/libstub/alignedmem.c
> +++ b/drivers/firmware/efi/libstub/alignedmem.c
> @@ -1,5 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +/*
> + * The EFI stub doesn't execute in the context of the kernel, only in the
> + * context of boot firmware, which isn't the time or place to crash the =
kernel.
> + * Therefore, disable the __counted_by__ attribute.
> + */
> +#undef __counted_by
> +#undef __counted_by_ptr

[Severity: High]
Are there other EFI stub library files that need these attributes disabled?

The #undef directives appear to be applied to only 14 out of 45 source files
in drivers/firmware/efi/libstub/. Architecture-specific EFI stub files for
non-x86 platforms (e.g., drivers/firmware/efi/libstub/arm64-stub.c,
drivers/firmware/efi/libstub/riscv-stub.c) and generic core files
(e.g., drivers/firmware/efi/libstub/vsprintf.c, drivers/firmware/efi/libstu=
b/fdt.c,=20
drivers/firmware/efi/libstub/zboot.c) were not updated.

These files still include <linux/efi.h>, which ultimately pulls in
<linux/compiler_attributes.h> and defines the macros globally. Compiling the
EFI stub for non-x86 architectures or enabling generic features like zboot
could leave the unsupported annotations active, potentially causing build
errors or fatal boot-time panics.

Could this be solved by passing -U__counted_by and -U__counted_by_ptr via
KBUILD_CFLAGS in drivers/firmware/efi/libstub/Makefile, or by adding the
directives to a common header like efistub.h?

> +
>  #include <linux/efi.h>
>  #include <asm/efi.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002124226.4352=
65-1-morbo@google.com?part=3D1
