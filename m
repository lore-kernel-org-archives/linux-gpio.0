Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459279;
	b=AbnKTmNWsrhkhQV+dEERSPKHFb8u/htd8G0XBiWhZ6zdS4WXys4C/4udr7XcIksUMvmz
	 Q7GjHh/Yi5ROy8aIETp4m38blyPvWLDXR6twsKRwGyojs1aL7qDYtKJGmTC1Q0Gx6TlJ9
	 RAsPNd59UBrxPQ/HtGv1aly0nW6DDyzlF2y/nMHmWhJEg3WYI8PpNdH79XZjPwMnpl85X
	 5rCt7iUGLdG3VOwQMu9hcpT67iDZI5rhQ9gcCMGVQ77f5KRZztXNxv1agycg2lfUrjctJ
	 oAXirvHUFqq2TXQs4f6o4VE3kPFfI3cUJysZ+TQnuacBuXJY8MqbhutmQBM3Ij6sTQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459279;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	b=HXWU2kz4FnbDwiJpz4sRGW78fo40SJ9IU+9OMojWvpqO25tve0I5N1phj+N5oCTrQbat
	 ZU5tvllFeDAgJQE1dlatisfxsKLda9MGoyupxY4qa25s448v6E9SBm7Zv8drHaJcP3rKz
	 0/jAZKj338SSobJDUnMYa+x/iyH28LfpT4OEAw/0ChbgykhlA9CY7KuLupjlmv9shVe3E
	 U8CwVl10W+f7lXBO6Vz4kjocIxzjS6oiGmJnlnsZCRu5kC4/LP0EORgqhQJNNUI1zM19M
	 kqKYRiHioTPhmDD2t8I75U2epFO6xX11gP3eLmxpE+rHYKU3I1r4+oxpx/5hX5r2I7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCLZRcQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB6606A332;
	Mon, 23 Nov 2026 18:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCLZRcQR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459278;
	b=nOFI2nR9O02h+2s9rVukDxLQPHKK+lsLN92RpJ44it9hAlNcCbeWlRX4il80gNy94poK
	 sH42TDKYpuf+7qZ0HVgB7jtnwlnUUg7TghuNdiBTR12Zzl/XkDTq7+Iuy664AXYKvx/Yt
	 5sFaBQ6F2KmDMM/ZqwFquBaWr6K927BFXIQXVabugmQO6idEtWK77QNxTl5i/5B7crSyt
	 yjXmg388Ab2dcOqMFpYEMKWcKvUYpN9Je3xc6QQx/Yw8e21srsK1bjyVtX+rK6MQeWIQm
	 ylP/GKirMPAp81S+EhYjQ3NrhulnydM3iJZJlFkntkDAJrALV4WIBppgnAZgxO/55oQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459278;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	b=z9TUIU/H+mDSBGAYVPvhKrKXmqVxX80iGSicYoxvYZYyxb4rw4WRK+U/I6t0BQ9KaMzd
	 V/PTfO3kMmuHp7pzinoVZ5ICtaGXX/iVKFSza8S14l6IJQ4wKZj2SY1T1kVvNm7ETnuSk
	 lRHrw0IPzoVvw2meGUb3flFSSo6X+up9+aEskNJYlAh19SUvY7INDdnSmRCW/yPEcuggm
	 TIsaub/3KG7Oocj/ahsZXJi0ENVhji2JAX4W1CFGcirUTP6WSSvqZJpTv9BSKdB+ItNAd
	 vgWYg/rU3GmKImNNTtT8YGkSJVtSQoilOkk4eXjEYKYXhY7ggnTbMUs03vEitpVhbGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C37E1F000E0;
	Mon, 23 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459278;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WCLZRcQRhnunx3ncBde7d4/wfKUikDruboZ4tfsbfUmediZD9zhOC1XLKOBk1L/c8
	 xRbs0APQlCjAwrWiOJdSAeoV+AEyUYQKyI5EVLDRvzWX+eefgV28B1oVQEp/5/SPyI
	 cvI3slNE4WDldtd4gkhmcUwTY5nif87TgNskEzmwvlQDlZL77QLKwv0utKhj7UWxym
	 4f2SgB+PfMqJ9rGmNY4nExWcBkBPnAPDT1K8HqrCD0/zC9ZPGQrtlj2LceLZTTD3IQ
	 SeXRQPKVYRC3lqohJ+kTeBwIMrH6kANfW9+g7szTnAUi7xBCTMwxv/lj0qRTfaFZfZ
	 VlbQnlZgYExfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4F2D84C5B3;
	Mon, 23 Nov 2026 18:41:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:13 +0300
Subject: [PATCH 2/5] dt-bindings: pinctrl: Add Cortina Systems CS7542 pin
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
Message-Id: <20261123-cs7542-syscon-v1-2-49858e631449@gmail.com>
References: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459271; l=3060;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=F7pjXfN4EBv+S1ypEhkh5BVaKDFizMnbeKv3RXHbfp0=;
 b=w8dkZuv2wVtDFo9Ev6CsnIlivgO3sDNUIIHTMLKxbC8nlqrBQr1KZ8oLyKx46tGoO9O33Cy7/
 StVSRq9sZfIDaPDpwNf8DMlihSaS3bGND+y2N6FyXPtGX8HwNfZ3M28
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the GPIO/peripheral selector in the global control block.
Expose GPIO selection for all five banks and the UART signals used by
the OpenWrt port, without inventing routes for other peripherals.
Register offsets and masks are kept out of the device tree ABI.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/pinctrl/cortina,cs7542-pinctrl.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
new file mode 100644
index 000000000..cd5c81a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 pin multiplexer
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The pin multiplexer is a child of the CS7542 global control syscon.
+  Five 32-bit registers select GPIO mode when a pin's bit is set, or the
+  peripheral signal when it is clear. Pin numbers match the five GPIO
+  banks, from gpio0 to gpio159. Initially only GPIO mode and the UART
+  signals on gpio72 through gpio77 are supported. Other peripheral
+  routes and electrical configuration are not described here.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-pinctrl
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, uart]
+
+      pins:
+        items:
+          pattern: '^gpio([0-9]|[1-9][0-9]|1[0-5][0-9])$'
+        minItems: 1
+        maxItems: 160
+
+    required:
+      - function
+      - pins
+
+    allOf:
+      - if:
+          properties:
+            function:
+              const: uart
+        then:
+          properties:
+            pins:
+              items:
+                enum: [gpio72, gpio73, gpio74, gpio75, gpio76, gpio77]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+
+        pinctrl {
+            compatible = "cortina,cs7542-pinctrl";
+
+            reset-pins {
+                function = "gpio";
+                pins = "gpio37";
+            };
+
+            aux-uarts-pins {
+                function = "uart";
+                pins = "gpio72", "gpio73", "gpio74", "gpio75",
+                       "gpio76", "gpio77";
+            };
+        };
+    };

-- 
2.53.0


