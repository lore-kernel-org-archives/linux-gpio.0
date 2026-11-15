Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739460;
	b=uA+b946a2Mp0zh9EPIw2Cr0u6qFe7M4aib4f8Q60ZQf4frw9VnNA3oBsPBCLsi+PqLUL
	 cyLWoFmX+5LO9vjqyLXnaBUkPaDVpc2R516NrplZPEytJ+6O8nnt0hPQ6qNI7raauln3u
	 V9PDgmtqxJy7KUr5A3GW0XNbXE9LtpTI0u9qlzGuq5kh0vKI/I+rqbQ08th+Tq8Cg0mYi
	 LGUWaHfq7cnAA5NOqk2gwCAqtIk1rG4DI1PEsEjdKQaWhTZpnImqkUFNkumykfNd/orQT
	 JKGoElG/NM4jFbgqwmeLyfEQgth72yodT9ld1GBnD6jRnp5DHFM9qh8nG/Qa3dGfrYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739460;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K0usV5S3jHEW4yC1LWJVliW0T4AnD3cjicXTLsZKRec=;
	b=zrhTq+aB5pZ/9PCyt/OEuguBNvkSjpnKjQ7y1oPN6Cghm5zt1KevEZDDgscdu98eq+1R
	 qsLZk/lYyU6mjVSj1mTrpSlFdRcvSErQ4MIgrtjAcKf3iehNw3JOPX8fOoocwR012DDUL
	 8R1Mx3MJVSRTxuiDtS04e16IHIm5oq3w1LSN4LWwsA+j4U1LY7URhVkiDIB+ENMu3I3Ed
	 Fgx8Y0AiYlewJAv2txLIzobz9PzpTYTnb14ADB3j8AVLW0Oj4upBJsNAsF+VdXY3p+PBV
	 Va5AkpZAT6E/XcyZvxazwal/vR8WDZncrp0BDGtqPXbPMGUEeVmZesdKDuVv3zU5TNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGI1V7Zz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DFD606A31A;
	Sun, 15 Nov 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGI1V7Zz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478141F000C4;
	Sun, 15 Nov 2026 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739460;
	bh=K0usV5S3jHEW4yC1LWJVliW0T4AnD3cjicXTLsZKRec=;
	h=From:To:Cc:Subject:Date;
	b=JGI1V7Zzd8yb3ZbfyVFj8g3xuja8R+tcIZwsWKaI5nHgHBQCEgMsI13pn7As7+1c2
	 pQ0NRP1FKWRt4FOIHsyH6L0iEZXB+YTTdqqO2dXUG0whw3SlJ9jeSYgtDRsyfBOkkD
	 0praGMeiXJ/4Fp0zSplJFa/mAZ4oM1Zu8q1j4Z8Tjn+RoL6GQ794C9klpN+4TcRGs+
	 0jlO5/PNw+YYqATXiI7691pjXEnR1D0YklfYFW+QTOP16IB/0kcdzSwDeo8CAkDc2u
	 8DUeWW9oqQfHUhzjz2nXG4G2k4Gs9NB2XNkuzWAWuOrwzByuRgC6YJO5gTiLLzOlRw
	 DDr7ZNTtfLTPw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
Date: Sun, 15 Nov 2026 18:23:39 +0800
Message-ID: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Synaptics SL261X SoCs and corresponding
RDK boards.

The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
SL2615, SL2617, and SL2619.

Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
be submitted after this series is merged.

since v1:
 - rebase on latest rcN
 - drop some patches which have been merged
 - let the "gbl" node export pinctrl/reset/clk devices with
   MFD_CELL_NAME()
 - use <linux/platform_device.h> instead of <linux/mod_devicetable.h>
 - adopt some coding suggestions from Uwe
 - Use 0 and 1 to select normal and strong pull-up on 10-bit pads 
 - collect Acked-by tag

Jisheng Zhang (13):
  arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
  pinctrl: berlin: use u16 instead of u8 for the offset
  pinctrl: berlin: enable module build support
  pinctrl: berlin: add optional pinconf support
  dt-bindings: soc: synaptics: add SL2610 system controllers
  soc: synaptics: add SL2610 system controller support
  reset: add Synaptics SL2610 reset controller support
  pinctrl: berlin: add Synaptics SL2610 pin controller support
  clk: berlin: add Synaptics clock controller helpers
  clk: berlin: add Synaptics SL2610 clocks and PLLs
  dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
  arm64: dts: synaptics: add SL2610 family SoCs
  arm64: dts: synaptics: add SL2610 family RDK boards

 .../bindings/arm/marvell,berlin.yaml          |  20 +
 .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++
 MAINTAINERS                                   |   8 +
 arch/arm64/Kconfig.platforms                  |   4 +-
 arch/arm64/boot/dts/synaptics/Makefile        |   5 +
 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 457 +++++++++++
 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 +
 .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/berlin/Kconfig                    |  34 +
 drivers/clk/berlin/Makefile                   |   4 +
 drivers/clk/berlin/clk-sl2610.c               | 360 +++++++++
 drivers/clk/berlin/sl-clk.c                   | 279 +++++++
 drivers/clk/berlin/sl-clk.h                   |  31 +
 drivers/clk/berlin/sl-sysmgr-clk.c            | 241 ++++++
 drivers/clk/berlin/sl-sysmgr-clk.h            |  44 +
 drivers/clk/berlin/sl2610-pll.c               | 145 ++++
 drivers/clk/berlin/sl2610-pll.h               |  14 +
 drivers/pinctrl/berlin/Kconfig                |  16 +
 drivers/pinctrl/berlin/Makefile               |   1 +
 drivers/pinctrl/berlin/berlin.c               | 259 +++++-
 drivers/pinctrl/berlin/berlin.h               |  17 +-
 drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
 drivers/reset/Kconfig                         |  13 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sl2610.c                  | 224 ++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/synaptics/Kconfig                 |  14 +
 drivers/soc/synaptics/Makefile                |   2 +
 drivers/soc/synaptics/sl2610-syscon.c         |  84 ++
 include/dt-bindings/clock/syna,sl2610.h       | 131 +++
 include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++
 41 files changed, 3771 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
 create mode 100644 drivers/clk/berlin/Kconfig
 create mode 100644 drivers/clk/berlin/clk-sl2610.c
 create mode 100644 drivers/clk/berlin/sl-clk.c
 create mode 100644 drivers/clk/berlin/sl-clk.h
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
 create mode 100644 drivers/clk/berlin/sl2610-pll.c
 create mode 100644 drivers/clk/berlin/sl2610-pll.h
 create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c
 create mode 100644 drivers/reset/reset-sl2610.c
 create mode 100644 drivers/soc/synaptics/Kconfig
 create mode 100644 drivers/soc/synaptics/Makefile
 create mode 100644 drivers/soc/synaptics/sl2610-syscon.c
 create mode 100644 include/dt-bindings/clock/syna,sl2610.h
 create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h

-- 
2.55.0

