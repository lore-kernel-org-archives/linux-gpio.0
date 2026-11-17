Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910821;
	b=vw7S2ZFQPHRP2TH0NZ30L1jMhbikdcAml/65py5oi5e9HKeSwKb1UQkxSY7JhhFbr70K
	 777KCi6boNZLEXzi1MZ+kddNnkne0iSrVbAtWEldLqmKQO1zm/IvlBU6AIZrTdiAqRoeo
	 a3+yT2Y93J5v1LhU9D0EcyMjOJlWa6gHddRQX6zH/TUqN80sS/a38yrHjB6Go7X5qCk5g
	 3f7ywQaYDgexkzsjo6/PXHAWl3dw+sT85C6NLCqjmw3hm7oizXLnDPI7L4zX9LaMuAk58
	 c7cfO4M04Z0MJ3U7ynBsVDL3UexpL+Rh76vhUTqt18p5NGhTdRxzCrPHMskCYOsRJuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910821;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LYjA64OY7mzK30+EmXCloZ1d2MnMctrR1lEa4XYe6Og=;
	b=FC3CSOmm3uPJC1p0/0tuxf0xaVn9E8oWPdo57nMHlc0AY/2CwFKc1ErPY5MlzE/dsGwk
	 EbAQLXu2vpnhkzN/TvOaeQA32bUlVasy2ChDa/ld6Adq70+ImIi6za77ourmA3i8bIM6G
	 9ZcyMC7IlNhOezuDpyQgHCEMBb3pFPElV1BqVT6xl5blRF2d7nOlwNkPUkBO38aB2oMlS
	 iBmQJBu8Svq6RZ9rERv9yyGcDVAa3kNRDo/3fzycYp1dqdkmbDFkHqDkyQhj9zfb93rQC
	 kgINkPfDRt7VcL++7TyLMCjdlVEkZzcLppDcUI4I5fR9Dyb/4GHHoEZTGVWUMaovvhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY+cEPzz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56174606A31C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY+cEPzz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334BE1F000CF
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910821;
	bh=LYjA64OY7mzK30+EmXCloZ1d2MnMctrR1lEa4XYe6Og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VY+cEPzzOeQl350iSplr3YTbz/NtmEMKg6hNuwMjP304qeTNTNVYjYn69bfPeDIrr
	 lS7RhvYXF4dCg9CZ8zAIS1K9t+Ts2W6/CwaJXt+xpLSgkZ0KkEjPZXcp/4WYY1aOjX
	 KgvvCBalfuTh7MDTCxX/lqDxO0eqA51GFCKXPRmVhjH860W+HS8ZWHfZiUv4Pdg1Ot
	 NCKtr9f/uT0p7JoxmLwfDWgnAn25r4zqaX1A+yEahv/mz5de0wAQrWh37dAKryhSDf
	 cNDA/Jg4XwFcxwYpEWDh98BL5zveMpdl6T3nP6EeJ1kkzMzwF5iA0j/fkoFcXeZHyS
	 WTgYOuBxjFWFA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2833580e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9JThTbH9819m1Tas1au7mpP7/e9Lf4HFRvn3/FN2xWrPavxY+kLqcO0KeBhEDcAnjagSOKqEaygpL@vger.kernel.org
X-Gm-Message-State: APuU4Z+xNywj8RlzkqPguse+LK/JghC2vQMDjkWnqcF+abdxNEU9CX0l
	NtI+BFo/LEHQ54HCzD0bA42OkVC3dgsqKU/PfTjHoL2mehcLsDT3r01xtC3qc7bbIWILe4GCHLD
	EvdKgL+B8T5BC2OMY6PMxSDpJOR6dego=
X-Received: by 2002:a05:6512:3c89:b0:5c1:57d3:efd0 with SMTP id
 2adb3069b0e04-5c170b45aa9mr4736734e87.35.1794910819929; Tue, 17 Nov 2026
 02:20:19 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com> <au9YgytCc4TKfETI@l3017727.home>
In-Reply-To: <au9YgytCc4TKfETI@l3017727.home>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:20:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
X-Gm-Features: Aa3M54rAvJrdH2ioBjmTcd53sA32PoIoppu6eV1QG1zyBMjvlTxU-cDEh9WFtc0
Message-ID: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: Vincent Jardin <vjardin@free.fr>
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

On Sat, Nov 7, 2026 at 5:58=E2=80=AFPM Vincent Jardin <vjardin@free.fr> wro=
te:

> > Can this be applied separately once reviewed?
>
> I do not see how: this 4th patch needs fsl_guts_rcw_read(), and
> few other fsl_guts_*() which are from the patch 3.

OK

> Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land=
 into the pinctrl tree ?
> Then, patch 5 could be managed apart.

OK let's try to do it like that.

Yours,
Linus Walleij
