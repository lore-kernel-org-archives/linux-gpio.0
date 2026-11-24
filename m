Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495340;
	b=cTFnnW6A2BZzEo0gcqRfsvp+Bat2rcQdjbFQ3trRRhby4jTsMbLhUgj3u1eC9ZY5he5I
	 KwKvP1WNQblwy5V8yPm+sdMDDW+Hds4bDADINDv4F8HAe+avgQlgZo42UD6V2e7bqH3Bj
	 X10Qxzp21Og+eBXg6zWFgoeyU6d4+d5B1988FLWRWtt5L0lnY/kPRvMiy8vmep1GqelKD
	 VgavNhLXwst+u6xAdk1VaCX0oS7AKH7sCMtlnmvzAPcXuDcsmFa010zAe7/Ugsbugo/Mx
	 pCcmmUhwUGTYxkuVriArEck21MlobLDTLQFIX/IBW19RQh5Aegdtxo9WUMNsXEBUwQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495340;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v+VM2jCXebYg6g1WQdsru6bwAtnsIo4AwG7E7MYiMD4=;
	b=08E2EV6OeQ2h3vrMCMoFjtHytCi4psykkeeX1OJ9EkUebMw751thrC4TPD20u1hj9zYe
	 uxt9yFeO9+SPzYVQUHD9TZ/ckY4UJXpHP3XiHvPb0Ww/n5qs7IGnq21UxpWBQqzTHmGAy
	 szSQZyybMYMpH4TYG2f4EtHjvWzvJT6McpC5FVTDm5pc9271J6z1AftDcRKJNbgSfP4gh
	 uDjf92lctZwjxxQjj+baeY9YvmGO9Y5GDNi7q+7/UkLuKfBJSrj22pfnf/wJMB4IK5dHJ
	 B0K4Wy2UffpbzskcJkGosyt917UjbK1IxOADGOVtRioaaBmYUPq8MZ4Q4MqodbM08Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APpVoQjA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5634606A322;
	Tue, 24 Nov 2026 04:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APpVoQjA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495340;
	b=RvdKgQShE468zqv+Bl6fUxBg2NsdWaYSkcDd2nyf4iX4DBKLWlzNs0iKzWDBECWlLB46
	 MVS1inJf2pUR8q873n1jb3k//eOBW6QVOp6ZeJQsweGpUlvBZkPob65kcKaqbWFZV/LXv
	 XvnKajYwmFwtXgaAoi0rJ2B58pMWDXvkbFYxvn3Bz1HXNsf4oP/V1nZ0kDQ2tQooG/8r9
	 PCyI5q0M/3G4eyQ6v0OymnsBSBav+oz7nBnjkfJOcYYudRzETA2/Qzk+eeNhukJdNsECz
	 8bSxdpoWvdxiJpFb63I7PJIYWgMDeE5cQqpiilw7BcevHB6FCnKIuW8yVxhdQCZGxgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495340;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v+VM2jCXebYg6g1WQdsru6bwAtnsIo4AwG7E7MYiMD4=;
	b=UuwfaUNOrDjSIZXCXRub2Yzmvy5vMfJ7jPAPdSaa38f43lvFZkv8rz4nkTHl/zqNIfk4
	 XvRi7N3bfXtrLeIuufv0aXwoqyBo454BMkpf5p0v9UtoaCtuJL7Ko6r+LU4L2n0ha6dWo
	 T3lFV1OuJinv8/n9+lF8/kA3tOlThRPPsVwegDXUHslLYw3GrZ1N2s3y8+/1mQ9IDdTRb
	 8evzUDIHDVY8bHBWJCUOuD2r2xcydlzLaOibfAAbaEARxcJmV9ahCjR3zHbwAVICVpz5P
	 xGjn5GCsev6ZqCssnn92Jy8GdWEREb5xHOeraLDdG+/HM0LXEGJtR48LZ3fu05U6ePg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0268B1F000D1;
	Tue, 24 Nov 2026 04:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495340;
	bh=v+VM2jCXebYg6g1WQdsru6bwAtnsIo4AwG7E7MYiMD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=APpVoQjAdnb9DFACcjN5jL3ixOHlo3t5tTdGlATaN2ONECsPMimJ8AP2DrAMVQ083
	 IUbHsVLr1Mvy79ue67lObvbg8WteTiJ4zvl9HUOWR/T9AcB53XyuGB2/rGsjq/0YmW
	 ZIJ/DlI7TXJ97QfJQoQYdo/KH3RKO+vWlKSwRgMnGP/5eKPZsxkiO1Ikw4QLQ3JSZH
	 5o8WKmEbOqz/yGm/5aqr7rQsGtibUdQf+BSEFk1SVoyitI2vyAMT1PpiGBgiHcm63s
	 MCu1IGoZiEu0kVsN6U+I9mCVvrAKMgAYVlPmpdJFFCVuoC0Dg3zaWjqrmZocFxcYKL
	 Wa3d0tSJf0Y7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D68E4C8AA;
	Tue, 24 Nov 2026 04:42:08 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 23 Nov 2026 23:42:06 -0500
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add Siflower SF19A2890 pin
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
Message-Id: <20261123-sf19a2890-pinctrl-v2-1-a10af32bc844@telaak.dev>
References: <20261123-sf19a2890-pinctrl-v2-0-a10af32bc844@telaak.dev>
In-Reply-To: <20261123-sf19a2890-pinctrl-v2-0-a10af32bc844@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495327; l=4669;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=iTyoSTe09I7B16n7YHrhvYb3JC5vGh8ZVWkZrBFowLk=;
 b=fp8UIVwaXrMyz03ygr5JTFQkQnSbI9eqkHW4ZZPpHFX/Ct2DqTZUR+ORE12pWdHYIMswgy3dX
 lodd2pqWGfSDl2xFIouYtD1Z/ADy48G89Il0mCLI7/fiv1w74mqiI5E
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
 MAINTAINERS                                        |   6 ++
 2 files changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctrl.yaml
new file mode 100644
index 000000000000..0bb7c896f9bd
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
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
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
+            pins-rx {
+                bias-pull-up;
+                function = "uart0";
+                input-enable;
+                pins = "UART_RX";
+            };
+
+            pins-tx {
+                bias-pull-up;
+                function = "uart0";
+                pins = "UART_TX";
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9270abea0e12..9a31712feb5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25077,6 +25077,12 @@ N:	sifive
 K:	fu[57]40
 K:	[^@]sifive
 
+SIFLOWER SF19A2890 PINCTRL DRIVER
+M:	Joseph Telaak <joseph@telaak.dev>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctrl.yaml
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org

-- 
Git-155)


