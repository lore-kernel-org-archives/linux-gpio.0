Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018685;
	b=p5PMU32TOB8GhykiaaeMI9jwY4IaW9cE2nNdfpyfd645D5FwVLXW6rGMDkq5Hj2USNMw
	 5hyi3LJvhfSfRyB0XcFYtHFU40dosFlJxb/yUBZlDlI2FnT3c1bz/1gX58Fw/XKwug8MU
	 ktugZK5sKYEMS75I6JAo4daEmNvD8RY6DBG/u3orQ1kSgA6HdKx41drL+LRoF/Zi9ecjS
	 U/lfuKQ1Bae1++f9wtLPK6WsRPOA0+49rFJMzQ7A9njSexFTOxB8sFrUZrYEXLJLpRPtd
	 Ee0Ghhn3YcWxbze9GVF6nxQnlT3NWFtCKI0fxY83cCL5Z5irBFc/GuM74x/LnhuC8bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
	b=SYkSuBAss76a0mV+HJ1ry/iGe/mbdjN7XsRh502L9zJqnst++/heBvvbFn6ju+rhGecA
	 0XFmAoosyrSUCDnceqAswZwEhqZVoTvdAX0PWBE3QHHcVMF2/ZaGiWyExVB6myljl0fgz
	 Pa78uG0Owi5ZLp2JtXFhnRSHD13eTfyM/QnZGh4qePOGL0qOA6EofTw/dLQfjZW9P2hXY
	 8Jj2uB8A5pKJe3YOt5zlQUGrG7Nxxhcu9JcAY+hXd1yU38rHdtJL84YuopQX/2hNZTAd3
	 ZJ/ZAxY5TJAONT3vixMcxGB+iRFqp0hMjkicSaAMyBKmJReBQN9qQN3OdPRtrdN7V3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INhYelj1;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2E6606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 16:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INhYelj1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1022322f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018682; x=1795623482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=INhYelj1LEYaqGoBDCuvrrveeso60ukOgq2hTL9neUaVi+4X4/dVhfcMu0L3u8Ddwf
         pyExioSsOWNW8wX9PQIejlbwVoqC3NpuG1IwH8HYCwXcZVv+6GSKyxSHnUESrRowaS55
         QUDF+me8xb7sOQqEUPqTG/jH6doQ+HnmcvGOG2sXKCP8ThuHHVIe9L47H6hiM93o2Nws
         3Vkc0XjJQQdDYefMY17+oyAgf4hrCbqFX0iWVzHFHJwYzHl5kX5lK63dGBkkmwpmzHyX
         EsCCoPR0F0+Jhl1Fd887rNbWcaOkQtrHc/VuKaL+nGiwG4ylx5aEQIcFJk4EyCo+7gWK
         mD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018682; x=1795623482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=jnqg7l0TaHniU4XHqn2rSVpjx1ZJfzQweQ5StCn8tQls/dyUoJUMYPen6tzTb+t0GC
         CpwZ1mn+mTO+XFZkmXbywqv8ODcjARt05p5Na7pfOFui5gfczGkBs2KOE5P8+clE8hg1
         3x3lPTtwOPvHidsupUbodJ7owPK0P5chq1Xpx5CfHCbGMQlL/7WwKT65O2FA9ehZF565
         QO1ZqPeXPQkV7LFpZfWjXBSsIpUtib9LbgzhToWQBdTXT2zSQj9GLyfbUA2h5vdH2o7P
         2acwoT9uYWKmB6DZgSSNEtM3kxIMfafU4Ww+pTA7QgAelrVe61+5cb2MCUJSg2s5TwdU
         zYag==
X-Gm-Message-State: APuU4Z975K2ra95hE/ow/xyJkC8Qg201zEp/ufFtWSDoKzFh3wmNtugo
	6JPpPOmLOHFfiobcM2NY/DBqNNeXMuKO5QQZWDB50/2dLWv3nMak7l6i
