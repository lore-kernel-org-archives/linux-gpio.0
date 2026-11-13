Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580989;
	b=1pWWnfL2MuAojzvSqWg22yeaT61sm2P2FuIx84sYfOUpzeH2WDO1m1etzcYbpWLVUeTL
	 xJ5rUFOHkKONywy/gVzDGhyUGxtQ2OR859Fm2p03UWOFFlV7u9QncCG8Ld3jXYA4GYVK4
	 i//CJVNTvbTFx77ieYwHTRowcDseb3EPA9hR1hjo0iJvTQxNmMGdZn2pwFDKaWvirviYR
	 EqOgH3IVNU94fZPiu36N+7oIe9k/z/zgGrSLG1Xo6JENiuZDHMK1rbSoQyUVpYRrEiyq0
	 9TTR0ZAkPeemS04jJc1RaJQUS8s4kMX/XjaoMUQ+hdv10YTd6wIx+aNtGInf6igyy3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580989;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZeJA76pSYL/29D1SUxOsf1XnK3pl538xdtA25Rrvpo4=;
	b=cFN7NYwOX+xKetQ1QXwUzi9FJABm3C+c/UYxJ+R5fFDc6+bglEH7abwVpsp4iyOPEwEk
	 a0gAzkpslTmSTBHp/jWsHrhzcnshRxkEFoU2JjVslTwt0zkVzgMXjW5eKmUw9CaJGIBGu
	 1xwKoyEY7gXq07fi8xZMFOfEg7FadsTKURMToZhpFH44WRjip51jvDWWAclC4NhK7n2Kg
	 LzZo2Jz0BiwW7eNijjipmzyFL2IepdWfZ2aJvtivqpFa6SsZYRtWsUNl9TGlHdNOnY8nF
	 eP63m9+EbPOnplQRf54MUXKI+Zcpymem5ySl43gnmPRWiJQMWdnbSReNx2ghngMGFxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1s8OUdm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA586606A323;
	Fri, 13 Nov 2026 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1s8OUdm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FF81F000C4;
	Fri, 13 Nov 2026 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580989;
	bh=ZeJA76pSYL/29D1SUxOsf1XnK3pl538xdtA25Rrvpo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1s8OUdmwP41N/y2KWKb5jHCOlvKLqkZBWbDu3E14YEh5d76fNLkhxj1nUGmB5chr
	 7Sj0wBrGftxeG7S73VUUhCDhVwtQ0KlbpL/3bWT4vz4d5kYedh2cXX2pqCpSoDU0hI
	 urYVSrcZI0pIHIlyazLa6XUoGn8nmLbNcCCJUQFlZefVZQnzqdqI93UQHPfuoEJ72E
	 pDsYdbop+FjGLAmzwafXZt801QB6887kHaxQ5XuTrp4EE7sPTZAIgVeMb8mh7KTU5E
	 Eu5kZT0S+YCgXQTzWZEIw4F2HVmyIjNvEuD+V38wOUZkMqUCgKWGCkPdYuTnm2lXSe
	 3hAQ3kpK5bNTA==
Date: Fri, 13 Nov 2026 08:43:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	Jacky Bai <ping.bai@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
 mux
Message-ID: <179458098591.828545.5346870650734056259.robh@kernel.org>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-1-5a0063f1da9e@free.fr>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-1-5a0063f1da9e@free.fr>


On Sun, 08 Nov 2026 11:06:49 +0100, Vincent Jardin wrote:
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW: read-only in RCWSR12..14 of DCFG, changed at runtime
> through the override registers of its DCSR view.
> 
> Describe the pad mux as a child of DCFG at its RCWSR12 to RCWSR14
> window: the override registers are at the same offset of the DCSR view
> of the parent. One group per RCW field, one function per encoding.
> 
> Each function lists the groups that take it, so a pair the driver
> would refuse, such as can on iic1, is refused by the schema.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 264 +++++++++++++++++++++
>  1 file changed, 264 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

