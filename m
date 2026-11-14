Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647555;
	b=U89umDjRWVW0x0/NsF+JP7hdb/LOJtuurhY6gXZzbtzRY7NXgWwWVSIIe4a9eoUgDJ/E
	 e/Mu5/XuKMEphpe9GF09BXDifhaDYzJfpVfZLBAzs7BM1u5C9+65uhi/xvUzo2etPBKFx
	 adS0msaWF+5g6QL0plNbKqGceKFNSIQ8jAlVe49rjYlXh9kxrZDjuYRzHxB+a73MYK3Jd
	 wS1Kxbn6mRfrmwWQIjvtYtakVPx0ZUnaHogSLzJT9a68UI8QemP6+iDlnZA4HRAmgl5ml
	 kbWdCrsfDegfO+DWebiOrREp4KYuQVZkj2dyr0dlVDwC48YxZlTX+LwvoXZCiXgYsRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647555;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W7NHTR9iuPpV2YvJsW0WfjITvUEliglzCiAJOTt3X3I=;
	b=GMkHrFyau65wgJxZFlq41FVPdUTaHYSVgEwK+o6s/hhccVoYRoYj7rom8vGI+xjYXzSY
	 GV25ma71agEoJrsyqQoJGOVprZaYIyFE679rXDwR1InGAV1JvbY4KQQnAzHY7ggLeeV3o
	 k+QXfb8eXolL8n5AKI5POShvf/U1h7t2WTxaZylLSf2M3P9qgnTPzx4HHNzhSnnS7qibW
	 VZs2ahJNQGMTI+wBsma3PmGiOCTAe/d+ebcFvv68svmnKF9kmFdLbGWyOaWmkm0TNe9t7
	 M2NiTE+JKcLjX4EKdXAOWcXc+s9vn60DYdFw8y5f8PQ8CSNgyCgES1g1NefrWGocm8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9cU5YK5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF031606A332;
	Sat, 14 Nov 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9cU5YK5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794647555;
	b=A9Xe5bALknhvxVrynD14tQOkqSm5z59582V6csfcafwkD3FwkcdmC2Muaw6tbLTHmBKQ
	 FwNH/bczAs8eaTexgX9PX+y8YiBvJPiNqhlFcDUhmn1XnGgnIF77cmP60hCiAw0t67m5P
	 AiUqZlr1gHjzeDkctKBLfrt75RK4Z/034QOzoXJJ0E3SLyKh2+BzYOE7rnO7kKy1HBu82
	 QqCn3JEzDlSIGRMBa8sUgH6/HGr0PHcaCu2UdyDiFQmEmXaDGMvVDQMq1d7pRHAkL1+zn
	 uHS11NoiJJTCvgc3wMkjHscnaYFwvY66mGsG7UENdY7PqAg9XsIZiTdeQ3bb6ji7t/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794647555;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W7NHTR9iuPpV2YvJsW0WfjITvUEliglzCiAJOTt3X3I=;
	b=wjbg7hgW6Z1/YKX06pqXhPVb+wDr12bZ2bokhZSfwenABwTXl2c1JQMSL/HUYseB58Ch
	 X+49CYII9NJ5xxr08FZshmbSj0EXSp47yNodxjDzwdEPSroaQmBNEINjCWaN/SquOATgW
	 k9LU+AUj+2zKGurDBWy0kR8Y8I8MVBELOCph1no8H0c/JVwHalkDb9Y7H+yo2G9E9HfIm
	 lfnLIRhtdQJSjGhP59kl2zOu6so8dz2r+nQBaJoRgkjilMlg2JF8TP/A1y9zelqVg9zWW
	 cJmwkQV+eRRup0J6gn7vbK1knr+oD28zCbwOxj2rOPpoHTTOPTf4PXlxB/SAnK9LFLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52C0B1F000CE;
	Sat, 14 Nov 2026 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794647555;
	bh=W7NHTR9iuPpV2YvJsW0WfjITvUEliglzCiAJOTt3X3I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=D9cU5YK5R45Q83UuFLLrYibzRqh22VxV3GPuA0wQmVgp38OFlO0gqSRd6hyF/Hvo7
	 Ugkvh8HibKup8g7bsBHkhKt91UChhitIwW1Ae16rLkMWJfqmzApt/1ot+xWVfKVmfr
	 21Ci+fSFvexIeVse/pQvQJy+bFuTQTGGXfsnDHChDpUIo+pbgqAZY3rlDsuhIXJ5RG
	 VKiTs20oRLk7Wbc8WA0C3NYFAQPJ6DWZvqt0nFJBRRC+d7N4AUmSJO2SD8kPX248GV
	 qevopsRn80hz1Kcl9qRohH6OxkQZrWbEbnZVAx2S7TH9DwT6LcbOm08X9Z2L0mTaEE
	 TljLC3RXVS9YA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A4A4949D12;
	Sat, 14 Nov 2026 09:12:33 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v4 0/5] lx2160a: change the pad muxes through the RCW
 override
