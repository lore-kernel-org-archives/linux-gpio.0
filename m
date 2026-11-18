Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999618;
	b=Fq64uzLy7CEqAN+0rZX2gRe86kvTWV+Yckqx8ZbHgJI2/zkbG5Qv+xfwOGhZpfiCsupD
	 AerZIuc9KSO3rBtK3mlLS0ogri/Yc7PVicSzebODVz/m6DzfyKwEUva+xfEDcTxjKkvYR
	 2bWVW8UzZPrvbr+BrugDDYcqrQACZirJeCAUfZCSCQXOzJVv/bTG9UmJnn1+QyFOgcE75
	 nOWsItrW3HYcTKrAevRW0xOn+sXGpx9fPxIqCIcRgsGQRBVhHQlFpDD6kAOGsEmjrEE+z
	 WtnjTKpMOICHM2SmxXPSD+gASeLzxkSRl9LLiJUQsprwSaO4vwYm6RHzLUnrIwdGnwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999618;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HSZbL7hi3T6ick9vOv0RQ8BuzoNi+oXO4vQCpKvoQsg=;
	b=fdL7vvv4YExt1QBsYEm63ZtAehdpolCaB7WjoDb+M/PHy/jbN9WCm8cUaH5Wvk+ozQ/g
	 rLymmm7SKuVvEkFd/XZp+0DmtqKoypUNdXPjyowoO2fP0oBxQFzyTlHbBwVau23i8sA8b
	 MhaBCeHZ6M7vL9MvGKGb5CTsUiYz60bus57OAXvufK3XhXhfNgN2aygsN45D0cRIW8GQI
	 zXh13ukWzXrncj9cloHUlkViEe7lBgXYrQRigquNT9wBNkAxipIWQG4NQm3GaQIUxMeZ6
	 OqjJcYb0IDnC9TknxorPyom48zc+7u+QmyJT9H1lYxiz2g9Eq5u1lvly4YxeLYQbvsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JJ2B/gz9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A8C60A260C;
	Wed, 18 Nov 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJ2B/gz9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794999618;
	b=rjBa8rHPdCADyhAy/EtxcuQAMBTToeyY3jf5c2zGi38JoEPtSrvQUW2J1dno1H+0kqdA
	 JSMDR23JmXEe+l0Mqe854ri10Dx9E9jHD7VTc9JaF6JohK+pmMjQb5PEw/Hx5i85Srl+4
	 DOttkJ0asEozljWzdow7qX/r3CGGf2LwJVJQNI3vJ7wBwkhvTM2p7YG9msrXpe52UyVOx
	 2i8UbLp9qNkZHxdeRD4BRKoOe9DiYMBung6SGblglx3X9rFAWNU/+IPtBvImRWjJhDdln
	 GegRe8RYgEnNMkhJMwRNNgwgt3A6efGnkMBvE0/sh1u4mA8/oX/3zImNryDREmwHTRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794999618;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HSZbL7hi3T6ick9vOv0RQ8BuzoNi+oXO4vQCpKvoQsg=;
	b=2/hyIUCRmKGsPDGyMBeGXihGAsaEhVUh7V3I1OnadcHsyWFMK3UsxCcRuZ7W+hETBhK+
	 xETUayHySIEfsYRXVh1nFItDdvkar0twl3Fg7F3Dvp1RYzWd1lAuUmnrZn3QhBwuXY0da
	 kHW9AaMKJA3dv4SAxAdOnr2NChsR4ptcEUs/qAzpxNNNW0U7siiy2qZcaqwbZ8+63nx1w
	 fqP4vEilaumw7jAz4ad/MlbR+5sC3OdXq8XFAGzjVp+qq+dydm9Fdmwg/ti9FVEVVxPnm
	 y1ythyEod+k8OAweTgIiAcbKchZZwqf2JBs4OpKI8y+uL/TIXsIPtq8n22aNv1f0V9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 493031F000C4;
	Wed, 18 Nov 2026 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999618;
	bh=HSZbL7hi3T6ick9vOv0RQ8BuzoNi+oXO4vQCpKvoQsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JJ2B/gz9O0uIGAyRfnTIGyQfyauMHYdpInHGb/xYXxE9V/ECI7cjaF58ov2HSI/fb
	 ArLem1ZloZ2YYbTaoEP8tH8lJ+Htj4UP3OfMfNeX5doTzZAxKRt9a1hmvKoQA+Pt2c
	 cx/LHxIjs96/hkbHr6dZIpKabv8WivShNhyJTmwdKpZ14SnNXAaAlZMLTKYFMO6U7m
	 /XnIBZMs9ZKiMIp3NjxmzsOrz4c0pA6YleYU/JIWRklFlupWhNojJt5p5uCcGMf7+r
	 qteFqMJ12j0d9zOb20HIPV9lJzmxzzSjvWVyMA+z7XbGJUmNZSZTUlC05r4ZmUoWZ2
	 uFjt0C/BWNwKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B47FC4AD24;
	Wed, 18 Nov 2026 11:00:16 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 18 Nov 2026 12:00:15 +0100
