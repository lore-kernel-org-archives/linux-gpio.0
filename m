Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729576;
	b=Cstpy+hyWdqXhYbhvtUGbYFIqwToitGjUv6NPfuizqLqwjjz7Mw1X/PZEtE8BXBhgxiq
	 CkDRYD8+gSb1USXvm1yZcC9m4vO61DN4BbYjwO6G+NP8oScMADArEGQ4Y12vnxZjWCefo
	 S88YuEhHp9h1+vEh5CQdc/MryR0EYWi8Va3d/9FhccIGga1qSkJ6yK8d6HZt/xD/tTp3j
	 25IUfdTZbz4NBvvry31QB2Lfb1SkidnkCfBoJC98yJvJc+maxZ2w1ZkWdXGyj5ukedE9k
	 R+rIrGVX+M7tOXAx0rUZaBjHZpVpPYawN1/GJw9Wt+MbAHlVZiGyn6SvML7TRfwTieQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729576;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+VethYpDeD8cBJtfjftox/I+dp+bcHzQkY8e2cJ5zMg=;
	b=1tZ+V2VPE4JGQfsPXv50pw1G8WGhj1oiJW2Hh3KlDZePXOdTLwENByuz/4JsmzoDcHff
	 8bm1ndj4Fgh3VUyr280PmyXDSpTe0hQ9MUUOeyDjDIBTjA20rJ0lc/YkuEr+tumQP8Z8C
	 FO4vqAEvTjLVGJ7FjvxMeukC1R1xOLJPM7zHCV9Rx3FZclfm/2bjmCfFOd65zmAldOSTL
	 eWIbmqXTlPylH5OYPnZE86CiQzCrJ4KDEC64Ox9ZVGlG0ZlKyRGrPytzfBV4wOxyQ3Gjd
	 tHEq2wuzRTD26o3nRwzlev9Y1w4MTTVjzCxhGH1CNek5lNtwqgC6hXTq54II5bXmZaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNG+eBzl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D8606A32C;
	Tue,  3 Nov 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNG+eBzl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793729576;
	b=Ht+GwXfbBvB6j0X90IGBxl06R+lIBU7lVrc5+5GManK+g+C4AYxlLx9TQUmT64EPphwu
	 nCce6FYOpIK1zq4DEjMkFKM5zX8Mf0ZiPrl9bx7o0M4CbKCVRY8XmXuPQSSu64emhKw/5
	 sdFZ317qq9uG4998HAECjiaz6NiXHOapUKewh2+6MjA7ecP5lv9k1Vom8P0KCPvyMEVpg
	 e4lQ1ixKezZ+BuHDYLH1Xs95RRilGrEcixx8L2n0EAEy1j0eGZff6x5qC0vh4PLSNBT3w
	 VWNPEyt5PN9DOkvYkdPLkH1tWPoEy3NKuZXYkEvjfH1Hu2h39fMO6DZLklapai0dhJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793729576;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+VethYpDeD8cBJtfjftox/I+dp+bcHzQkY8e2cJ5zMg=;
	b=V19ZrskncwPdpm0rtZeFMcF7fXuY0zWwN2YGTeE4PCmE87I0+r5hPcOyuUIVRXjq/BRi
	 x3GvO0B2Et1Z3VIjIwohdosY3ghrKa3I4O39GM1ayk3m1Ll1uBTgXzR8/ELANGwv5L3Z7
	 2SVBIIgFWXPtyTCqPBCFjAGi9hdSI/thIyKJwlLjsFxM4Nu48Fm9z1y6S91roRKTpyVA9
	 9ird9CA8mGdHMPTBe5a0Zdzf7VmzTycTOKNYpbjoJkBTEfHMK71VNUdFue8NL3btxKcnH
	 vqS64rRJ3ZLQUj+FdxZV2Hxi2gHSzPW2UusPe1dsIZOUYcnrV8rYV7AVWdX1oaDWmfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81EBC1F00A1A;
	Tue,  3 Nov 2026 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729575;
	bh=+VethYpDeD8cBJtfjftox/I+dp+bcHzQkY8e2cJ5zMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TNG+eBzl0R+e92oMRYLD3VuKc3CUcIG+OfGCVmv77BvK9lhxQOPmbj0cVJ5G6OL9i
	 fPvjbz5IxbAh9qWvRpmLjYH6ui4DK2qe6foVYQNC7dkeNIgjieiBw0kXoZFetIJaRW
	 1MUVrGpXIJh/xs7aw3Wm+3d/8EGN2QQyqEAkwX5/ZhJX8RkvAfllKeOzt7yNx3OJ6F
	 y2ihhbjEftsR2D7gByceOZ8L7+euwULyxS/jNcIi85DNxswboOxNZXvr4MMsdRys2B
	 u9SZjI5IrFfWujMONBnayZk8UdYUSkHnxSYtCXw/FpzyNhK3ZDn3A8NA2UNOSsy58f
	 0S7i38GaZraYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 11F8946A6E;
	Tue,  3 Nov 2026 18:12:54 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 03 Nov 2026 19:12:09 +0100
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
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
Message-Id: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-1-3aad0860b984@free.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
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
 Vladimir Oltean <vladimir.oltean@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793729572; l=7918;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=ty6ISFzU7SrNGw7OcI/Pp2eJayRFYgwQfnrs/NvT9aI=;
 b=eL539+d17qJ89bPU4hjHbTPiNaJ48QuQ1rziQkpc5Qwuq13fjyGsxDf4WYUNE0OdW76SezfYV
 +c6d1tAAQq8CWwSBWjUNRzgJz3Q7MgAMU5Rc4PnNmKZjUOqfI5mwLyI
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
fields of the RCW: read-only in RCWSR12..14 of DCFG, changed at runtime
through the override registers of its DCSR view.

Describe the pad mux as a node without registers, a child of DCFG: one
group per RCW field, one function per encoding.

Each function lists the groups that take it, so a pair the driver
would refuse, such as can on iic1, is refused by the schema.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 262 +++++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml
new file mode 100644
index 000000000000..b1ccd153a43b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml
@@ -0,0 +1,262 @@
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
+  The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads based on its
+  RCW. The related fields are from the read-only RCWSR12 to RCWSR14 registers
+  of DCFG, and changed at runtime by writing the RCW override registers in
+  the DCSR view of DCFG. The node is a child of the DCFG node, which owns both
+  views, and needs no registers of its own. A pad group is one field, named
+  from its pads, and takes the functions its field encodes, gpio on every
+  group and the others per function below, as the RCW chapter of the
+  reference manual lists them (the *_PMUX fields). A board selects a state
+  of its own with the usual pinctrl-0 on this node, a hog.
+
+properties:
+  compatible:
+    const: fsl,lx2160a-rcw-pinmux
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [ asleep, can, evt, flexspi, flextimer, gpio, i2c, irq,
+                reset-req, sdhc, sdhc-clk, sdhc-data, sdhc-data4, sdhc-spi,
+                spi, uart, uart3, uart4 ]
+
+      groups:
+        items:
+          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
+                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
+                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
+                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
+                  evt4-3, evt2-0, clk-out, asleep, reset-req ]
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
+                        asleep, reset-req, iic1 ]
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
+              const: sdhc
+        then:
+          properties:
+            groups:
+              items:
+                enum: [ iic2, sdhc1-base, sdhc1-dir, sdhc2-data74,
+                        sdhc2-base ]
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
+                enum: [ iic5, sdhc1-base, sdhc1-dir, sdhc2-base ]
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
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "fsl,lx2160a-rcw-pinmux";
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


