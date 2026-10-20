Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501646;
	b=uhWkVfcR+PSXh0ikmdvhzSPETGDoxc67Fi0rsCWkozEKSZaptoT8o4mSVJo9MzMB433d
	 8L79ButrfrdCH7NeWqr3rytnAHRLYIVjlfl26D+fPig0YbtAWXg4hsLmqGi/ceeSTH7ML
	 ng4TtULrPAPaG8vxkT+On53WrLGuEaeT2trbBnHm5ny+3Jw6RTBiHIv5vhzK92jMlOjbJ
	 t/9hA2kPzc8Obb4zPJX6nMs2yxVahhr7tpQw6VW5tdCno3f+4nUwO51ilBCXoQxWeWxyT
	 F+pEpCz6ikgUwwup63BcijNTHdk1AeTZpn47dvNpXkgaDyoYt3rdHVqXUOFIna3EH3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501646;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=lxFYSv92mrL3xxasmfS3eHeVswZGAH7UgukFMYoClqk=;
	b=IUnIeaR8lnpfaJx18yrjdZY/VRpq9+Vlil/69CTkCkMyU0aYnh/aqBcVy7ML+1c5BJh+
	 PcRcXliF0PWaXMpva93HAg4oFiSWx6d+hebx1+P33XvuvlJ7AIDeTnMd3CM80bM8KjCYL
	 /Ko6vazye13nrFKTpy+P7MxR8bq97rJGf3Sd4neDcvdyd/LAMH6Yl6RFc7ZPFeSUXOFbP
	 kH894KvFKj4tHsn1i30PHKRGSlKumDkFJXywulO4kW36sH7gsKzilZfGZ0vCg4Kv3ppGG
	 guVjyodVDZJxwvyySp//QFytg6ozjauu6u8sG8i4jX2Qg+0EOLNsz8htUYQ5OfkK4mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx6raSVn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4A606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx6raSVn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C171F000C4
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501646;
	bh=lxFYSv92mrL3xxasmfS3eHeVswZGAH7UgukFMYoClqk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Fx6raSVnp6lh/m6bdJ1vYycljeD5qIs+upATvtwYUOsG4+qa8Ud6Mr99b7rM3TUaI
	 bP4oMh2eRY9J45kan1UD7d5wlyrFEB8ZZZAj4PAoFq2wWA4LJhPnNeDcldnN2GA1ak
	 fgMxoEopXNAuYQkm9IjM8Yj38r33QRjkxtwDR0AGvLr1FRnSLJhdWIHuKiSgwSjzwZ
	 pKozRogYxE6TYPBp/gc+kUR8iX2VInZGmBKvnkMCjOW08UgX3KBk2fOy7WJG8cR0tW
	 0Op7lLvcmHFq2a1fT696i1O++/SHJxH7Cln6UqC7HOprZAenL5D87XXcJa93KSh5Mr
	 oWlye1y4I707g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so17871341fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAAZRnT/d3yk+V7RjbWVWB7FCMkWh4IN6njjdbJVkZWOzKGQw/BNmT8EdEzWdTBagJC0Y1vq6X8aij@vger.kernel.org
X-Gm-Message-State: AFq9FYLWWJfEViNGVu+CtxQuxeGH49WoloX+nFGPNHGbaRp0aX7HD94o
	aywoWjc7nUkYXgus7a1fi5FLD1wCF19tnc+CT8eCRYsRfGOfKtuBuGvJhFnxPtKt5WVotmSU3mb
	YKalp673RZhC75gzMPhlaaGpqj873zocjz+6HIo8Xiw==
X-Received: by 2002:a05:6512:b95:b0:5be:52d8:f70a with SMTP id
 2adb3069b0e04-5be52d8f89emr3739720e87.34.1792501644894; Tue, 20 Oct 2026
 06:07:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:07:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:07:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020003728.13669-12-vfazio@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <20261020003728.13669-12-vfazio@gmail.com>
Date: Tue, 20 Oct 2026 09:07:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdAHx6jEw1wcVk-0sdq6HZi1QD++=ySKn0ejsJ5RdGnSA@mail.gmail.com>
X-Gm-Features: AclHuK-qQn8xp1KTrH1Hgl-vcNuEpH7UtZOfP4TQqvJ51HDwRRWG2O5ttDZD2e8
Message-ID: <CAMRc=MdAHx6jEw1wcVk-0sdq6HZi1QD++=ySKn0ejsJ5RdGnSA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 11/14] bindings: python: include Python.h before
 other headers
To: Vincent Fazio <vfazio@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 02:37:25 +0200, Vincent Fazio <vfazio@gmail.com> said:
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

I typically try to keep headers sorted alphabetically. Can you leave a blank
line between Python.h and other headers to make it clear this was intentional?

Thanks,
Bartosz
