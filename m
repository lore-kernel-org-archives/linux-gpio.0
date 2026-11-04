Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776888;
	b=cTT+3sZt45BdBrr5J+l9h5mMm6VGac7SZ6xlg2RQUZ7qb6v+06kaucAJoYzPikbefH/X
	 iO2/v09ci74b3Ho+txU9ndf3qyMfM/YqtFUOlGuTcSxAKez6MgFKcw9hu4xXETFSPijSq
	 XEYCt/AmAR23QclB+jNco0iw31QplbmOwVmzGoCHPV77QJo2/pP2/pB/Mb4BRxqVhw11L
	 k/sq8RQMg7O4Fsn7WWvPiHAdN1ghc1CyCEgVnkCYOyApG1aVEPHMAne4binjf/z1aZJ9T
	 70nP7rxnjKKIa7SgsItORjdArR/0XHSw8zyRzjz5f7skDtOaLESPaVK4xEyJpMM39IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776888;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wSocpz6KEMBW/1+ZrcHOyV8HiUZsvlaMjl5gpMzyycE=;
	b=14BL1saFJAzXglpc0c3e6aGYKDWALE69frs4z+HyD4sHuTJ4BeAs1akkHe2nkF1Kbw/S
	 0e0u0zE5EP1nBVlsGTPXyxWc5eal51TbzzpQr0h04m/K9kk8mzC9gI8zGynqGSOgvenLq
	 Q7pUsoMcacBMaAD73s+ZC0R11Bj7rz6RAUqrL+z4j/9nnYW0rqgVXFYD/UOzU39teU3Gl
	 P1tDTOnA4l+cSXmJdP4CQlMD2L9bFfoaV81a4fZWBAD5b2RO4RJiRa1APhqykTGhQNAp6
	 H9rNbQhMcd8i/5ANbsqJ36yZXT9tQDUls/TtJch/z+dhJ4h9GccNktBaDRQSRmw+rWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oR4sEmIQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB05606A32D;
	Wed,  4 Nov 2026 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oR4sEmIQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776887;
	b=19yTvHI9XYi+MLy8IHQNkz1MNZ2G6F/2ClpH+vy+R4nvIisl6xyylbol3gdLmhu6/swU
	 oIbWya4YE1P0vWpCPiv/3vlCIg1QtK/qRecGvnX+WFv8swBboQcqOngwycCAj6OuPnfg5
	 b38MfVjHkM5CufSPlUSOudgcxyDNhXkHecjBBx3dngtlVg5KBQrS4vUEdTHTsAYd3prBP
	 7nFWdMZIoRNviDDGRsEm5cSHs0nS4MxpP146fbK6deDQjpQWnT5hf5OECmsQJLaxHs6XV
	 519aE78EfbvezxsYWSuaW6h0P1wSHnl7zcmtGrVNmZehw+WCYxQ6OwjId+Wl6e+VZMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776887;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wSocpz6KEMBW/1+ZrcHOyV8HiUZsvlaMjl5gpMzyycE=;
	b=OLxre9K28HPO9PeUFW7lwyfr8thqIrifWihevuH4+L6Eap8YNVfIHRh6sjES8cqexAS6
	 5485otx3ptaOJu/09xGddjyyh4y/SuOkM/9+IwQf+c3llQVeW9MnHgkD/BVs2P5FCmTYX
	 PQXPmvIULsLOQxFvYsCBk7M3WfXDeInInkwYrdhjleLYFbhneK+kQphtv/WITXWykEtBq
	 2P7CH3G3ASLQxo1rs29O3MKmO0XQJYyDTWKS5hfKB76v0IQhmu230y+5x8+ZbeTESGe6p
	 5jObUH/3CBD2oN0h77GPpPCJc2z9B0AhixUSvOpZa4GFdDSRNw7u79RmHcoZBLzjBLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 811011F00A22;
	Wed,  4 Nov 2026 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776887;
	bh=wSocpz6KEMBW/1+ZrcHOyV8HiUZsvlaMjl5gpMzyycE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oR4sEmIQEHqlteIJCI0u4ag81p2xixt7wzja1d7hd36884jad3gayahNH6gBuBfI+
	 rCaF05AZ/kqaxl2W+MrT2GzivyEppI34KAH9/xVaHoRaeFUcV2tHh83PJrYve2q4Yq
	 1ViCV9fvNkv1wrWXCbGb3pgOxCwKZ1WjwqVQdc7BrX0nVsNqI8uDXLUnvIY0loeTPr
	 duMlzZE29EDM+6PF63R7/5zfPZl1lpLKfifeEafiHRKFwrq4ln2iYKdmpXY6BRr12b
	 zEDbKvBBgyfOHSMoI1qI6dG2jtgJ9X4PBUZwBfhhzMT3Ra8fzFhg2bJeV6dtKiVmbh
	 YFwjJVUaGOH1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 175AF46D04;
	Wed,  4 Nov 2026 07:21:26 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:17 -0500
