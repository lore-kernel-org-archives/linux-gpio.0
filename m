Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868401;
	b=IDElXgSrOOl3aU2cY6dxeFjevPOKBwqD6gYx7JLnw2j/AJLTIWqCDhzb6HlGcoWMHrTR
	 2wgQPRmrOeJtH/hQ644bXfkivsPKoq/SZxqJNovbIqzW4Xbc79FNBfkwaql+N/wIColjq
	 yA6c2zn4GqL1LbD9OWlCX+va+/OOnIik2q1taQ24LTi4+f+35C/sceiTWbP1QoCCyq0xo
	 gsUzvLoXgNl0oPNaODwSt7rDtjBiJ+0cwte6IggQO/HKmPCNnIp356Amo1BMGYads3F5a
	 +/lzFgQU6l+iGPQRVzN3D6XHkeSSBaxkFmbjFUkSzZ70GbAwamG6Bmf0GfAFCOHhW9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868401;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	b=2aTpDGcSAYkduNyLwmlfEjb9OLtxYDW0ohVbaaHWdiW7vokZha3m/scjiwzpF1HNG9R1
	 W0xQbSB4SnizspId70Xr3VcFNXzH/O4eEwkhUW1P+6lK/E7ITL1ySrMbVjMTFb0dcF2vo
	 iV738zBVO1BQfyTdOrxIhGd8HwHUewEtUEO/30XWQP8H4rF/nJFJFGAMIdeES1SJ3JVZL
	 KU+G+P1khGNinHIaSyNtz4zAkhlCDYo/32O3AmlCyEWTtw18UHYjknJaQrY10pHBZxBF4
	 R1nfju9LEz0D43Ou+Iip+t8AXscN89b9HOt7k/hd2Civp/eyrxCHUU0Ig7CsLlWxfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C2606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624961F00A1C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868401;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1ZMAeBQg6kCKHbuLmKMILx1ALCaS8Y0+Zqv0lRRgMedLGAqlsZG4uMez8fFtNAiU
	 /9iZK3348TAcStbdMMj1Ha4SogTv7sAy/TwkXNmql/LXQnCO2u/Ek83dq2QJ1uxHPp
	 ZNqM+jjFbnWdJSPFseY3diiIKuduVtFL3hLqr6tfc+5FAIE7yN98EP5SwFiuiU2M5C
	 qlU1+awYIYsBjDa3qpAIpH2kn/c0b+grnMmEnFrxfnC54FsN8lUy9XSfFe8EE/w0/O
	 epZ2aGNmdGBgQVlox4t1PiX0DOxfXhIZpb9sRP7vE+kEY3yzX7P5YKrga9+ReXyTgn
	 nMWxOLx1lZ3hA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1307157e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxCwW8o78utlFofxqjN78dAxDcWGw6djSxUqBCKZeF6jaF9wXerZ14cLuxevIfJGvExu986c2MC1fCA@vger.kernel.org
X-Gm-Message-State: APuU4Z+tSCcEMzjFAX63kzD4h4X263QJ0xOu7JaJImPliGLQEvWcpSu6
	Lf7p0IOWRvHh9k4bUR4rQWAJ4wf9LxY7k+Vb/F3af1LmM4bkuItvJjmDiixodouMd4vXbwxdUO7
	CCLsE/SsjnT0jFkyrxQH5nW3D0yMQo3M=
X-Received: by 2002:a05:6512:6082:b0:5bf:fd1e:1677 with SMTP id
 2adb3069b0e04-5bffd1e17d2mr318092e87.63.1793868400125; Thu, 05 Nov 2026
 00:46:40 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:46:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ETflp150o6Y4D_MC0oBw9nE3K4Lvwb5z2qXB53rv4YdppYnKd_3n9_hE
Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:52=E2=80=AFAM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> From: Vincent Jardin <vjardin@free.fr>
>
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
>
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Does this have compile-time dependencies on the other patches or
can it be applied separately to the pinctrl tree once the
maintainers are happy?

Yours,
Linus Walleij