Subject: [PATCH v8 1/6] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
 mux
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
Message-Id: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-1-d01bc837593e@free.fr>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
In-Reply-To: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
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
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794999615; l=11762;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=VAfKsiOAWmBFQGgH+4AeXdklp8SqMOEbpNKlATMhmYI=;
 b=bFhEjCSC3yzgAcYB+d/UkweO4rZLIV1BJGLAX+3syl5l94DvIP5vijh01Tf3lnEvmVEesnkAl
 rkPXAgfmhlPBtWEGyDFzRWLBnwQgpworkJb5Z6lgy1+/nXaQA61xRNT
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ, EVT, EC and USB pads
from fields of the RCW: read-only in RCWSR12..14 and RCWSR27 of DCFG,
changed at runtime through the override registers of its DCSR view.

Describe the pad mux as a child of DCFG at its RCWSR12 to RCWSR14 and
RCWSR27 windows: the override registers are at the same offsets of the
DCSR view of the parent. One group per RCW field, one function per
encoding.

Each group lists the functions in the order of the lx2160 RM
(Reference Manual) and of the driver tables, so a pair the driver
would refuse, such as can on iic1, is refused by the schema.

Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 417 +++++++++++++++++++++
 1 file changed, 417 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml
new file mode 100644
index 0000000000000..e7685a792038b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml
@@ -0,0 +1,417 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LX2160A RCW pad muxes
+
+maintainers:
+  - Vincent Jardin <vjardin@free.fr>
+
+description:
+  The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ, EVT, EC and USB pads based
+  on its RCW. The related fields are from the read-only RCWSR12 to RCWSR14 and
+  RCWSR27 registers of DCFG, and can be changed at runtime by writing the RCW
+  override registers in the DCSR view of DCFG. The node is a child of the DCFG
+  node, which owns both views. Its reg are the RCWSR12 to RCWSR14 and the
+  RCWSR27 windows of the CCSR view, and the override registers are at the same
+  offsets of the DCSR view.
+
+  Each group is one RCW field, and selecting a function switches all the pads
+  of the group at once. Some functions carry the signals of two controllers.
+  For example, i2c on sdhc2-data74 gives both IIC7 and IIC8, and flextimer on
+  iic2 gives FTM1_CH0 and FTM2_CH0. Such a group has a single owner, so the
+  pads of one of those controllers cannot be switched alone, as an I2C bus
+  recovery would need.
+
+properties:
+  compatible:
+    const: fsl,lx2160a-rcw-pinmux
+
+  reg:
+    items:
+      - description: RCWSR12 to RCWSR14
+      - description: RCWSR27
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [ asleep, can, clk-out, evt, flexspi, flextimer, gpio, gtx-clk,
+                i2c, irq, reset-req, rgmii, sdhc, sdhc-clk, sdhc-data,
+                sdhc-data4, sdhc-spi, spi, tsec-1588, uart, uart3, uart4, usb ]
+
+      groups:
+        items:
+          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
+                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
+                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
+                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
+                  evt4-3, evt2-0, clk-out, asleep, reset-req, ec1, ec2,
+                  usb-ext, gtx-clk, sdhc1-ds ]
+
+    required:
+      - function
+      - groups
+
+    allOf:
+      # IIC2_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: iic2
+        then:
+          properties:
+            function:
+              enum: [ i2c, gpio, flextimer, sdhc ]
+
+      # IIC3_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: iic3
+        then:
+          properties:
+            function:
+              enum: [ i2c, gpio, can, evt ]
+
+      # IIC4_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: iic4
+        then:
+          properties:
+            function:
+              enum: [ i2c, gpio, can, evt ]
+
+      # IIC5_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: iic5
+        then:
+          properties:
+            function:
+              enum: [ i2c, gpio, sdhc-clk, spi ]
+
+      # IIC6_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: iic6
+        then:
+          properties:
+            function:
+              enum: [ i2c, gpio, sdhc-clk ]
+
+      # XSPI1_A_DATA74_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: xspi1-data74
+        then:
+          properties:
+            function:
+              enum: [ flexspi, gpio ]
+
+      # XSPI1_A_DATA30_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: xspi1-data30
+        then:
+          properties:
+            function:
+              enum: [ flexspi, gpio ]
+
+      # XSPI1_A_BASE_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: xspi1-base
+        then:
+          properties:
+            function:
+              enum: [ flexspi, gpio ]
+
+      # SDHC1_BASE_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: sdhc1-base
+        then:
+          properties:
+            function:
+              enum: [ sdhc, gpio, spi, sdhc-spi, sdhc-data4 ]
+
+      # SDHC1_DIR_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: sdhc1-dir
+        then:
+          properties:
+            function:
+              enum: [ sdhc, gpio, spi, sdhc-data ]
+
+      # SDHC2_DAT74_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: sdhc2-data74
+        then:
+          properties:
+            function:
+              enum: [ sdhc, gpio, i2c, flexspi ]
+
+      # SDHC2_BASE_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: sdhc2-base
+        then:
+          properties:
+            function:
+              enum: [ sdhc, gpio, spi, flexspi ]
+
+      # UART1_SOUTSIN_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: uart1-soutsin
+        then:
+          properties:
+            function:
+              enum: [ uart, gpio ]
+
+      # UART1_RTSCTS_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: uart1-rtscts
+        then:
+          properties:
+            function:
+              enum: [ uart, gpio, uart3 ]
+
+      # UART2_SOUTSIN_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: uart2-soutsin
+        then:
+          properties:
+            function:
+              enum: [ uart, gpio ]
+
+      # UART2_RTSCTS_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: uart2-rtscts
+        then:
+          properties:
+            function:
+              enum: [ uart, gpio, uart4 ]
+
+      # IRQ11_08_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: irq11-8
+        then:
+          properties:
+            function:
+              enum: [ irq, gpio ]
+
+      # IRQ07_04_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: irq7-4
+        then:
+          properties:
+            function:
+              enum: [ irq, gpio, flextimer ]
+
+      # IRQ03_00_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: irq3-0
+        then:
+          properties:
+            function:
+              enum: [ irq, gpio, flextimer ]
+
+      # EVT43_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: evt4-3
+        then:
+          properties:
+            function:
+              enum: [ evt, gpio, flextimer ]
+
+      # EVT20_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: evt2-0
+        then:
+          properties:
+            function:
+              enum: [ evt, gpio, flextimer ]
+
+      # CLK_OUT_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: clk-out
+        then:
+          properties:
+            function:
+              enum: [ clk-out, gpio, flextimer ]
+
+      # ASLEEP_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: asleep
+        then:
+          properties:
+            function:
+              enum: [ asleep, gpio, evt ]
+
+      # RESET_REQ_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: reset-req
+        then:
+          properties:
+            function:
+              enum: [ reset-req, gpio ]
+
+      # IIC1_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: iic1
+        then:
+          properties:
+            function:
+              enum: [ i2c, gpio ]
+
+      # EC1_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: ec1
+        then:
+          properties:
+            function:
+              enum: [ rgmii, gpio ]
+
+      # EC2_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: ec2
+        then:
+          properties:
+            function:
+              enum: [ rgmii, gpio, tsec-1588 ]
+
+      # USB_EXT_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: usb-ext
+        then:
+          properties:
+            function:
+              enum: [ usb, gpio ]
+
+      # GTX_CLK_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: gtx-clk
+        then:
+          properties:
+            function:
+              enum: [ gtx-clk, gpio ]
+
+      # SDHC1_DS_PMUX
+      - if:
+          properties:
+            groups:
+              contains:
+                const: sdhc1-ds
+        then:
+          properties:
+            function:
+              enum: [ sdhc, gpio, spi ]
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@12c {
+        compatible = "fsl,lx2160a-rcw-pinmux";
+        reg = <0x12c 0xc>, <0x168 0x4>;
+
+        iic3-i2c-pins {
+            function = "i2c";
+            groups = "iic3";
+        };
+
+        iic3-gpio-pins {
+            function = "gpio";
+            groups = "iic3";
+        };
+    };

-- 
2.43.0