Subject: [PATCH 1/2] dt-bindings: pinctrl: Add Siflower SF19A2890 pin
 controller
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
Message-Id: <20261104-sf19a2890-pinctrl-v1-1-4bb83afdbacf@telaak.dev>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776885; l=4104;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=uvG21B5tUVJx/q6wef1eKLd9Cm0kUp4Zh6o/D4Wu9yY=;
 b=/BSAOaOZUEfcEYUShRNKpyaO+SDmuLjOz5hiRXmsNkjcumw2Gcn7UM3YJUUdreg9jv8Znwmpe
 4xZrhvCmmnLD0vGY+I4/e6tCzOuCd1CKicogPg6EdTrqF2wGC/vPMOa
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The pin controller of the Siflower SF19A2890 selects the function of
each of its 49 pins and sets their bias, input enable, Schmitt trigger
and drive strength. Each pin has a register pair of its own, and each
pin state node holds subnodes that set some of its pins.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../pinctrl/siflower,sf19a2890-pinctrl.yaml        | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctrl.yaml
new file mode 100644
index 000000000..8b52d3175
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctrl.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/siflower,sf19a2890-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF19A2890 pin controller
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description:
+  The pin controller of the Siflower SF19A2890 selects the function of
+  each of its 49 pins and sets their bias, input enable, Schmitt trigger
+  and drive strength. The GPIO function is selected through the GPIO
+  controller, which maps its lines onto these pins with gpio-ranges.
+
+properties:
+  compatible:
+    const: siflower,sf19a2890-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      A pin state. Each subnode sets the function and configuration of
+      some of its pins.
+
+    patternProperties:
+      '^pins(-[a-z0-9]+)*$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+        properties:
+          pins:
+            items:
+              enum: [JTAG_TDO, JTAG_TDI, JTAG_TMS, JTAG_TCK, JTAG_RST,
+                     SPI_TXD, SPI_RXD, SPI_CLK, SPI_CSN, UART_TX, UART_RX,
+                     I2C_DAT, I2C_CLK, RGMII_GTX_CLK, RGMII_TXCLK,
+                     RGMII_TXD0, RGMII_TXD1, RGMII_TXD2, RGMII_TXD3,
+                     RGMII_TXCTL, RGMII_RXCLK, RGMII_RXD0, RGMII_RXD1,
+                     RGMII_RXD2, RGMII_RXD3, RGMII_RXCTL, RGMII_COL,
+                     RGMII_CRS, RGMII_MDC, RGMII_MDIO, HB0_PA_EN,
+                     HB0_LNA_EN, HB0_SW_CTRL0, HB0_SW_CTRL1, HB1_PA_EN,
+                     HB1_LNA_EN, HB1_SW_CTRL0, HB1_SW_CTRL1, LB0_PA_EN,
+                     LB0_LNA_EN, LB0_SW_CTRL0, LB0_SW_CTRL1, LB1_PA_EN,
+                     LB1_LNA_EN, LB1_SW_CTRL0, LB1_SW_CTRL1, CLK_OUT,
+                     EXT_CLK_IN, DRVVBUS0]
+            minItems: 1
+            maxItems: 49
+
+          function:
+            enum: [i2c0, jtag, mdio, pwm0, pwm1, rgmii, spi, uart0, uart1,
+                   uart2, wlan]
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            description: Output drive strength in mA.
+            enum: [6, 9, 12, 15, 18, 21, 24, 27]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
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
+    pinctrl@19e3fc00 {
+        compatible = "siflower,sf19a2890-pinctrl";
+        reg = <0x19e3fc00 0x400>;
+
+        uart0-pins {
+            pins-tx {
+                pins = "UART_TX";
+                function = "uart0";
+                bias-pull-up;
+            };
+
+            pins-rx {
+                pins = "UART_RX";
+                function = "uart0";
+                input-enable;
+                bias-pull-up;
+            };
+        };
+    };

-- 
Git-155)


