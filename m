Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794749258;
	b=UChI/90a953KZ6FnoT/E+m97DbJFZRTj6NW0uyfhvXDStWJ3Bh9+8CPu48OTutry9we6
	 RvBxMZ3VweMRUZ6naFmhe6gSGk6ooBQ59AqhhhpIB+B95u4Qu0tQrvnqvIFAnli6vGdeD
	 vDLmzqv1FcNfm2eVNycWQyNdfMTaSSBbNaSwpG4ez5itTXdq6i1jPica6YmwZZaZU7xZQ
	 l/9Pf06fEEudqdBCa4P9WTy1cpGCbqfpBGndzUHXSX/4gWpw9Wa1+5/VpfwfIqKLnPVpj
	 +A8Keg3NT+EMjNT0lhOzktjAnymPwQJhfj/xnSLXpQGUgKTa0SVNv2v2ztHGXnKGYHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749258;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bEv4AHDUm026GE6n1cBpD0QcLMp6c2PdbcmzdzW9Vts=;
	b=PGBB8ldrbM+FdoOCHRdercR1hZcGnu1G/3KznkTaYF+8DErxDYhweBG3imv+DTbPtdog
	 KBN6KgX0z9Uh+5zmIRryWa7nrLn8l9s9l89XIllxCPg1Hup6lXjuSXP3Yu18jI9jdoavd
	 JBKgefLMi8jXt3/wP4N3pUDb/DGZpXVZUDQGRaHp2N34mq4hoBtOmcpZLIQNPIEgUP49H
	 FGCMN/CuQiUFw9lwqjF29BnM/BSsNM0S+BLGGk5nExH/ULJTL57T43e5FuJn9LrFXEqkv
	 mooVamtuOInqodPUWk8txuJ3yRy0NCTjGS4XALxr8pmA5k1lrW9amED4kH5QAnGQTgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGuOtdfy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F4606A891;
	Sun, 15 Nov 2026 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGuOtdfy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794749258;
	b=VlRiLA2MBzLtsVG6Thr+qnGhph0C0AU5crjulqbq2ynoSRVB3Cquy4phZcH6ljf7p74u
	 cW+1fWa74o6niFtt/l5l0NJoklF6suBE7NN6aN7PTEzmRVoX2mjpXz2meCqGlNv6GY31I
	 I5xHpeGD22r7J4vjeLLBWeVbTd/gUvaxi0DQMrLmVSkgP7NOd5UytDuhsyb5mZC1hmSAJ
	 W1RJHUlTvwN4kEy04O+0RuSk7JF5GVLQ5TuuakLsqyuWl9oppsrnme9g1SbV/dbfRO4RB
	 4VuAPr8nslGhb8TVTNzY7V6FTD6z/mgvje1ZJDm5R9z9VS9Ie6RoWvJLZ+Bs8tlK60Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794749258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bEv4AHDUm026GE6n1cBpD0QcLMp6c2PdbcmzdzW9Vts=;
	b=MSMTsuz7cwPPUEnKnLfBLk3fjmk/gbHw5e5HRaHTSTR07IcKtX/ek4Ot/0gGVxCX6Amm
	 i5wFwQ7xsQJxkH2+ERcAcMf9/JhL0Cq3JZk72tjIrDXr6NoWAJubqwUK+dwONWrMtFoP5
	 HgPHNBL5RFrp34Whn+9BsoEmXQQUzg7kxTTA4QSBIFcv6McClwd87Zg6ALtBZiVo+ncIS
	 j1YN2Jb8JLQeFOmKlLQ3rVSOLWKj9+GaAgdkHtyOMbrJIWRw7ZyllC4Wsf9b5FGYbM91Q
	 6EPuxssIemAI6bow/OrxckK2CaxI64UHb/50R33xEzXG7mADnaHcRrMQIVTQ2FO0PyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DDB61F000C8;
	Sun, 15 Nov 2026 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749258;
	bh=bEv4AHDUm026GE6n1cBpD0QcLMp6c2PdbcmzdzW9Vts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NGuOtdfyMPCBLLVd7wHSmTuqjOzN2CsavEyKDRnO9ZJ81G0UtfTJwwMRrEWb7ChsO
	 neGqN1dO1oVowcnjyOE7gLdUfWarI2VPHKafQl43DwPJaZstwqv3pF1pafO5orKyKf
	 F/jtmvUZesm96Zl5HogmcxEaKXvUku6rjrFVRIh0gVE1kLKbVHeG57WqLCGbVGty7a
	 Z39J5XngGeNOduU3JWoShhhFNBEa7j7wn4NvIHdC+WQx8qBCLTL7QTHUSdy9z7T+iv
	 2YD8PZ7IbL7RD2ebhLmF4DobNDBzXY4zA05N7tH2pXqJair0AeVnAEH3B6gqZiHypB
	 PMolp0ZM781hg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D81584A0AE;
	Sun, 15 Nov 2026 13:27:35 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 15 Nov 2026 14:27:31 +0100