X-Gm-Gg: AZFdTZf+8C9DePlsX9c2j3kK1uHP+9myRLT0meycP8L456ATw/lA+UdH8L07dykDXnD
	Rt8VeS+Yh4GRzABkPAB9dYkY2PU/z7MvfAuBhmjY6YuRk62fs+Up3bpZD/usdkIsgNI75UBZPGm
	P7MrkVT43/03IpQacnH3EZcURfKS+O4SkYwS7mInYqsuYd19eEitPPHCf53iqDrsKdUUE9G8gvr
	kMMpKVfU01fgaF4u2wBgu90cQLViOqzOQs+oP6NSUyb3PJaKjj4s34iveLs/PGIu6VrwLnQiHIN
	2F9T82CmcUv5TbM4hz9nATQrB96XD6hfDxwxaRAt/hL/9R8W6Zm5xM4I1rk0N0Le5nsQotx7l/C
	0VoP1XFlpKFPitWKhEKwiwrvOBNpVb0FEyq1517EphOnLqQSTUp0q5H7lneDuRLDYyWSf554alz
	gAaXaTxV8Xt9s87kq6gCytBbPl3v8psWaUQH4ZBGdHra9/ZJGuokvD1HyDVlIkRh3oy3iDGZVr9
	0ye4auoxWNRqtlcle1eokEtLtL9hknlcIe2OGFQ6F9HXhhq6oSDbTZtjQXtQr86ryh10m1NES0v
	RY52CGrhHvN3QeZB+XL5lU7HBnO0njSGM7/TALopviZLmN2FwG8uuHbZu8YqOVfGDlgEDSreUdF
	ZlRNZ+QWV30nVU5GxS+wRFgmF29Pp1EvXLA==
X-Received: by 2002:a05:6000:29c8:b0:4a3:c963:c1c3 with SMTP id ffacd0b85a97d-4a63937fce8mr4376849f8f.15.1795018682433;
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Wed, 18 Nov 2026 19:17:36 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: Document MT6895 pin
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-pinctrl-mt6895-v2-1-0728c4eddcac@gmail.com>
References: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
In-Reply-To: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add device tree bindings for the pin controller found in the MediaTek
Dimensity 8000/8100 (MT6895) SoC.

The controller has 227 GPIOs spread over a GPIO base and 13 IOCFG
blocks, and an EINT controller made of five blocks (W, E, S, N, C).

Pins with PUPD/R1/R0 or RSEL pull-ups take the raw MTK_PUPD_SET_R1R0_*
and MTK_PULL_SET_RSEL_* values in bias-pull-up and bias-pull-down.
There is no public table of the RSEL resistances for this SoC, so the
binding does not offer the ohm-based values used on MT8188 and MT8195.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  | 228 +++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
new file mode 100644
index 000000000000..e3ecfffc084e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6895-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6895 Pin Controller
+
+maintainers:
+  - Alexander Letuchiy <asalde.le1@gmail.com>
+
+description:
+  The MediaTek MT6895 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6895-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: rm group IO
+      - description: rt group IO
+      - description: rmm group IO
+      - description: bl group IO
+      - description: bm group IO
+      - description: br group IO
+      - description: brr group IO
+      - description: lb group IO
+      - description: lm group IO
+      - description: rtt group IO
+      - description: tr group IO
+      - description: tl group IO
+      - description: lt group IO
+      - description: EINT controller W block
+      - description: EINT controller E block
+      - description: EINT controller S block
+      - description: EINT controller N block
+      - description: EINT controller C block
+
+  reg-names:
+    items:
+      - const: base
+      - const: rm
+      - const: rt
+      - const: rmm
+      - const: bl
+      - const: bm
+      - const: br
+      - const: brr
+      - const: lb
+      - const: lm
+      - const: rtt
+      - const: tr
+      - const: tl
+      - const: lt
+      - const: eint-w
+      - const: eint-e
+      - const: eint-s
+      - const: eint-n
+      - const: eint-c
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below mentioned gpio
+      binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 247
+
+  interrupts:
+    description: EINT controller interrupt
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux are defined as macros in
+              arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+    #define PINMUX_GPIO6__FUNC_SCL0 (MTK_PIN_NO(6) | 1)
+    #define PINMUX_GPIO7__FUNC_SDA0 (MTK_PIN_NO(7) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6895-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11c20000 0x1000>,
+              <0x11c30000 0x1000>,
+              <0x11c40000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11d50000 0x1000>,
+              <0x11d60000 0x1000>,
+              <0x11e10000 0x1000>,
+              <0x11ea0000 0x1000>,
+              <0x11eb0000 0x1000>,
+              <0x11f20000 0x1000>,
+              <0x11f30000 0x1000>,
+              <0x11e50000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11fe0000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "rm", "rt", "rmm", "bl", "bm", "br",
+                    "brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+                    "eint-w", "eint-e", "eint-s", "eint-n", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 227>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        gpio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                bias-pull-up;
+                drive-strength = <6>;
+            };
+        };
+
+        i2c0-pins {
+            pins-bus {
+                pinmux = <PINMUX_GPIO6__FUNC_SCL0>,
+                         <PINMUX_GPIO7__FUNC_SDA0>;
+                bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+                drive-strength-microamp = <1000>;
+            };
+        };
+    };

-- 
2.56.0

