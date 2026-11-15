Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728832;
	b=PkzRWWrMpY5iE4/fHTOW350jq3u+ruOiJlvlYr5HddNj4x9K7s1gvXkbB50ipwEHVzG8
	 v+Il3c6BlfwyG7GwN7dHroqpXG4acvGJXhyTFCCR6xW8C6kkyEiQaZDF2Usyxo3V7xVjh
	 C+XfQaTUC9yGjLm1goyUHpK5AZyqtrKFzWBpkHU7EWPce9Ik2wSSgVFmUWZG8P3HSRoqW
	 dhq0RB3GlgCj5kL8KtqSGOoK6Ezar5f+2Y1yV/UzZoO2brhprKFKSgfg6jd+zhKamzKVR
	 iR0eUHTUPqbe4q/zoRcdOfP/u4taNepkSeXhdbIHsUakBYkEAx779IkBLlErIRGs3Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728832;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	b=cui5ZTNRFtANWeIxoh+cXpjz+OtGGl+61KCdrMPpM5ZbiJhixzQQOMH/6HlbBOYPLZZ0
	 0L5MN4oVRQnC3LfITxv54YdUp6ZcpXDa6qEMuqTXfAwB1D6JvcxrQLnXnV5m6iQdvip4f
	 EqoFGrOOAcbzBx1f3JFUc+QdJ8RZb/8qnoOV/NRI39kW4KOJoA3v2gmXIxTtJas3q/cT5
	 rlNivTIYTOrwxT4EUXUDflNNn8kI/ZpX0/vsW1YhmHxyZfAqwW7+iEFV+xCaR6jv5lMbg
	 dyo9hCHO5LUZos1tv8oFpg8O79cVpfOT9yiT9FlNWG/msj62kvOyRRKJWypFuJRJVYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxRcPY1r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA18606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxRcPY1r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639CD1F000C8
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794728832;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YxRcPY1rW49gUfNAfsKTB7Smi931kj4k6CMZR9FdhEcYnTWoIdHqHQkqyo9FR5ggN
	 YtuYGe/GE/iN+HAKtoscrzMj4s4bRq1i1kyV5VQNneO9yuPYW4T47UhXj7hPgGYDaq
	 Z4Z5BhwEkwWPigcem8SLjMVZp/98qvAd8MEEsLLSOaQzVqr/V3S0qsj7L/1o18HPV5
	 XQCGCVqNq5kqdcyy3IySeIRyD9O5/ePgCPFDMi7qfRhk64g+mMSfOmqNkHYUclTEVs
	 ZF66ztw/L3Oiwk2/qAd6ZANfQxieVAdVy16Q1KXL6VLRDVXF+/h6rKoKh94yd8AeST
	 9mM1AHhC0R1zw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso35988401fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 23:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEb4vgEvF5XFJplWE/EUNLfwCPkaPv62LiNhP4FRQWqJHviP3eknw363zwjBf0FIyvlf5fQPm0wqkXD@vger.kernel.org
X-Gm-Message-State: APuU4Z8vDj36y2YZsIFM8Ph8fdAUyQ/46TrJCiLF/BnxonbNuNGJn3GJ
	5HUg4TIof3YGwzzFhl9Srcw5pAaoqhLl+oN5O87hjKHeZ3E1oZ8IUHmwzsGu4B0fximsqH9+MJ4
	E7UjZ8Q4QeAFXWy96VU+xhfcNwxHQRPQ=
X-Received: by 2002:a05:651c:e18:b0:3ab:185f:575d with SMTP id
 38308e7fff4ca-3ae2b4bada8mr16065201fa.4.1794728829847; Sat, 14 Nov 2026
 23:47:09 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me> <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 15:46:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
X-Gm-Features: AclHuK8xqthT2mk78Qu4LiOErq4MI1hrWtnj6E-DaIslpwgy2sOPNhpmEiJiSYo
Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:32=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> > =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via =
B4 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >
> > > Add myself as maintainer for the V861 bindings, clock and pin control
> > > drivers and device trees.
> >
> > I think traditionally sunxi do not add maintainers for specific SoCs.
> >
> > Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> > item instead.
>
> Usually no entries are added at all.

If you do want to help out and review, please add yourself as the
reviewer instead (since you aren't the one taking the patches).

ChenYu

> >
> > Thanks,
> > Icenowy
> >
> > >
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > >  MAINTAINERS | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 93abbb315065..dfc300dc1eb2 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -24031,6 +24031,18 @@ F: drivers/irqchip/irq-riscv-intc.c
> > >  F: include/linux/irqchip/riscv-aplic.h
> > >  F: include/linux/irqchip/riscv-imsic.h
> > >
> > > +RISC-V ALLWINNER V861 SoC SUPPORT
> > > +M: Han Gao <gaohan@iscas.ac.cn>
> > > +L: linux-riscv@lists.infradead.org
> > > +L: linux-sunxi@lists.linux.dev
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > > v861-ccu.yaml
> > > +F: arch/riscv/boot/dts/allwinner/sun252i-v861*
> > > +F: drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > > +F: drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > > +F: include/dt-bindings/clock/sun252i-v861*.h
> > > +F: include/dt-bindings/reset/sun252i-v861*.h
> > > +
> > >  RISC-V ANDES SoC Support
> > >  M: Ben Zong-You Xie <ben717@andestech.com>
> > >  S: Maintained
> >
> >
>
>
>
>
>
