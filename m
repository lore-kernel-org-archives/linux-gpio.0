Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794796;
	b=x4dIhvzIx6OwsHgbU9OhfeXyMU8tZYUW02LWGfasafLk7CAFWgQGSU1fVTNwcY8amGCm
	 g3naTBtU0nKyN539ye9j0Tx8uCXtq2YNRaayFPUglkOV6xddoC8oslG4bb9ktusc5K3o6
	 9qSPoDJe6EZyca0SJvWlboxDznm3iAnoEy3lbAk7epn40ZK03MOk4SOLjPJL9lOwnE8ZE
	 TNiOIkaeTCVXyxNXZVJ/pMRxuNnlcOFeiLDbJN0dHD3lcmpv85BMxfp3FlknBmQyKiXNJ
	 WGjaA7h/r5hyPYDhBSn+l7BJkxmELnfCXudpPvYzJ5Mxt1A3If33OIXtsOuwbNPu6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794796;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	b=M5JejgpWBYQOWhrgpfZatboq3tfcYa54qCJGSkNSzDTmzBO+mXr+wTikRYA7wU+rD1wq
	 ujyXZV5dy7T0rR21mwXbXskVkLGg25nlxnTELhgBtVTSDnfsHtl20Gj48xXu5nMiZJKGG
	 aBINHH1mPr5iwZMAsXMMHhIg8v47jE+5LtQa6v5LanOXysPJjO2+FIVMnwpe/I3K6+FKU
	 KuMjFyxRqdjqxwyT0FGsSRKRfAO68i3NG5I+a8hKCfCrxIW/a/Zu+7hD0Kv1/qRH7EhlU
	 d/HNkl9SN74noJ1MkiViZT2bHV8/60YPEu8VS1/MvRYBdZfBp+MmGqteUKnG0EyBs/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE6606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF471F00A1C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794796;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bYBN35i8rT5dyUuhJZ8BzmjlTk4ZuycAfAqFlWU0WkCYVmOaCqBtzm8g/W+99MB1/
	 75sEn6/l6QCC6cm9mgv7+2/mTAygCddkOUJHO+aSQ87vRvTjJUjW7o0zea5fOEKj+E
	 vUYzsmn2G/ZaqqzaK0U2n6pm12ZXxe6AaeQQfxHSKFTIh9cEJYOVNL9DHT6KLwBvFC
	 bbehIR7G3CAieHZv/3LCeSNp1CUOflXI7nZhFCXjxEUXe/lgBQD/WG5OFBZnzBaFQC
	 HNKZUEXuWn+/hM19KbSogcIUgtj+m+qfc4v6Ggym4gonZ6fbzK9XD9+zTv3FKs4Phs
	 1M/I0a5yEN2YQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3acd239776cso5640381fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 04:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByg7XX7En6bvV1Q4/pAW5Ys7/7HT6qwWcvkExQbhbY1ZuPdoUHY0JHMFsdP4oFttudWxYY9XYlVuJr/@vger.kernel.org
X-Gm-Message-State: APuU4Z+D/WCRCKXN/31iRp7NcpVfeQ+1oYqklh/kQJQBgpZqM8QLC4bv
	7isBY0WvlfHHv59E2ULrFcn6VJiXDEB2LoM9DkgNgmV9prg9SQ5bl1sMgL0PmNWTUsMNOj2qFwS
	Xr4IYedMkMuMeAdznWzlF+x2G3NyWBGQ=
X-Received: by 2002:a05:6512:114c:b0:5bf:a28e:4ef with SMTP id
 2adb3069b0e04-5bfd956e555mr5361214e87.38.1793794795200; Wed, 04 Nov 2026
 04:19:55 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:19:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
X-Gm-Features: AclHuK-CfwS_0wnxINSAmHAEPIJvv97Wm-Obrw2TLjMQq_EQye6jjyYuZrMjHRE
Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, linus.walleij@linaro.org, joel@jms.id.au, 
	brgl@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prasanth,

On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> not provide working host power control when the GPIOZ6 pass-through
> strap in SCU51C[9] is set.
>
> With the existing GPIO request path, SCU4BC reads zero, but a host
> power-on request through x86-power-control times out waiting for
> power-good:
>
>   SCU4BC =3D 0x00000000
>   SCU510 =3D 0x00000000
>   SCU51C =3D 0x00001e80
>
> The AST2600 A3 datasheet describes SCU51C[9] as an additional
> pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> SCU510[30] is clear.
>
> A diagnostic experiment that cleared only SCU51C[9], preserving all
> other bits, allowed the same GPIO-only power-control implementation
> to power on the host:
>
>   SCU51C: 0x00001e80 -> 0x00001c80
>
> SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> or additional userspace delay was required.
>
> Add an AST2600-specific GPIO request callback that performs the
> existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> when SCU510[30] is clear. Check register access errors and verify
> that the strap bit cleared. Other GPIOs retain the existing path.
>
> This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> GPIOP0-P5 requests when SCU510[28] is set.
>
> Hardware testing on B650D4U with this pinctrl candidate confirmed:
>
>   - Remote power-on: power-good asserted.
>   - Remote graceful power-off: power-good deasserted.
>   - Physical power-button power-on.
>   - Physical power-button shutdown.
>
> These tests used x86-power-control with software button forwarding.
> The earlier board-specific SoC driver, its DT node, custom sysfs
> interface and diagnostic boot parameter were not used.
>
> This replaces the approach explored in the withdrawn B650D4U
> power-passthrough RFC. The new proposal changes the existing pinctrl
> driver and introduces no DT binding or userspace interface.
>
> Feedback is requested on two unresolved issues:
>
>   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
>      Clearing it for one GPIO request may affect forwarding on
>      another pair. How should that shared control be represented
>      and coordinated with existing mux ownership?
>
>   2. The SCU510[28] enable path has not been validated. Returning
>      -EOPNOTSUPP is a limitation of this candidate, not a proposed
>      complete solution for every AST2600 configuration.
>
> Is the GPIO request callback the appropriate place to handle this
> strap interaction, or should it be modeled through the existing
> signal-expression mechanism?
>
>
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

I don't quite understand the status of this patch, if it is still up for
grabs, please rebase it on v7.4-rc1 and resend so we can restart
the review.

Yours,
Linus Walleij
