Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933869;
	b=gQBvtaTqNs2wYO/SCZz/Vq+C9pYd4k1y3zCDYUghf0PjINcOBhfSoZ6fyLmk7r9TR7mg
	 uFALiyW3lh6nCcbT+AcyefRGrXVYLTptqPO7kErFBLQAxNfyzYOHYXacVvcoBiltYEAWk
	 /r4FJYMNCP9gT1c/os5w8x9gUNYW2E5b5fVIxC8XLaNDedsYDqM/eZBEiDJ/BAFOGsQex
	 Lx6gFHYw0cuzowfr0ezX6hSn0VuqSRzLL8w1G8yTQck/VhS/itPLhqiDHRBc/HhvBCcpu
	 VH0rtg49dxUgBDJH/aZnJmgpLDNFMyBVoz+qMOAidJGAppJceYXxrtfpadK99qvTE3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933869;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mmhsYfo4oARdZWXfsQFEQDsYzn+5x9KB/AI2fdJWlJ8=;
	b=oTnCeI8oG+yN9FyGZrqls8O2gscTRyqYLqNMCZXQapOTe0UgtswxIuaXBwvMYd0vj8nr
	 Ie2zPW6anbcmxYeIofBrGW6DCwZ2tpbrUIYDBFb3qEur+5LIx6IvU/BDYEc4R773Uakhu
	 wsBxNOmjqQYDNIlIJwduTvwb43r14880zF4f2qYGBngnX1gANrf4djjQI8J+bXM7R59W7
	 PsYwBtzfwCtF6XTcHVD/vVq8Hh89WmI2ouSaTV5H32fRAmh0ao5oJT1EkbxsLVyeEHo/Z
	 pRxH5J7/XBQGMdw7st5znI0KTjYRYjPn/ZXHq3zLg2A8YKZ44S4q3z4r8ixQCKtDhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=oM6f103S;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134A606A331;
	Tue, 17 Nov 2026 16:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2134A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=oM6f103S
Received: from L23803.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 505A978050F;
	Tue, 17 Nov 2026 17:44:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794933866;
	bh=8l2fTCrBkpqaY8HCGM4+a4lOBeNcGWo5zClpf/ajZ4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oM6f103Ss/FYzVeyiPMkUl88MqlTQDs0RMWOZ/YH3RrGQ9jocwoPKT4ozk682LsEL
	 edaTT5pXBvxGo6YRUjs2zEEKVzeoguISXqseXFnycNDnsnf9DNBYoi4FWlTMweSBDn
	 o1VOEeATe1ZhFbc8EBpEmVf5nfXKBx7QajVgGRpq+32vod1+9bjRErp9cGfmCK2L0c
	 Bzj7pTLCGTrVyOO325anFqd6AqlCtO0b9e/X0FFSqAiOK2TRSXb9JQ3Cie/rYT0e0p
	 lc0C1MF+QDCdHJfXwNmlkI/XPfXNTvon8HzJCOFSgxDLTAfEISvhSdUo7sX2bUT0Z/
	 nMmm42FPMwU2A==
Date: Tue, 17 Nov 2026 17:44:00 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v6 4/5] pinctrl: freescale: add the Layerscape RCW
 pad-mux driver
Message-ID: <avyEUKJBiDwxpLt7@L23803.iliad.fr>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-4-fbdce4565a5c@free.fr>
 <avtsY-7-I7_pdyD0@lxl00025.wbi.nxp.com>
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
In-Reply-To: <avtsY-7-I7_pdyD0@lxl00025.wbi.nxp.com>

Hi Vladimir,

> The "i2c" and "gpio" functions of lx2160a_sdhc2_data74_funcs[] here
> hides some real unpleasantness. These 4 pins either get all assigned to
> I2C7_SCL, I2C7_SDA, I2C8_SCL, I2C8_SDA, or they get all assigned to GPIO.
> But they cannot be assigned in pairs of two (or individually, i.o.w. not
> in the granularity we need), which makes independent I2C bus recovery
> practically impossible (i2c6 as I2C while i2c7 is as GPIO).

yep, the doc is clear about it: SDHC2_DAT74_PMUX is a single field for
the 4 pads, 0b001 gives GPIO_2[18:15] and 0b010 gives IIC7 and IIC8
together (RM rev 1, 4.9.8.9). IIC7 and IIC8 are not available on any
other pad.

Checking from other angles, the A-010650 workaround uses one write for both
buses: 0x700100130 = RegA OR 0x031. That mask looks wrong to me though: bits 5:4
belong to SDHC2_BASE_PMUX, and OR-ing 0x001 onto 0b010 gives the reserved
0b011. Could someone at NXP have a look ?

> The way the code is currently written, the pin_request() call will fail here:

Yes, in fact, it is not new with this series: both nodes have shared the
same setting since
  8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
from Carlos Song (NXP) where the two pinctrl-single states covered the same
bits, so the second controller would have failed the same way. Wihtin the
kernel, there is no board that enables i2c6 or i2c7, so nobody did hit it!

> Due to the fundamental issue of this limitation, I don't think it makes
> sense to have the pinctrl states described in fsl-lx216x.dtsi for i2c6
> and i2c7. Perhaps you could remove them in another change (either as a
> follow-up, or another patch in v7 if you need to resend).

Done for v7 as an additional patch: the DTS drops pinctrl-names, pinctrl-0/1
and scl/sda-gpios from i2c6 and i2c7, and the two states nothing else uses.
A board that needs one of these buses can add its own states, or set the
field once with a hog on the pad-mux node.

I tested on my board for regressions, since there those 4 pads carry
the eMMC DAT[7:4]: the other I2C buses still set up their GPIO recovery,
and the eMMC still runs in 8-bit HS400.

I also went through the other fields. 7 more settings mix two
controllers the same way:
 - flextimer on iic2, irq3-0, irq7-4, evt4-3 and evt2-0 (FTM1 and FTM2 channels)
 - sdhc-spi on sdhc1-base (SDHC1 with SPI3_PCS0) and usb on usb-ext (USB1 and USB2)
No dts claims any of them.

About your previous comment on clk-out: v7 names encoding 0 "clk-out".
On my board, with debugfs, it shows now:

  pin 20 (evt2-0) 0:? evt
  pin 21 (clk-out) 0:? clk-out
  pin 22 (asleep) 0:? asleep

and the U-Boot port of this driver shows "clk-out : clk-out" in
"pinmux status".
My take: the reserved marking comes from RM rev 1: its revision history
says "Updated 0b000 as reserved" and the CLK_OUT configuration section was
removed, while table 19 still lists 000 (CLK_OUT).

There is a similar gap on EC1: the signal tables list CLK_OUT2 on
EC1_TXD0/GPIO4_DAT03, but EC1_PMUX only has 0b00 RGMII and 0b01 GPIO,
0b10 and 0b11 being reserved. Would you know which value selects CLK_OUT2 ?

thank you,
  Vincent
