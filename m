Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588215;
	b=z27fEhK23kKDP4VM9HHP+HPIrMQLUoAbcYENTGsPU1EPTETlYEK/l25xCywxEqxjWHkr
	 cAW32hAZrFxg91D9SZ60aYLJuuRtLJ7zzNH/gBe/fn0cN+EUv0qqs46b+gDm36UfioXJQ
	 NWuAa7viIIjePkz6V5VV0doCeQ+6apv23KSMIFWoM4RGYtYN49MKMPNmMfUOKMHnWOEgj
	 MZXThH8Vx0KzBO8vIj/YSz21MM/IUEjKKJV0xiGOsQsxMg1xFprhC8UcdmaWba3LyZE6n
	 B5lo7jumb1UBnlw55WJZiBvLerS6icCivkCzwIBnH2Bnm8vnO0cyW2QDYDzMjtSKJBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588215;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Von8RsBp854kjbWitsXhRdJUlu1QgEP7MszYVID9w9o=;
	b=CKR3E4N50gYSVEgvnYpSRsu0vPLUGbwXFeskkMZH4hIz+HlJ0BJ/Osqhc9kBvF8IKs0T
	 1Z09Dw66cTnLSS+/D3ctpvJUoUYoBexSHnvArB1L0lSSs7kVm1SJS/3A0uXfvkqHUCmbp
	 o0Mj5cm6d/QFK3X5eKGZp57UjJb3Zvkpb7Ouan7cbtcz7/+V21F/Zuabax+zdfUGMBwZN
	 Ok3ZQOvvfUBV5VUfGg4D5gN4iP9iS53Ch3UnjPM69SrmyTcI+NKTSmDvNaaC2a1zyhN/k
	 HVYvm0AUeWS2qZXlPxqklNlEzHOXJJi6yy3ZQVuMdgCRLC0sCQ3Lea4CInrpSLouuFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=HM6inVUr;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC67606A336;
	Fri, 13 Nov 2026 16:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC67606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=HM6inVUr
Received: from L30177.local (unknown [158.255.110.170])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id AD61613F92C;
	Fri, 13 Nov 2026 17:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794588213;
	bh=5xzBNkaSBIwsby4+iTJvSunuWxT8nAvHfJoI83KVZUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HM6inVUr3h+5hT4j2wq5zg5TH/nz4NrbKLsWvdW8BDitD52J8P8MDhFA0EiO8bDmV
	 mCuBvX4M8HGeSD4Hn2JFl/MlJ+y962RUhxuAubENIx5f1Cu6ZNckGAqfu601STKc3J
	 dsH6aqzOPE5d5WQwxhWCT0OMZJQVVuV4hZWJ1Db0o9cr7q5Zqq2WbrX84oBMkMDoBh
	 mM96MfXiI5GqohedOQdIRui1XYqXe6A8ypHHL5WJdWUht1PxLFs1okuf0eFd3tO3H0
	 zgw38AiCs4gbZp9Gc4sU6SmJ9WA/IcEkgbTkax1N+eMdNlmu+UPQcitr/rU1VnMsNb
	 Uof0sAubw5Tww==
Date: Fri, 13 Nov 2026 17:43:09 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v3 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avc-HWnGVhhR3m8J@L30177.local>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-4-5a0063f1da9e@free.fr>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-4-5a0063f1da9e@free.fr>

Hi Frank,

Le 08/11/26 11:06, Vincent Jardin via B4 Relay a écrit :
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

Following the review on the patch 1 and 2, then can I have your advise
on this topic ?

I am looking for the review of this serie, then I'll adapt it
for u-boot along with the integration of Linux.

best regards,
  Vincent