Subject: [PATCH v6 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
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
Message-Id: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-1-fbdce4565a5c@free.fr>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
In-Reply-To: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794749254; l=9059;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=qg98rjtoU5lxO3S/IIt3AS+9TwVrpblI1bgZQ2hoFnE=;
 b=vm3wjGyac1q+C58SL6FxsMuCzsZvjy2oRB0XQHbx+HG+doRPjp219SVQ+rpV3yyfPs1HgYIo3
 EsleuxYvlExAZ2IG3kbzXBpvmBIlbn1V6Gei+r7uCeATrkSGuVp8CjA
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

Each function lists the groups that take it, so a pair the driver
would refuse, such as can on iic1, is refused by the schema.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 309 +++++++++++++++++++++
 1 file changed, 309 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml
new file mode 100644
index 000000000000..f835ebe332a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml
@@ -0,0 +1,309 @@
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
+        enum: [ asleep, can, evt, flexspi, flextimer, gpio, gtx-clk, i2c,
+                irq, reset-req, rgmii, sdhc, sdhc-clk, sdhc-data, sdhc-data4,
+                sdhc-spi, spi, tsec-1588, uart, uart3, uart4, usb ]
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
+      - if:
+          properties:
+            function:
+              const: asleep
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ asleep ]
+
+      - if:
+          properties:
+            function:
+              const: can
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic3, iic4 ]
+
+      - if:
+          properties:
+            function:
+              const: evt
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic3, iic4, evt4-3, evt2-0, asleep ]
+
+      - if:
+          properties:
+            function:
+              const: flexspi
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ xspi1-data74, xspi1-data30, xspi1-base,
+                        sdhc2-data74, sdhc2-base ]
+
+      - if:
+          properties:
+            function:
+              const: flextimer
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic2, irq7-4, irq3-0, evt4-3, evt2-0, clk-out ]
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic2, iic3, iic4, iic5, iic6, xspi1-data74,
+                        xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
+                        sdhc2-data74, sdhc2-base, uart1-soutsin,
+                        uart1-rtscts, uart2-soutsin, uart2-rtscts,
+                        irq11-8, irq7-4, irq3-0, evt4-3, evt2-0, clk-out,
+                        asleep, reset-req, iic1, ec1, ec2, usb-ext, gtx-clk,
+                        sdhc1-ds ]
+
+      - if:
+          properties:
+            function:
+              const: gtx-clk
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ gtx-clk ]
+
+      - if:
+          properties:
+            function:
+              const: i2c
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic2, iic3, iic4, iic5, iic6, sdhc2-data74, iic1 ]
+
+      - if:
+          properties:
+            function:
+              const: irq
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ irq11-8, irq7-4, irq3-0 ]
+
+      - if:
+          properties:
+            function:
+              const: reset-req
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ reset-req ]
+
+      - if:
+          properties:
+            function:
+              const: rgmii
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ ec1, ec2 ]
+
+      - if:
+          properties:
+            function:
+              const: sdhc
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic2, sdhc1-base, sdhc1-dir, sdhc2-data74,
+                        sdhc2-base, sdhc1-ds ]
+
+      - if:
+          properties:
+            function:
+              const: sdhc-clk
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic5, iic6 ]
+
+      - if:
+          properties:
+            function:
+              const: sdhc-data
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ sdhc1-dir ]
+
+      - if:
+          properties:
+            function:
+              const: sdhc-data4
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ sdhc1-base ]
+
+      - if:
+          properties:
+            function:
+              const: sdhc-spi
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ sdhc1-base ]
+
+      - if:
+          properties:
+            function:
+              const: spi
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic5, sdhc1-base, sdhc1-dir, sdhc2-base, sdhc1-ds ]
+
+      - if:
+          properties:
+            function:
+              const: tsec-1588
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ ec2 ]
+
+      - if:
+          properties:
+            function:
+              const: uart
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ uart1-soutsin, uart1-rtscts, uart2-soutsin,
+                        uart2-rtscts ]
+
+      - if:
+          properties:
+            function:
+              const: uart3
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ uart1-rtscts ]
+
+      - if:
+          properties:
+            function:
+              const: uart4
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ uart2-rtscts ]
+
+      - if:
+          properties:
+            function:
+              const: usb
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ usb-ext ]
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


