Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440123;
	b=dLTOiFqrMWM/ZtKfLXo6JdK6JKZPOscFmEEskEdGPkO7NX/+BJDzYlze0BnmlJSeoQXh
	 TCRXicO/x4+SsMD5BvK6Fmteap4s4D6wObO45VbvpFhuffmK/COUlGqwXejl3Vcr0eZCC
	 YpJoGds3WJ5AV2iu8ldoOP0jhafaYOiQ6GI5BTQKqvZHX+DzXY5ebM/zXK5XVme+lKooO
	 SfAHPCHm6GexKdDYH8YCjKw+/jQdYwJJxrSD2S0cDi3bwnugS6axliYJcMqzhulXQROuP
	 mQfi9iiZ3QvrjVYndjQOTpAo2ZGmgtS0fVEWs2NeZMdkQZLhBCPVNZj4YiWPAAf/Fnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440123;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KZfX+ZF6d3jxSf9WpYrXx6unSUfJtLVOGgikrC1kH6U=;
	b=kxP1WuJooXVlqecEBBqWXP23uS+UeNkaHGxPzUvt8kYao2XfKlncETsdUR/kSaEipmOV
	 oV4Er11Qi2NkmC/DysPW2beusVhmK8h91sMHB9pisSz4GHV+hvEYMsoN38o97k3XOo01e
	 KDdQmi7KXJZuvOOhmGOp+gJGC21J69ihuav7j5VIsFtv1feslXXz/WbGPB6i4mEU98PNu
	 x4Ri8+YvffDLeMKUkI9zFd52OhQeDXrLp2xnYs92E/BlClWg2phcsrsTvTEgmYi/tp+C7
	 4BtBPwHFKVi+v3ssWNZsPK/og09+RS4uBaRZASbDAUnm4rq5/jZYvtYzff56EY8tLMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMGgafaP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03DF606A31A;
	Mon, 23 Nov 2026 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMGgafaP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D687A1F000C0;
	Mon, 23 Nov 2026 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440123;
	bh=KZfX+ZF6d3jxSf9WpYrXx6unSUfJtLVOGgikrC1kH6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TMGgafaPHDfKrZrodW+958mBFtGiFovNSmKRRX3mzyYR+/UORFpEttx/f+kDZn2xd
	 QjD8bvURHYb75aSBEz3uIb23mWlLOwfcBOnObmFKGvzQMYHVmBG00LBl4CgM/7+z80
	 Ec//Y1Z4SzUEKwmzZ3zWebqjccK8P++vImIEz8kTys/hyjl86N/SWsE3vvW/A52swj
	 +dLefTXln+SHLtCt1Oe/jvYTP9poeKBS8aEUz6JHxc3ikl5TgfOdM1R398BjxG7EKx
	 s1nn8g+AQB5aQo1KEAfEociw01ShjHDkYOiWTZoAaquGWYwqyQ5vzAjJjbpVvYYObu
	 CEXOexUivKJGw==
Date: Mon, 23 Nov 2026 21:01:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
Message-ID: <awQ5MYARkTBxQpjC@xhacker>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <avrx2EhgZ10ED40P@xhacker>
 <26aa0b74-e3f8-4405-ab87-743f5f8ef197@bootlin.com>
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
In-Reply-To: <26aa0b74-e3f8-4405-ab87-743f5f8ef197@bootlin.com>

On Wed, Nov 18, 2026 at 08:54:05AM +0100, Richard GENOUD wrote:
> Le 16/11/2026 à 13:06, Jisheng Zhang a écrit :
> > On Sun, Nov 15, 2026 at 06:23:39PM +0800, Jisheng Zhang wrote:
> > > Add initial support for the Synaptics SL261X SoCs and corresponding
> > > RDK boards.
> > > 
> > > The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
> > > SL2615, SL2617, and SL2619.
> > > 
> > > Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
> > > this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
> > > be submitted after this series is merged.
> > > 
> > > since v1:
> > >   - rebase on latest rcN
> > >   - drop some patches which have been merged
> > >   - let the "gbl" node export pinctrl/reset/clk devices with
> > >     MFD_CELL_NAME()
> > >   - use <linux/platform_device.h> instead of <linux/mod_devicetable.h>
> > >   - adopt some coding suggestions from Uwe
> > >   - Use 0 and 1 to select normal and strong pull-up on 10-bit pads
> > 
> > Other SoCs doesn't use this defintion for pull up or strong pull up.
> > After consulting our HW people, the strong pull up isn't used at
> > all, so I will remove strong pull up support in newer version. We can
> > add back its support when it's really needed in the future, nothing
> > breaks.
> I've found a similar definition here:
> https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml#L73-L78

This one looks strange, and changes the meaning of bias-pull-up, I.E
if adding "bias-pull-up" to any pin node, then it means strong pull up
because the pinctrl subsys framework adds 1 by default. To use normal
pull up, this binding needs "bias-pull-up = <0>;", which looks ugly
IMHO.

