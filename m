Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162500;
	b=p5kRbaR2+GutfHTXQNtzB71X77mDVlpaTYlxgphRsuY0vUGKlU1BiUxrAC2dLKbCRENO
	 X17auBAaUGYutVxaCmpzVY5cL0Yv6ZNlheAPgjQMpLYtTXwdO6RLt9g8q8tsIpVkVxPoJ
	 TAV3oSk9yrivkliYJXpR/vCDAOZeE1OBSU07VAkRTQU5BljmA/BvBJ59BAAGBZcMxk4RW
	 1sGzA0/4BH2j4+8/4MspBG/n2CTB2/ry1+g16+BkleJDo98stdblmRAoe88xSHTXMyuik
	 B4odzqWBRkzrux77KlGen5hPZOrHzdXqSc9pF+ee9xZCAbiha9sXMH/aCbd1gMIFp/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
	b=rSejpXjt1LtuV3f8OOr6dw1Zc6zYLn88WFa8zscpiSOoUH+IHbOJ6gL6HfS9MrpqSMuS
	 vAje+j1xd3KeMxBPt2SzyYV2FrzBHuGy0HG+kd3d54e26o/KAK9pHQSdlVeG0hR+G6Kk/
	 VCCSOedu/9qs30q5wA9VN0Ql5V0gGaZRDE/ebctBTj7ffp55I5E3WmB+bynuJtiS+XheB
	 HM9NOIUgLKD58c+dvqFlPa1sCHM9CVcvhuWsnkb0hGTm+PlYrVE00jaMZKdiach6831xh
	 f6f3vFVTHhl7baxGDyDhBVHA4ohWzCoZiHZ/F8+czIgxBhZIh1C2hbmKZ3HgFqMH3fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttDKNk0J;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B30606A335
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 18:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B30606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttDKNk0J
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b57182c4c6so287694a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 10:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162498; x=1794767298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=ttDKNk0JIjz40p5eAC2BNCurW3OhYdjX2lUfcR5EYH+/JW7CeOFl3REBKkIdtk9zKr
         RqOEXHqBxse/3VVVI/EdR3uRRLcgmcnyJXzMWquPJJ4qc7U/VhX9fTgCL1SbITMe242Q
         dV1qKGqiIVwYaUi4fqKPTtmnhkPXKgnFwi+cl2dnOqfY1DT2+IPW9mpm4XHpTAUdTRdr
         RGxMzSHZCz/CW0zC+2pQNVOqqNzjlZVreZyrxS9cJhTYkuirzQ80Nh/j9DS2LKYt7EG7
         3BKh342u1SmEXIxidbd3ptBP8mQvsGAo0uLn4AG5ap1/iXZELVbEnTTzABUGSLIRfFVi
         RWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162498; x=1794767298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=UQAM4WhJNitKMlBMWEZJKjg4Wlp02zyAJ71Ln1NGPUZO/paDIlYtb1NHC3erGWerPn
         AGE5xamltxaGMgR8JGGGWw4gPNIlQ3zjXda3bigMCqkSj54/+DBzJYQUl1GIlQ2FWoZ4
         rJanpBmK26ObXZSVH8Wy+o/xsY9vJanzS2p1eynuCiTWhUrhf9PX+zTGt2Dl5vf3ct6g
         1tiPHC7cu8UfsZAgjda4vI5R17Ikwkk9I6NjfBto7RphRvQ6n0fzYGcT5c75ndlqmkSi
         C1XGI3M3z7wtCT+MOrGkFF/urt06LPsGhhezGfaJMvjT87k4cIxEFfqtasLYlOuSvheZ
         EQGA==
X-Gm-Message-State: APuU4Z8bgVbrcrM1erU1/0mGLvCAazVGzUlZkkhro+8/1Z4tHf2fzZLx
	cMWkm624q8JV2voxUE44Alan+eVDVcF3qlsdQVZ39/wr1qyVOHy0AdmM
X-Gm-Gg: AYBFou2DdkF+wujfqCU5V75QWn/zUrB2n6LzofgWFsxnOT7kTjkrnQZPv/hs0GFGmZp
	RT4hjE3/2vTG03NtVJrJCFFeWeZ1pXC6IzGStdijSTmvClndQE4zDx5sPwe9/8gwAGYL2Dc506y
	qRuBsKgK0QpfEY9jqp7+iW2pHPGVwGvp1MjWfNRGQmdU8BIqpwQAvHsGCsWQp4IPxRZhBVQBPHJ
	WcjpHR6KIElGaLfaKJPGzB6IHHsrEX2/h2ptaz0E3MlvSmV27I5HcErtDprlCX5RtJk0f6kqJ+P
	hUAoLkCF2lH9yrZL42Cpq9K5l0ylcalSA60oq3urQbxw5RYoYvhGONu4JEJpzsHxB6ZBcto0PH+
	omew6zx1IWlaseUW8oEsJTtRxDAUQV/Su3E0jfsVOxBJhIyJauLACd9siIQCgwiojP4mAqkPUL5
	kM0W+N7b4oAgiwSNjXiNt8S3bTYVaBpQrQrY7BvKhzOsVoISa4uXAG7kDJFPyn73j2TVMoQnF84
	ZQcEuvCQJwPwifETW5egCRx5PkG6P85IZ3WS0Kf6myKG503NSx2RdDeP67GJk6crEBmX7D6j03B
	5uS8LeRIG2RL6Vh+YiClFUcDvIjQiRhXkOM0iHXDU4TD2tCUvK+ZcnSNa4uq/4n1
X-Received: by 2002:a17:907:1b18:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c4d6d166840mr141985166b.3.1794162497894;
        Sun, 08 Nov 2026 10:28:17 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:17 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Sun, 08 Nov 2026 21:27:10 +0300
Subject: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Document MT6895 pin
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
Message-Id: <20261108-pinctrl-mt6895-v1-1-f704c443b31a@gmail.com>
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
In-Reply-To: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

