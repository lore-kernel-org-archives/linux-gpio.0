Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927209;
	b=hhD7nla6zGczxOOca+zt29fclaLgUZILegaBn9U33AU2rKqZ4wgBCE7Ow+xOTq2aTD6i
	 Hx54W8ne6BA/6mmDUhd7mMelbseX/e1ab9nApygVGT8sN+S9YxTS9Vz4OquR00YOyNaMh
	 t5qSvgc80QTl+9iHMjrSTseTxlZEVncQ8v0MD/DMEC6h8yWyDi5GdFckxBHEEuNQpGrh/
	 6vyLXpOOKEE01wGk1GFsyuw5Pa47HWZiEuBRxSL9B05M3hpjfDeXzPfFRxt4DzUdo1zEk
	 9tkHFt/d79zLieRplRDoK+myKbfvIhTMbZcUqBeC1j6NDfsy3ZsrUzvBYQrGmTw0dKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927209;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0ypFAxaEz++uYn0W8pQ+eN4yh1B67gwRSRq+1HF7BcY=;
	b=MelMRxdg83dEgtBQMwuhRz/LnictDCuiL40Pby3aJLb9b+OF5y4zvI/mfhOBO3eLSAEX
	 4QSjclxhAty/JQNGfupLKgP2hUhetnTS4fpfZ3g7WkJz45x80Hi/F+1keM2nIRoZ5u+LA
	 q6BKPLgNEPKipxlv5/n5D7nSU4Rt9Wo//mAWIUJddxoE/O2OOvgpp1B3qUepwAVQTE7+J
	 47lWXjCU9VJPaZghY7aYopshxQ3xghx+J4sPOytmayOinjh4KN/9/dxruLBLCNP0WEbhW
	 9MuEkXCWKHxM3tTIMZTJIvG1HwlqIH8LMxSjd3zuT9d8bzqpjdFgHoc4KsyE5wvjNpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoDQbou8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940C606A33B;
	Tue, 17 Nov 2026 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoDQbou8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794927209;
	b=YR4BiwGWLhcYJPffDbHK7wPdHbpbSDzz0JY82g1Ja9SVEL+WTlYE9wM+/H96pV8YKRnt
	 TnXbA1kaR0qpP6DP13V+CMFoDZgX/gaciwB3QdqI6n3HTHD6m9NRTonncD/vHjkALvxIY
	 lFrxeMMRbx8UAsdJQPZMAzHIKLMLIdYZqW7SyslGeccp7GYwPAR50nu535GxJRaxH9VUh
	 JrpYrMUDKHg8SQSlTkUs8u5elDbNt9+s0EIYxcyvgCLIFoZBmrbOXJCFDRgqOYBnRBgRD
	 TaHNJPMSYWJYrperdEsHOuE38s9Juf4bzcmqYvBrk4LM1aW4dFf8bxTHNdOIN2VycaA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794927209;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0ypFAxaEz++uYn0W8pQ+eN4yh1B67gwRSRq+1HF7BcY=;
	b=mz/wtGIBeQcE7Ltbb6zRY9Ap/o50968oXPCcCzaXtKY/DbJH9GF1Xh7tb6GLgYXPuG/j
	 4vJ83PMXyuJbU2E5jq1TkTMEVXGPm4O+ruMLoBSGxLvk3/a71zj/0Y9lKgYQPDpeGJpcT
	 gYmr9QFEb/Ko83ADKRnP9JiRmNpaR+HH3gQYERPLPcRZFx79UFMGK67mfau6IJdx0Ne8L
	 +HXbpRFKW8hHnhQBavEKmUYPCY4STBMEazrk3GsW7W6a9TI2dh8sN1r25M5mbjEP6A+iv
	 LXvHZjEds4qXZtaqAuCPSNaJpyLUxwVmfaBfamsrplk46HPYJj5mTbN5pQKXbRH6c6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E4E11F000C6;
	Tue, 17 Nov 2026 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927209;
	bh=0ypFAxaEz++uYn0W8pQ+eN4yh1B67gwRSRq+1HF7BcY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AoDQbou8V3O0NEP86zCjPDnXuKXlwJWFrrnbSFGwWZX5AfwSVuLQgnmC3ciVSQXKb
	 oTWDRjhP5ba6E61gTWyFBS5JFg2QN4obXqn9pQY1Pm2kmk/PFin2VUnXGLa9nMFj1r
	 0558O2RDKs3RSSRvGVRYQtHvjvtoKSI4OQuxx73EEaX8RMP5TjQhfzjbqJ9PWSC2ML
	 nPg/RIccJKI/PXzaWJcM8UVkZHRCK77Aw32/Ez7hBBBjF/NXrT/bgSG68GcjFhFFbY
	 bmlGwRQ5tWeZcXHxwsEvEzmByLW/IA0gv2GHt7Ll8iOqlf0GcWv+gzjuAiZ6V6HL8O
	 jWIp1Y69fKFqA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 740CE4A9C4;
	Tue, 17 Nov 2026 14:53:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v7 0/6] lx2160a: change the pad muxes through the RCW
 override
