Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569408;
	b=uguAfzrAFbsFkBB/ST4//mNZrXDcLOyOA6NuidKMkDdFzTzCI2m7Sf+BSy5fsuoL4hgk
	 GDz3AMBsg7B2mR+3Sf9sPW0yPM3amYD7u1bfNZTxk6gGZaNrGWrUxgthkx7eoJh6HaFQ/
	 NdnH+/vYcii4WAUMDIGzaty8lSK+2svQW4ProrTeQqKuSd2xmRhxNpWhXcL7K6tOtf2Nw
	 9rzaZalu0Ygh+c2zboHROvgScgBO0hI7oNwlbRJFxHJiZ5NDKv/UM5yjeRP8mMMCz5+ed
	 s2dFw2sMDtAviLycwRbyZq3cCwLALUKUw82MtbKVJBBTCcOpTCVFDcS6YgNImvCiv3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569408;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=pGKUGbE3C/QBtpb+JaVG68q+BgRGkhaTX7U4Tb3C9OU=;
	b=Gv4zTXpE0lmPPGJbGA8u6NIpoOc7gdRgnHGjQ7C9vJDLJbg5xTtbQnv0HvPHo1I30sNr
	 GYBED3mSWHeU245KDOfNsMnDxI6qmWC0zgeAnQlQ/v0oMM4qR+BXVj+8i7Hz+n5ImZiv1
	 g50HHJfL9yVlMru9nU08UwzYYmBx4CQtOrHoS9IH1xt4JzmygaFckb1ZqR87hTeeKdjvo
	 kmc7p45yYdSq9bJqiTQ1nzNDCar9FWKFDSnem+jBaQOsPh5gup8HGkAvq5I2tVrPBhmHM
	 CdBjZpsLzwg6UPOEVE32hcLSYpKaIsPFj7G5u6QNULZEduTsNhVrRbzqNJ/nFFIzUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXwk5sAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E5606A32E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXwk5sAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618CE1F000CF
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792569407;
	bh=pGKUGbE3C/QBtpb+JaVG68q+BgRGkhaTX7U4Tb3C9OU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WXwk5sAQ4JYQy1epsAf98IWvt1v/cH/081AY57bVOfOn6fo4Zo8UHTG9T7exy0JeB
	 wiHBV43siCt/v1lr8YkEKX9qi6U2Gov0J1zfYD4vU1VY5qPXB5YnbHxDTrnh61o2Ig
	 Xg8vWz85UBn4LioX4NJ0P+SnfgdxWNcT/byj1auDYYt0LtF0ToCyCca98oHcgvd1rr
	 Q8W5eNJ9Y5UhMuFXG+IGY4Ecouz+FG3XUkaOA3X3mWwsVo2Yrz45FyA35xsA9jIjOY
	 rAcSyUsPKWO9hjjw2y0K2q4jQ4QNfyJyxSOeJk8OWoiq0yETXO00oGfAb1pjC4kBnk
	 pCfGXVAyE7i+A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso342630e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 00:56:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6O/2q0YGea8GusTwBqVXHGGofR8cqnzoPWbGh6tCqZccFrk6SJvD4ytf5d73tRn7+dKy+Tib5fvg+@vger.kernel.org
X-Gm-Message-State: AFq9FYII2fWUWHqVgKu1llwUd0qRKJgEXE/WnJzb0kI70wmOcrsQFkKl
	MkNb2pXIMR1lK2ZN7w7aQ8CSLC3jCYaQapjVyf7zzLkDPpiWTsax3XCzzxF3utNTMzX+cLcCj9S
	xV4UcNO7veYcZu/puU+UF4ZdLIiJ/LHtLI3XvExpJRg==
X-Received: by 2002:a05:6512:1053:b0:5be:582e:dac with SMTP id
 2adb3069b0e04-5bfa1cf5aeamr465795e87.37.1792569406079; Wed, 21 Oct 2026
 00:56:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 08:56:44 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 08:56:44 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020211237.16514-1-vfazio@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020211237.16514-1-vfazio@gmail.com>
Date: Wed, 21 Oct 2026 08:56:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeoDPh0w8i4BgwOMjo=bTAChjU8BuCkoDLorSGGVKN_7A@mail.gmail.com>
X-Gm-Features: AclHuK8VxCk7koCaMInaKxUS-ysQChlZqfoNt-3VK5PgXdyn39wxjlTHRbdmj2Y
Message-ID: <CAMRc=MeoDPh0w8i4BgwOMjo=bTAChjU8BuCkoDLorSGGVKN_7A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 11/14] bindings: python: include Python.h
 before other headers
To: Vincent Fazio <vfazio@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 23:12:37 +0200, Vincent Fazio <vfazio@gmail.com> said:
> Per the Python C API reference manual [0], Python.h should be included
> before other headers since it specifies some pre-processor definitions
> that may differ from system defaults.
>
> This was noticed when testing on CPython 3.15 [1] which emitted warnings
> due to redefinitions of _XOPEN_SOURCE and _POSIX_C_SOURCE during builds
> of the Python bindings.
>
> Note: despite the manual stating that `PY_SSIZE_T_CLEAN` should also be
> defined, it is intentionally not included. The Python bindings do not
> use the `#` format specifier when parsing any arguments so defining it
> provides no value [2] and it is deprecated in future versions.
>
> [0]: https://docs.python.org/3/c-api/intro.html#include-files
> [1]: https://github.com/python/cpython/commit/927eb448aad6436d794ec9f55780013e25609600
> [2]: https://docs.python.org/3/c-api/arg.html#strings-and-buffers
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
> Changes in v2
>  - Added white space to separate the Python.h include from others
>    (Bartosz)
>  - Added a comment beside the include to provide rationale (vfazio)
>  - Expanded to include tests/system/ext.c for consistency (vfazio)
> ---
>  bindings/python/gpiod/ext/internal.h | 4 +++-
>  bindings/python/gpiod/ext/module.c   | 4 +++-
>  bindings/python/tests/gpiosim/ext.c  | 4 +++-
>  bindings/python/tests/system/ext.c   | 2 ++
>  4 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
> index 2996884..2c7ecd2 100644
> --- a/bindings/python/gpiod/ext/internal.h
> +++ b/bindings/python/gpiod/ext/internal.h
> @@ -4,9 +4,11 @@
>  #ifndef __LIBGPIOD_PYTHON_MODULE_H__
>  #define __LIBGPIOD_PYTHON_MODULE_H__
>
> -#include <gpiod.h>
> +/* Import Python.h before other headers per API documentation */
>  #include <Python.h>
>

No need for this comment, I think the break alone tells the story.

Bart
