Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797794;
	b=sgM9LvBZLx/1SA1ivITP2QwnpGNmmktv2abOjL42EQymCFRLJdJqnhCUc3UdggX81Cak
	 UN0ESh1AWUF8NnzVquqlgyJAvQsWK27xcEnYQ28bPnYhs1OgdJDCnFIPiPsgs2Qj42Ln5
	 ugLAnc4THQrKcQlyWt0obilj5w1yDOKIJQ5QNFtlwSjbgpT4C+v+NMaN7f3soL6KnHo6f
	 QY8QI5QVMVKEJhoQSokPevJkNQzxeivtWGJq3FIFU3NWPfx1/jf/t0IhIscD6ZErdaPTo
	 PHo4WxdY+tzx3dfYFakQy5gfecCwNGbvZmA4Y8fJ+pUEm6ejbRto8+PWNj0DgBii3eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797794;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwyyLP9uPhqquv/1QCNLs+JtuCDwjysCkbHKh7eBSSM=;
	b=hH8kgU6bE3VtdBnShCbrk2V2Sn5Y1jE3WrNqOYo8mmCj19yfnvLLFSBqah15CgU0QjgP
	 DvEJbildwfsx+fFmxS0rfDatKKkq5ayrgEqOt82tSAsxDwJ3awZs+SFzIBDb+yM3JvPo0
	 y8wyvcgkK7YzcG9lbdwoVHoggyzMw2MXvnV91LaqHS3lnsgsPFCMfE1LIrM6EIhYj69Mc
	 b+0qsnG9V/BRZUF5A4x0KGOoFVVxeVyoFZ6VnSIXjToDSDDJmAhGusr5KI/1lYSGDEKRL
	 MbjhwzhRpWOgMagzab1+jUyDL6TULujhLCsnGzrRNeJY7WDTWcDyukeoDX+GuhbnQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHyDjjDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72744606A332
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHyDjjDi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104951F00A17
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797793;
	bh=xwyyLP9uPhqquv/1QCNLs+JtuCDwjysCkbHKh7eBSSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PHyDjjDi9zwDhdWdu/GH76iLs0Y1SrbvSiJ5STD2qoT+AofMfCf83eTxF3lAro1Xx
	 dH4914C0OzzfXQ2FTsN9iWIAkY5vPdyaf9jHM+58QMyeMGjDTuuGyk6lPrBPlzwf6H
	 pjYM3X00xYCeHSowPr6jgB0x/ZnCkBCUqPmOr0n0UZysjG6FL80A9qAvHs53n6JqZ4
	 kGDWaWRbsQKTr21MNvKMxaYLUVxtSfcDY4tncGb+A48ZaBDARo5VmrnQg/dBt1qeaJ
	 j5cl7IiMA/ID61mg1/WGtacMPXaPLCRqhaY6IZqRgGGkITFVbodbdlbL7TPro+/r45
	 0KOKCyJlnMMPQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba328513b9so543117e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByTeQELzwE8uOem7OPnBiPl0H7LmzHVYF5wuz37xeHLskZl+wocNUl3CQ9hmQct75jS3dK4lB5e6hmD@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ck6BhjosBgVGjjuHRwNN/KPlaPMayp2NkMF1CP3BmSWm7w8eE
	Hz/u50TR7Ug+PoOuqXqXXY9CMgPOlRh3at6PYYM0Bmo3yeGBvl93Vl/jyfdzsFGsYQ+3YZJYv9U
	Y0VgAYfK3oluy6dcpyNpu/2miVcNWJqw=
X-Received: by 2002:a05:6512:2398:b0:5bf:ddef:7852 with SMTP id
 2adb3069b0e04-5bfddef9a55mr5642927e87.17.1793797791886; Wed, 04 Nov 2026
 05:09:51 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com> <20261021190212.2237804-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20261021190212.2237804-4-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:09:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRzTuh8pj5bHt6p9hQm3eoQ_fsV4zNNDoF6p12yO4Otw@mail.gmail.com>
X-Gm-Features: AclHuK_rs_aoVemsqZvmGaFtptlvPXeCNaMoSwjDWt11FcgwN-9NGfoyeGoPKLo
Message-ID: <CAD++jLkRzTuh8pj5bHt6p9hQm3eoQ_fsV4zNNDoF6p12yO4Otw@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Switch to using __free(gpiod_put_array) scope-based cleanup facility
> in gpiod_get_array(), simplifying error unwinding and eliminating manual
> gpiod_put_array() calls.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