Date: Tue, 17 Nov 2026 15:53:10 +0100
Message-Id: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFZq/GoC/5XNPW7DMAyG4asEmqtCv7SVqfcoOjAS1QhobENKX
 BeB714lS+1ONsDl5fB8d1YoJyrseLizTGMqqe9qNC8H5s/YfRJPoTZTQoGUQvPYZ34byjUTXvj
 XpCQI5Nl/8yF1l9vER8m1jA6Da4JvgVVoyBTT9Bx5/6h9TuXa55/n5igf3118PcEFgkTX6qYx5
 i1moteY2QMf1X5QVVAjBtGCOLn2H6iXYLsJ1BW0KAToKAM6WoNmAUqzCTQVJIqeUACgtWvQLkG
 7CbQVDMqABCA04NYg7AehgvEUPBkLFq3/A+d5/gUYBAC4ZwIAAA==
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>, 
 Frank Li <Frank.li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794927205; l=7535;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=FjNU8wvi+FInQ1Mrb6KLm2Dp0ieDNE1A93vhOH+nnJw=;
 b=EjBsxWUZYct9Iz7W1hENf/byI7ENRDYJS6xyIza+7t7zCby79rKtT2kJT2bFAXnYdqH4EKvQY
 11jb74qP6FJDprtulWnCADwciJLZaITIOS162UvB+83FbOOV3MBJ+Am
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
fields of the RCW. They are read-only in RCWSR12..14 of DCFG, and are
changed at runtime through the override registers in the DCSR view of
DCFG, which read 0 until written.

Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
gpio to support bus recovery"), fsl-lx216x.dtsi drives the override
registers with pinctrl-single for the I2C bus recovery. Its first pin
state clears every other field of the word: a board whose RCW programs
a non-zero pad mux loses those pads at the first I2C probe.

This series reads the fields in effect from RCWSR and writes RCWCR, as
fsl_guts_rcw_rmw() already does for the SerDes protocols:

- patches 1 and 2 describe the pad mux as a child of the DCFG node
- patch 3 exports the RCW override of fsl-guts for the pad-mux fields
  only
- patch 4 adds the pinctrl driver: one group per RCW field, one
  function per encoding
- patch 5 moves the pad muxes of fsl-lx216x.dtsi under DCFG, which
  gains its DCSR view. Labels and pin node names stay, so no board
  file changes, and the pinctrl-single node is removed
- patch 6 drops the I2C bus recovery of i2c6 and i2c7: IIC7 and IIC8
  share one field, so the recovery of one bus would switch the pads of
  the other one too

Patch 4 uses the exports of patch 3, so it cannot be applied alone.
As confirmed with Linus Walleij[1], patches 1 to 4 should go through
the pinctrl tree once patch 3 is Ack'd by the soc/fsl maintainer, and
then patches 5 and 6 through the i.MX tree once the driver is in,
since the I2C pin states of fsl-lx216x.dtsi should follow this path.

[1] https://lore.kernel.org/all/CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com/

DTBs built before patch 5 keep their pinctrl-single node and behave as
before. There is no Fixes: tag, since patch 5 depends on a new driver.
I did not believe it should be backported then.

Tested on a Nodebox v3 (LX2160A) whose RCW muxes XSPI1_A_DATA[7:4],
SDHC1 and IIC5 are not set with the defaults, so I could confirm:
 - with pinctrl-single the first I2C probe cleared those fields
 - with this series RCWSR12..14 read after boot exactly what the RCW and
   the board's pin states select
 - all I2C controllers come up with their recovery states and a
   forced bus recovery on IIC1 (multi-master enabled for the test)
   changes only that field
 - RCWSR27 reads what the RCW selects for EC1, EC2, USB_EXT, GTX_CLK
   and SDHC1_DS. Selecting SDHC1_DS again from debugfs is the first
   override of that word, and keeps its other fields

