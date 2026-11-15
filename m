Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740309;
	b=hNss50OFHkL31+KH1fVsAUJw52DK7P7+QHWqqOAokZ0xqO+7Y4waTFroS6B29pQ/tad0
	 f2mGsyY8rFBdgktA76qwySrnc1m+3lU75wRYjMO3x5B2uuzMa46gCbrG+nMfyhwVNAoch
	 LtuQKGgKXWru3j8CYAnGe3k6JmiUav14uEWuGhDfqupq/GSWBUKnfFe97BEAbHfmwjr4W
	 Z8WiGoHl5sTnC9Zck6WnmCFPQfW4Klk+ujhBRB+5btZYONoaGFf+w5I5TWsQ3l3xduh3m
	 I5Ufq3UeRZTb3WzB1/t7PYMl5XIWgpYC4NyVz8rfLexiOxkk8kZDl37D4+UJhXwnB1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740309;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Oo6MsvNIctmJfVLPk+fHCRU5WjKXgSpxU7tsXgPPo4c=;
	b=eRdMO6mWi7ZDe49i3p8ljd01h45IOShBEal3tlWtIg+wJ3JRMg4H77J1PW7D0D2B4Ox2
	 MMySBAFXKE407jTfUJhCxt33GBmYrDg1KaJCxr+vGCmOI7cTU9EZGzbStMDied0SU2UUD
	 IjAPy1DFQH6oAbilTGLNXHtXYD+nbSXQIo3FKXMmDWYuoChoG8L++bCml2T5eIHDklnuY
	 XVVVUZGbAuvtbzzmwIdxxBKTv2aYTrGv5SmB4c5mM/ST1sCd7SsIaIVLsEg4zgEBT61pt
	 VSxIWgl50S5WBeEyilDOXGkor0p4WNBqWlYu0KOU/fZ6fMTreOscRestHHaJXhArbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfpKk5CA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A157606A329;
	Sun, 15 Nov 2026 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfpKk5CA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69C81F000C6;
	Sun, 15 Nov 2026 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740309;
	bh=Oo6MsvNIctmJfVLPk+fHCRU5WjKXgSpxU7tsXgPPo4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JfpKk5CADmJh15cL0ipophgR5hGcM8bwUvlVvMxfNaNcDh+GXEI99ZYbQfdjtagz5
	 k2XqqsXNZVw7gE3T3ZR/mi3nQJRNPTHJ9LH3jyR5yNFz2MG4ugnhalIsEkuP+//cff
	 4QgdPiXgDvHIfocUPgvYxMWPBAhhnSPP5nb0ZWUBGAUoSQ9AjD6eiWeP1uCefpHfWN
	 aiqZERzJUMtHCi+NsZZtz50+4YA4upVaYCxNj3D7jm4wuBf2XVJFTUAQBQZcrN5CH2
	 aSdeOiopZa+3AegSBHTyac5/fRpvRX5t1Z0EW3ukFDYYSHRmpgZg/YApeD0jgmncJp
	 ULETcSvT9KGTg==
Message-ID: <sashiko-outbox-215432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] pinctrl: berlin: enable module build support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-4-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-4-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:58:28 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pinctrl: berlin: PINCTRL_BERLIN remains bool and built via
  obj-y
--

commit 74a8c9f28b8b05de9543f2486bac3805aa5dc526
Author: Jisheng Zhang <jszhang@kernel.org>

pinctrl: berlin: enable module build support

This commit converts allocations in the Berlin pinctrl core to devm APIs,
exports the probe helpers, and adds module metadata to support building the
driver as a module.

> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/ber=
lin.c
> index 8a612ce2d1d36..a0ae75b1d705d 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c

[ ... ]

> @@ -340,3 +337,7 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
> =20
>  	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
>  }
> +EXPORT_SYMBOL_GPL(berlin_pinctrl_probe);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("pinctrl library for Synaptics SoCs");

[Severity: Medium]
Can berlin.c actually be built as a loadable module when
drivers/pinctrl/berlin/Kconfig still defines the symbol as bool and
drivers/pinctrl/berlin/Makefile builds berlin.o with obj-y?

drivers/pinctrl/berlin/Kconfig:
	config PINCTRL_BERLIN
		bool

drivers/pinctrl/berlin/Makefile:
	obj-y					+=3D berlin.o

Even when a downstream SoC pinctrl driver is configured as a module,
selecting this symbol forces berlin.o into vmlinux instead of building a
loadable module for vendor_dlkm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D3