> But also a plain new property here:
> https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml#L153-L155

I like this. But I'm not sure whether it's accepted or not.

> And another with the real strong pull-up value:
> https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml#L94-L99

This is standard solution.

> As you said, if it's not used, we can skip it and add a property in
> the future (or the real value if we have it).

skipping it makes sense now.

> 
> But we won't be able to use 1 for strong and 0 for normal.
> 
> Regards,
> Richard
> > 
> > >   - collect Acked-by tag
> > > 
> > > Jisheng Zhang (13):
> > >    arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
> > >    pinctrl: berlin: use u16 instead of u8 for the offset
> > >    pinctrl: berlin: enable module build support
> > >    pinctrl: berlin: add optional pinconf support
> > >    dt-bindings: soc: synaptics: add SL2610 system controllers
> > >    soc: synaptics: add SL2610 system controller support
> > >    reset: add Synaptics SL2610 reset controller support
> > >    pinctrl: berlin: add Synaptics SL2610 pin controller support
> > >    clk: berlin: add Synaptics clock controller helpers
> > >    clk: berlin: add Synaptics SL2610 clocks and PLLs
> > >    dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
> > >    arm64: dts: synaptics: add SL2610 family SoCs
> > >    arm64: dts: synaptics: add SL2610 family RDK boards
> > > 
> > >   .../bindings/arm/marvell,berlin.yaml          |  20 +
> > >   .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++
> > >   MAINTAINERS                                   |   8 +
> > >   arch/arm64/Kconfig.platforms                  |   4 +-
> > >   arch/arm64/boot/dts/synaptics/Makefile        |   5 +
> > >   arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 457 +++++++++++
> > >   arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
> > >   arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
> > >   arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
> > >   arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
> > >   arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 +
> > >   .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
> > >   drivers/clk/Kconfig                           |   1 +
> > >   drivers/clk/berlin/Kconfig                    |  34 +
> > >   drivers/clk/berlin/Makefile                   |   4 +
> > >   drivers/clk/berlin/clk-sl2610.c               | 360 +++++++++
> > >   drivers/clk/berlin/sl-clk.c                   | 279 +++++++
> > >   drivers/clk/berlin/sl-clk.h                   |  31 +
> > >   drivers/clk/berlin/sl-sysmgr-clk.c            | 241 ++++++
> > >   drivers/clk/berlin/sl-sysmgr-clk.h            |  44 +
> > >   drivers/clk/berlin/sl2610-pll.c               | 145 ++++
> > >   drivers/clk/berlin/sl2610-pll.h               |  14 +
> > >   drivers/pinctrl/berlin/Kconfig                |  16 +
> > >   drivers/pinctrl/berlin/Makefile               |   1 +
> > >   drivers/pinctrl/berlin/berlin.c               | 259 +++++-
> > >   drivers/pinctrl/berlin/berlin.h               |  17 +-
> > >   drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
> > >   drivers/reset/Kconfig                         |  13 +
> > >   drivers/reset/Makefile                        |   1 +
> > >   drivers/reset/reset-sl2610.c                  | 224 ++++++
> > >   drivers/soc/Kconfig                           |   1 +
> > >   drivers/soc/Makefile                          |   1 +
> > >   drivers/soc/synaptics/Kconfig                 |  14 +
> > >   drivers/soc/synaptics/Makefile                |   2 +
> > >   drivers/soc/synaptics/sl2610-syscon.c         |  84 ++
> > >   include/dt-bindings/clock/syna,sl2610.h       | 131 +++
> > >   include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++
> > >   41 files changed, 3771 insertions(+), 20 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
> > >   create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> > >   create mode 100644 drivers/clk/berlin/Kconfig
> > >   create mode 100644 drivers/clk/berlin/clk-sl2610.c
> > >   create mode 100644 drivers/clk/berlin/sl-clk.c
> > >   create mode 100644 drivers/clk/berlin/sl-clk.h
> > >   create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
> > >   create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
> > >   create mode 100644 drivers/clk/berlin/sl2610-pll.c
> > >   create mode 100644 drivers/clk/berlin/sl2610-pll.h
> > >   create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c
> > >   create mode 100644 drivers/reset/reset-sl2610.c
> > >   create mode 100644 drivers/soc/synaptics/Kconfig
> > >   create mode 100644 drivers/soc/synaptics/Makefile
> > >   create mode 100644 drivers/soc/synaptics/sl2610-syscon.c
> > >   create mode 100644 include/dt-bindings/clock/syna,sl2610.h
> > >   create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
> > > 
> > > -- 
> > > 2.55.0
> > > 
> > > 
> > 
> 
> 
> -- 
> Richard Genoud, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
