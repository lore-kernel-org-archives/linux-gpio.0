Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592F2264A9
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353049; cv=none; b=V1DHCVcLGyi771K9HQ0tWebdG/JtD8aAL026b74O8lw0OqahEqiU4RTxcghe1KtPhdzoOEIe7SB9wQ7O0bKttCXQRXsL/H1edY6hrw0pYtMkG9YkaNxBapdNDPEmK0z63Ty6m9e4zvOIOBIyvhKw9tByozZl+bLH6c3LWpEYPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353049; c=relaxed/simple;
	bh=DShC5r1FYlpEdwvTGleh/FWoVbyqhsjHXvMWRRYf3xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+c1j0+5bfpcUnxPFpeCczKtQedg7hdFS1KQ3iVl/7DpsqjP52Z+4zshoUH5fTWZsrjs5/ula9SBwISscAqghAHsIT4kB5N5bGe8nPU+lsJE2tRSuNBOb+6OY5sTn4Wpv8RbDX+QHnegiWYBCKMqIOzn+B2gYp9qedcyQEHAY2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3tXu0OM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3tXu0OM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F37B1F000FF
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353048;
	bh=atGhvw/mkhyq92WCj6yV0KzowGtNyspd/dVq538KC/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=C3tXu0OMCWI5umA4jJiUlaA0GW3RbybrpBMw+IV/TKIMIdcnaCcNz7udC8qu0fk2L
	 QLlBQUmbDWxv2qzuq0jBg0XqrUyKyZpSzlvqtBxrvvl+6yoOee6gKXZpFlHUgpSej9
	 uK9FvMr9jsCqowdN5OUynrLppQ6yt9meXR99zzb5cdiYdwMjLi4iXzB9nUUekQWZb6
	 YLnw4cxA4MmvhONRN3ac4iVBfZfTH1p8SBGATn1mMRGu50tyvPyazUKx1ZHKlo2Rmb
	 FcJFs/phXJwUV3EF1G8oMzIHAmEYFjB0kQNT46sFNLyLbglpoJ4uq6bUlKCeGaTq4D
	 5yCZ6uRAcIfNg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so889634e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 09:17:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXvn3oRRYsHpTp4yq2r3mYF/6wzhOlOuucNhzPtCIr0OP45Xqt3YjRsoNBNBgOqGUNVmuKlrwuiv6j@vger.kernel.org
X-Gm-Message-State: AFuF++k4fMDgWM2DLqkNymxqsdQz6qcjzgCj+skEhoXx5CiRvNy86jh7
	djghQytL3CJy/FfgsBtApBXVDK1lv5r+CZOQqGMmVm1rFUSKpmkZIoiDjMPdlIUi2bRnd4rvLIy
	hKu5faJFSY4G7293qSeeX7ek3MGUT8O0=
X-Received: by 2002:a05:6512:3088:b0:5b6:95e:87ce with SMTP id
 2adb3069b0e04-5b8df0d4458mr2075364e87.2.1790353047119; Fri, 25 Sep 2026
 09:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
In-Reply-To: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 18:17:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLmfNHXDiZg8zY_8SxbsNru3Ckqwtw2g_q+JG7o9oHQ0cQ@mail.gmail.com>
X-Gm-Features: AclHuK9lxFtrsL2elqTz8K6X4EVhlnaWmlwwKZDiliMTY7fRKnoQTtcknnTB1G0
Message-ID: <CAD++jLmfNHXDiZg8zY_8SxbsNru3Ckqwtw2g_q+JG7o9oHQ0cQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, Sep 25, 2026 at 12:22=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In order to avoid maintainer mistakes on patch ownership: move all the
> Intel drivers into their own dedicated directory under
> drivers/gpio/intel. Don't touch Kconfig options as we historically sort
> GPIO drivers by type, not by vendor.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
(...)

Good idea.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9765e8a72dc78a8f2aee6a6f00f7b5f729b1f457..e68cb1774f8c93facf9e18167=
d8a45ce941a68b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13292,23 +13292,24 @@ M:    Andy Shevchenko <andy@kernel.org>
>  L:     linux-gpio@vger.kernel.org
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio=
-intel.git
> -F:     drivers/gpio/gpio-elkhartlake.c
> -F:     drivers/gpio/gpio-graniterapids.c
> -F:     drivers/gpio/gpio-ich.c
> -F:     drivers/gpio/gpio-merrifield.c
> -F:     drivers/gpio/gpio-ml-ioh.c
> -F:     drivers/gpio/gpio-pch.c
> -F:     drivers/gpio/gpio-sch.c
> -F:     drivers/gpio/gpio-sodaville.c
> -F:     drivers/gpio/gpio-tangier.c
> -F:     drivers/gpio/gpio-tangier.h
> +F:     drivers/gpio/intel/gpio-crystalcove.c
> +F:     drivers/gpio/intel/gpio-elkhartlake.c
> +F:     drivers/gpio/intel/gpio-graniterapids.c
> +F:     drivers/gpio/intel/gpio-ich.c
> +F:     drivers/gpio/intel/gpio-merrifield.c
> +F:     drivers/gpio/intel/gpio-ml-ioh.c
> +F:     drivers/gpio/intel/gpio-pch.c
> +F:     drivers/gpio/intel/gpio-sch.c
> +F:     drivers/gpio/intel/gpio-sodaville.c
> +F:     drivers/gpio/intel/gpio-tangier.c
> +F:     drivers/gpio/intel/gpio-tangier.h

What about:
F: drivers/gpio/intel/*

Yours,
Linus Walleij
