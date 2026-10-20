Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501815;
	b=5IBLLEx/g1RNq++jmNhFUVSNpV5eFwKDbrupy9+FaprmXZvYpxUuUjbC0Q6cS8CqeMEp
	 EIU/FaLcDD3h2sVgHkMrf1JQYS2+CXKSuG410Psxn6AoegvA4/4iRTEOC/z9+pjBjZwpF
	 NX1D2lGG3mbqtA9qQFJJSppzz9xJS7mZa87b8ayA7RBFEWEzGiPaq0ps1PN+JVxJbnmUE
	 PJulZwve9mDUb5nnWmDU+DLPdDQ+/GPlyduFV4KqS5JiO9a91031YKGLmBzxSIFaqCGqQ
	 Bn0QFuObTl/7h3KHhGFl1u8v1+8WlyQDYRDBvK61/FbGzCk10epmy52nLNuL6Yb1Ucg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501815;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=AHwF4GrywFrQrJ3fFZA6/B/VeTJmVV6ylRJiSBLCcIs=;
	b=ymKmN0Km5KFNexJVYKxRtr7gBixS4TErJ5DCBweNIkD3YXVqEJaAsTVaCBiCk7HUKYt8
	 +P0BkSi4nJC7YbUK8ZsLKXcfB+4qer4fmpZ0w1l1+D4sEHgnYMz60yM/5UeYD/jVbFBTF
	 ktr22UY0nuVc4lBP5OazLknVzqy3Rkodo5ePmFxzGq2Xer5V3AY2NLA7n7rQZx5D1vf0q
	 bWuMU9bhbY634gNBwyEmO6L1koy+q750YcKakqw5/76ZDEP2gBzhzAXM+21VA0Mh7mni1
	 d2v0rW+MWdpc0MVHmX0HKWJL6YjwFw98l0T9McYRa98ManW7LVzvG34dpBNdt7ifsQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5TZvcWs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E08606A327
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5TZvcWs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7851A1F000C8
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501814;
	bh=AHwF4GrywFrQrJ3fFZA6/B/VeTJmVV6ylRJiSBLCcIs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=C5TZvcWsJPrkibC9HeIvOvMreaEAMiKa7NexbgdW19Alc3QlU2TbLAiMOvYbjKL8K
	 Qa6VuvIq4D7mcYj1lr1lBo+psn20wyrmwb/LgCK+NLOB0sj3iDGSnoR49R/BWglV0j
	 jEimnKeTkZ6DRgTtYtRFCLICnlE5WaCSGBImgs7PKVBzW9LA9ZcnvyThKtE8uM6cnF
	 R5hG7nYCfCHTEcveR9FCrnIwj60GOACleHexgKV+0/hjgN99zHoLkaSsClK7PQbTll
	 uZShxikdGfIb3V1eYwNnCE5wgkbWUjg9JEL+jxyP0n3aOmk+YGbtxRG2NE8mFQp0Hq
	 /DAlnj2qwXmXw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a75f960be3so34418901fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:10:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2zCv2KJGZourhaAY3raPQIhHGpMZ4xiFY0FMlj5i/ZJ+/ccU1K/XbSxc+FoTd58quMDhEeaEvl6Ln@vger.kernel.org
X-Gm-Message-State: AFq9FYJpWFjLZ6XK4N2rL+S5idN6lGw/GHAHPEH6oGyD1t1QlHsWjz9w
	SVwetCkGcl3nfSPl7PfZSvaV57JkFFcb9DA+IB3vToEuWSyVKkRtixmAYCshc8EwtdZmzu9DPJT
	R23DuHzsx6Vpt6FOw206b8eLIZb4X3zHTiIQYfxTV7A==
X-Received: by 2002:a05:651c:b08:b0:3ab:1525:60ae with SMTP id
 38308e7fff4ca-3ab2927bac9mr24205961fa.18.1792501813212; Tue, 20 Oct 2026
 06:10:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:10:10 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:10:10 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020003728.13669-1-vfazio@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com>
Date: Tue, 20 Oct 2026 09:10:10 -0400
X-Gmail-Original-Message-ID: <CAMRc=McxpU=hAivRV=e_QEVsChsg6SCOqwCsD__qUBogSfv6EQ@mail.gmail.com>
X-Gm-Features: AclHuK86iXxDmlFf8Vc8V7tgaME0DreM-GSJ9-fAIY9CbQB_VB9rqbwcfN_Au0s
Message-ID: <CAMRc=McxpU=hAivRV=e_QEVsChsg6SCOqwCsD__qUBogSfv6EQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] bindings: python: cleanup and support
 Python 3.15
To: Vincent Fazio <vfazio@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 02:37:14 +0200, Vincent Fazio <vfazio@gmail.com> said:
> This series prepares the Python bindings for release to support Python
> 3.15 by performing some minor clean ups, fixes to the bindings
> themselves, and fixes to the script that generates the PyPI artifacts.
>
> Patches 1-9 apply fixes for linter callouts based on the default ruleset
> selected by ruff 0.17. There are no functional changes.
>
> Patch 10 bumps the minimal version of ruff to lint the bindings,
> simplifies the linter configuration in pyproject.toml, reformats any
> non-compliant files, and applies linter noqa flags where necessary.
>
> Patch 11 fixes some compile warnings that were noticed when building the
> bindings for Python 3.15.
>
> Patch 12 adds the trove classifier to advertise Python 3.15 support.
>
> Patch 13 fixes a few small oversights re directory validation in the
> script used to generate the PyPI artifacts.
>
> Patch 14 bumps the dependencies in the PyPI artifact script to use newer
> utilities that support generating wheels for Python 3.15.
>
> Note: changelog entries are not included in case changes are accepted
> partially.
>

Hi!

Thanks for the series. All looks good to me but I had some comments on two of
the patches. I queued patche 1-8 so no need to resend those and I backported
commit 5524758ab4c3 ("bindings: python: _internal: collapse isinstance checks")
as it was marked as a fix.

Thanks!
Bartosz
