Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1C3E0244
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934842; cv=none; b=qb5oHt3xfhcGYhKEAzOHhIfMVmrTbTRaGYuuwqiAaWzG6kz14/OY+7yEmb6WLBnHjwFYdDL3FXzhNwZ2tf0mrQA84x6/yb9aGcoS6yjkRlq/NNq6R1A56By21MuI3IVTq3HGBVO5P7FAKfh4l0T5ZfFICxquqppLy9wbM1RHW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934842; c=relaxed/simple;
	bh=6q0r/1TvK+MktTVn74r7g3AEL1reBVSs6U50xmMtSVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTXx+dvskAEA9wHYNzdtl2QiFYI4kW/n21ksA7O6dyUyMrJk0lO0EpgSGQPfrTNfnCymh0d8yPvw4G4sdPiM/K8Tc+rVWsxJRMNULGI7woI66fAIopIV74JCJ7wHVng/uHrHx29XlckYCtqaEsdfZEjGHljoGdMhwoP7kGTOkLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSX/9NHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSX/9NHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9B4C2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776934841;
	bh=6q0r/1TvK+MktTVn74r7g3AEL1reBVSs6U50xmMtSVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sSX/9NHDvpbGfbzkTt4eI+dpk1LelG5GYy14JrFh7TcDCVJWJZbZuVHON1W8MEVVi
	 puIcAJiZkYi9H1oe2mb1oLltK15IiCQPSyfZor4K3yN7wXYkIMXakV8/8xRMnQJ/Vs
	 jt3t2y8AhDyL9xL5k6hlizSFFMAMMt5MKnef6/gJdjXlFP3sAh3JTRzErx0Ib8EjCI
	 UIt/dfMGN5VtO76bi3qCf47pFXkQQssL7dhvVQBnHsHnSgunpnbly2wffKv1FRFERx
	 UJYHZ01X97UTJBb/xPF8IZbPfZOZEbgLt2swvDxHEp59hsCz36FXknW6ZSdzSujXr6
	 sDzuOT5z6F8jA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e91b06006so53192351fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 02:00:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx4A1A91rC6vlT8V184KVxs1ZulzGgtEdbSK0lQwV6tvpO5UgYN
	bGKf3eYfoYoefXsrAWzvHRLyROjthoPrfybVkQBeYysl2SeQDyF3r3W8Hy0fe1PBb5fei98rRTt
	DfqhxWcsfZjlJ/OAmK0c6cGI2y3Ka7+ar8YlkU5BFTw==
X-Received: by 2002:a05:651c:2101:b0:38e:9eb1:693b with SMTP id
 38308e7fff4ca-38ec77f4ac4mr83250951fa.3.1776934840066; Thu, 23 Apr 2026
 02:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422012041.39933-1-vfazio@gmail.com>
In-Reply-To: <20260422012041.39933-1-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 23 Apr 2026 11:00:27 +0200
X-Gmail-Original-Message-ID: <CAMRc=McDMFStyjaUrOBMRhhumkSQJwaHLzd6V8WhpH-kL04ptg@mail.gmail.com>
X-Gm-Features: AQROBzCajDLHBPPBTmopv5ueh3IWi-ALNwwB7ayn6z7bK3Q0vp2NtRme5JnhOik
Message-ID: <CAMRc=McDMFStyjaUrOBMRhhumkSQJwaHLzd6V8WhpH-kL04ptg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/9] bindings: python: modernize C extensions
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 3:20=E2=80=AFAM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> This series performs some minor cleanup of the C extension modules and
> migrates the module defintions to multi-phase intitialization (PEP 489).
>
> Patch 1 makes `chip_get_line_name` consistent with other functions.
>
> Patches 2 & 3 avoid calling back into python to perform C level object
> cleanup.
>
> Patch 4 introduces no real functional change but simplifies the code to
> get the same result.
>
> Patch 5 applies suggestions from from a utility maintained by a CPython
> core developer to help modernize macro/function usage.
>
> Patch 6 conditionally compiles support for using a standard CPython
> function over a backported version bundled within the C extension.
>
> Patches 7-9 migrate the C extensions to use multi-phase initialization
> as described in PEP 489 [0]. While not strictly necessary for enabling
> free-threaded builds, it makes adding support more straighforward and
> sets the stage for both PEP 793 [1] which soft-deprecates PyInit_* and
> PEP 803 [2] which could simplify wheel builds.
>
> Patches have been tested against the full matrix of supported versions:
>   https://github.com/vfazio/libgpiod/actions/runs/24752901690
>
> [0]: https://peps.python.org/pep-0489/
> [1]: https://peps.python.org/pep-0793/
> [2]: https://peps.python.org/pep-0803/
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---

Thanks for doing this. Series looks good to me except for one nit in patch =
1/9.

Bart