Date: Sat, 14 Nov 2026 10:12:27 +0100
Message-Id: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
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
X-B4-Tracking: v=1; b=H4sIAPsl+GoC/5XNwW7CMAzG8VdBOc+Tk3RpwmnvMXEwjQORRls5U
 IpQ332ByxAnkHz5+/D7rqqwZC5qvboq4SmXPPQ1mo+V6vbU7xhyrK0MGqc1WkiDwGksR2E6wO9
 stEMC6c4w5v5wmmHSYHUKFEMbO+9UhUbhlOf7yM+m9j6X4yCX++akb9+3+HoISE5T8LZtm+Y7C
 fNnEnXDJ/M+aCpoiSJ6h9vgn0D7CPqXQFvBL0J0NulIgf/BZVn+AFTnif10AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794647552; l=4698;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=Yf1JH3K/Bq6ljusCgDHoAts1E/+RPq1z4yeuVE4EJj4=;
 b=ZFkP9/CfX8Es/X2tiuNCHqhDBT/y9vm7Hf9tJ3N3fWE2OUBzwRqkewqeB8+HqBIZ+uBw1efwu
 a3yFpl+mVnaBqsSIIXUutZnqIDfWOAZ/Kwn4p4QdekDlykboxzMMc6J
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

- patches 1 and 2 describe the pad mux as a child of the DCFG node,
  which gains its DCSR view
- patch 3 exports the RCW override of fsl-guts for any RCWSR
- patch 4 adds the pinctrl driver: one group per RCW field, one
  function per encoding
- patch 5 moves the pad muxes of fsl-lx216x.dtsi under DCFG. Labels
  and pin node names stay, so no board file changes, and the
  pinctrl-single node goes

Patch 4 uses the exports of patch 3, so it cannot be applied alone:
patches 1 to 4 could be for the the pinctrl tree with an Ack of
the soc/fsl maintainer on patch 3,
and patch 5 through the i.MX tree once the driver is in,
since the I2C pin states of fsl-lx216x.dtsi then belong to it.

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

Thanks to Vladimir Oltean for pointing at fsl_guts_rcw_rmw() when I
tried to prime the override registers from the RCW instead:
https://github.com/nxp-qoriq/rcw/pull/8

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
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
Vincent Jardin (5):
      dt-bindings: pinctrl: add the NXP LX2160A RCW pad mux
      dt-bindings: soc: fsl: layerscape-dcfg: add the LX2160A pad-mux child
      soc: fsl: guts: add the RCW override of any RCWSR
      pinctrl: freescale: add the LX2160A RCW pad-mux driver
      arm64: dts: lx2160a: describe the pad muxes as the DCFG RCW override

 .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 264 +++++++++++++++
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml      |  18 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      | 377 +++++++++++----------
 drivers/pinctrl/freescale/Kconfig                  |  15 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-lx2160a.c        | 368 ++++++++++++++++++++
 drivers/soc/fsl/guts.c                             |  73 ++++
 include/linux/fsl/guts.h                           |   3 +
 9 files changed, 952 insertions(+), 175 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-for-upstream-lx2160a-rcw-pinmux-v1-31f9ad97dc86

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