Thanks to Vladimir Oltean for pointing at fsl_guts_rcw_rmw() when I
tried to prime the override registers from the RCW instead:
https://github.com/nxp-qoriq/rcw/pull/8

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v7:
- dt-bindings, pinctrl: add the clk-out function, encoding 0 of
  CLK_OUT_PMUX, so debugfs shows clk-out instead of 0x0. Rev. 1 of
  the Reference Manual marks 0b000 as reserved in the field: its
  revision history says "Updated 0b000 as reserved" and removes the
  CLK_OUT configuration section, while table 19 still lists
  000 (CLK_OUT) (Vladimir Oltean)
- dt-bindings: the description says that a group is one RCW field and
  that some functions carry two controllers at once, such as i2c on
  sdhc2-data74 for IIC7 and IIC8 (Vladimir Oltean)
- New patch 6: drop the I2C bus recovery of i2c6 and i2c7, which share
  the SDHC2_DAT74 field (Vladimir Oltean)
- Tested on the Nodebox v3: debugfs shows clk-out, i2c6 and i2c7 have
  no recovery state while the other I2C buses keep theirs, and the
  eMMC on the SDHC2_DAT[7:4] pads still runs 8-bit HS400
- Link to v6: https://lore.kernel.org/r/20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr

Changes in v6:
- pinctrl: the driver is no longer specific to the LX2160A, so that
  other Layerscape SoCs can be added to it: pinctrl-layerscape-rcw.c
  (suggested by Vladimir Oltean)
- Patches 1, 2 and 5 are not changed
- Link to v5: https://lore.kernel.org/r/20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr

Changes in v5:
- soc: fsl: guts: the exports become fsl_guts_pmux_read(),
  fsl_guts_pmux_override() and fsl_guts_pmux_override_supported(). guts
  lists the pad-mux fields of the LX2160A and refuses any other field
  or register, so the serdes fields cannot be changed (Vladimir Oltean)
- dt-bindings, pinctrl, dts: add the EC1, EC2, USB_EXT, GTX_CLK and
  SDHC1_DS pad muxes of RCWSR27, the second reg of the node (Vladimir Oltean)
- Patch 3 is reworked: drop the review tags, new round of review is
  needed (TBC, from Christophe Leroy and Frank Li)
- Patch 1 gets a reg, 5 groups and 4 functions:
  same drop the the Reviewed-by of Rob Herring and Frank Li
- Patch 2: its description names RCWSR27 too, I assume the
  Reviewed-by of Rob Herring can remain
- Link to v4: https://lore.kernel.org/r/20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr

Changes in v4:
- pinctrl: MAINTAINERS with imx@lists.linux.dev
  FUNC and GROUP macros with LX2160A_PMUX_ prefix (Frank Li)
- Add the Reviewed and Ack tags of Rob Herring and Frank Li
- Patches 1, 2, 3 and 5 are not changed
- Link to v3: https://lore.kernel.org/r/20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr

Changes in v3:
- dt-bindings, dts: the pad-mux child is bus-addressed like the
  clock-controller child of the LS1028A dcfg: its reg is the RCWSR12
  to RCWSR14 window, under #address-cells, #size-cells and ranges on
  the dcfg node, the override registers stay the DCSR view of the
  parent (Krzysztof Kozlowski)
- cover letter: patch 4 cannot be applied without patch 3 (Linus Walleij)
- Patches 3 and 4 are unchanged
- Link to v2: https://lore.kernel.org/r/20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr

Changes in v2:
- dt-bindings: list, for each function, the groups, so the
  schema refuses the associations the driver refuses (Frank Li)
- Patches 2 to 5 are unchanged
- Link to v1: https://lore.kernel.org/r/20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr

---
Vincent Jardin (6):
      dt-bindings: pinctrl: add the NXP LX2160A RCW pad mux
      dt-bindings: soc: fsl: layerscape-dcfg: add the LX2160A pad-mux child
      soc: fsl: guts: add the RCW override of the pad muxes
      pinctrl: freescale: add the Layerscape RCW pad-mux driver
      arm64: dts: lx2160a: describe the pad muxes as the DCFG RCW override
      arm64: dts: lx2160a: drop the I2C bus recovery of i2c6 and i2c7

 .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 326 ++++++++++++++++
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml      |  18 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      | 377 +++++++++---------
 drivers/pinctrl/freescale/Kconfig                  |  15 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-layerscape-rcw.c | 428 +++++++++++++++++++++
 drivers/soc/fsl/guts.c                             | 125 +++++-
 include/linux/fsl/guts.h                           |   3 +
 9 files changed, 1115 insertions(+), 186 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-for-upstream-lx2160a-rcw-pinmux-v1-31f9ad97dc86

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


