Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612413;
	b=itzSPiYtcr7Lo8Gy6z35qB8L6MfqSZsGKNBqCWvIDwYLAGrGZ7INuAPPLlKGzWNnoUi+
	 R2e1oOFcAZ8n3F5AgV7+15hhz/Jq/QJGS5f2TNNdCYJQoaj2dfyHjXqE3BWXU37AT1Zkq
	 3AqcEEsY2gcFdcHduMvrnKYrs0GiOBXCBwq2k0YmWm3IM3FDJIsdXYWMXebE6CL0dC/3+
	 62m0By0dCgqp3tfrkAB4BUP7M0mSrVd4hxdIiLDrp/eaXA6ySe4vLWKkE/Xbnz6PYwtpE
	 lkUBch5HzrXa8ZXulZA03GIexCUGuMWbrk7mk4wMSTHlA4ax5dTWiXLrsH+VDo/A0aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612413;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=55Zai5vUFJF6y42H3h7fFkdKOBlnA3DVBhVDRli/qYQ=;
	b=u72A4e9/71/uVNcV3S82KaEcAfrooEAGqGbzH2WxGtk4/isgDPtTylEaZ8lVsLKl/O5v
	 0tpYsWHUNbLAIFHoskiqUhRcYbI9yzay6FWn249fnf1YF4cPOZRdjCHBVjHF8iEwEaAE4
	 u8tR32OBqEQfrlmobG1MwClfuty5uqMCAI5izSXaWToQUnJ1YMoRaNEjBA7j0lNOkp3os
	 M8/l09bzO2pI9ZDsWAeeoerNxZyvqynSYaS2EH1x/u3qwWiNKqSeq7PWy+/ZSchEXeVIJ
	 1NojllkP7FZ82t5QM39ScuhM/6jU/v19nz7BUYT+zrKttDUC2WpPQ9zmFIIASNk77tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftcL7VxV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1C260A2622;
	Wed, 21 Oct 2026 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftcL7VxV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612412;
	b=SJfIOSQQahB7IytLcf86xdD49Nm467rgdzjpA2xHsLL8KAirVjpk0b/1G6wyYSO+ypau
	 VU0LcYy+GwD/E1qWXoh6Fzf0p+VypZJI2J5a66hC1L/PEEKGDfsYz8J00S+0W0e1lesGW
	 VKX2vL9C8HZpOuw9Z3Z98UKUiziTFH9QSVjmPHyGCvFuN4cqVo+rpsqf+M9PuIhO13nM8
	 13dIVY4eYzW3XCVYH/kL7HXViAHA24jluZWwck7XmMGtzX68WF3bYaz3B5kHgpQCSUxgC
	 UPM9QZaEf5WPsG9hejQ9YhrYVe+texqwyJmzC6P7hrUDO891CptR6YX9IC2+d+CWKpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612412;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=55Zai5vUFJF6y42H3h7fFkdKOBlnA3DVBhVDRli/qYQ=;
	b=y4YfmSsu5mXf4+3sea7BXS78G44VdKZHdldQ2XdG7cHWBLK3+nQikwzBzyr9GvDjM8bf
	 3bIK+cE+0R/4dy8FDfATO/qSfmhMarZYyhFFkBJk/jdE3NLlerMrdfUHezkZNPaGkED+h
	 ze9ZS/Mh37oFU/ABkMGHW0h1VQTraklbVRHxXKRZqGaCxR7BAaSEJ+Wk2Yj0flOS/vOMk
	 n9KU3pqGbMFPKJibrHgCax4JyZXV08bga9LgppSc4rZdv8bm3VsR+fO+O1A619vOqflJN
	 8QQX2xT61h1GlrpQzbHL/9gTFaoVufM8iaH3lKFMiMqJ5C6rkggp+iOcs+//jgVvFYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00C6E1F000C3;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612412;
	bh=55Zai5vUFJF6y42H3h7fFkdKOBlnA3DVBhVDRli/qYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ftcL7VxVWOj3v2EH8pRMOV0OqqQrHsONZvF8PBkrAxMg3jI9YSrP+oK3EhPGHWkQ3
	 5t1X41qyWPjmmbX6ad7TlU2ixaaXtHQJGDdjVf7EQ4gIfmKj90kEnRK54cbhmHZSlR
	 EmqT+q9+c2hsS8RDW1H9P0EcmUGIZGHEU6SWMPCRGZNIm7gnY4IJdi/4hY8/XUbdKM
	 WbGWq85uH0PYrJyqCTHMpJHHhOMl+N94B6Nl5zQLFurb2+1At8vNCH6ykMuLg2CNSu
	 ZWRUU0w0Y3d/OEE8lfVRz1D09St6kmiuJS/RE4H2krFC7J/zy3ncTKUzEPWbanZtKI
	 i2z8aT16VaYbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2615743448;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:28 +0800
Subject: [PATCH 08/18] dt-bindings: pinctrl: add Zhihe A210 pin controller
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
Message-Id: <20261022-a210-init-v1-8-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=6873;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=UjyMLJHv24b1f1K2PwMfqU3RXI4khSvr/rvgT5wb0RM=;
 b=qH9Md8y4uPL6GMtnPMahiXVxkkXKZosnteylMj1yxR6VvnUb6Xb4zumNbJsvcC3hQIEPRBsTH
 dho8VK7k+RpCcxJ+AQR7N9lz9cxEDGv2o0WGQodBLwQE/TMMpN0AMrD
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add bindings for the four A210 pad controllers. Describe the shared
PERI3 SDIO mux and per-pad bias controls.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       | 206 +++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
new file mode 100644
index 000000000000..51cbb0189f47
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/zhihe,a210-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZhiHe A210 pin controller
+
+maintainers:
+  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+
+description: |
+  Pinmux and pinconf controller of the ZhiHe A210 RISC-V SoC.
+
+  The pads of the A210 are split into four groups, each managed by its
+  own pad controller with a separate register range:
+
+    AON pad controller     -> zhihe,a210-aon-pinctrl
+    PADCTRL0 (peripheral1) -> zhihe,a210-peri1-pinctrl
+    PADCTRL1 (peripheral2) -> zhihe,a210-peri2-pinctrl
+    PADCTRL2 (peripheral3) -> zhihe,a210-peri3-pinctrl
+
+  Each pad can be muxed individually to up to 8 different functions,
+  though for most pads only a few of those configurations are valid.
+  A few pads in the AON group do not support muxing or configuration
+  at all.
+
+  AON, PERI1 and PERI2 pads support configurable drive strength, bias,
+  input enable, Schmitt trigger and slew rate. PERI3 has a separate pad
+  layout: its six SDIO pads share one mux bit. Select their function with
+  the "sdio" group. Per-pad bias can be configured independently.
+
+properties:
+  compatible:
+    enum:
+      - zhihe,a210-aon-pinctrl
+      - zhihe,a210-peri1-pinctrl
+      - zhihe,a210-peri2-pinctrl
+      - zhihe,a210-peri3-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+
+    description:
+      A pinmux group referenced by a consumer's pinctrl phandle. It
+      contains one subnode per set of pads sharing the same pinmux and
+      pinconf settings.
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
+        description:
+          A pinctrl node describing the pinmux and pinconf settings of
+          one or more pads.
+
+        properties:
+          pins:
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins
+            description: List of pads that properties in the node apply to.
+
+          groups:
+            items:
+              - const: sdio
+
+          function:
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
+            enum: [ aouart, aouart_ir, aogpio0, aogpio1, aoi2c0, aoi2c1,
+                    aospi, jtag, reset, por, pmic, dvs, uart0, uart1,
+                    uart2, uart3, uart4, uart5, uart6, uart7, uart8,
+                    uart9, uart0_ir, uart1_ir, uart2_ir, uart3_ir,
+                    uart4_ir, uart5_ir, uart6_ir, uart7_ir, uart8_ir,
+                    uart9_ir, gpio0, gpio1, gpio2, gpio3, gpio4, gmac0,
+                    gmac1, spi0, spi1, qspi0, qspi1, pwm0, pwm1, pwm2,
+                    can0, can1, can2, i2s0, i2s1, i2s2, i2s3, i2c0, i2c1,
+                    i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c7_smb, sdio,
+                    isp0, dptx, usb31, sata_p0, sata_p1, hdmi, zmac,
+                    bsel, dbgm, cdbg, pdm, tdm, pcie_x1, pcie_x4,
+                    sen_vclk ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23,
+                    25 ]
+            description: Drive strength in mA.
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            maximum: 1
+
+        oneOf:
+          - required: [pins]
+          - required: [groups]
+
+        additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: zhihe,a210-peri3-pinctrl
+    then:
+      patternProperties:
+        '-[0-9]+$':
+          patternProperties:
+            '-pins$':
+              properties:
+                pins:
+                  items:
+                    enum: [SDIO_CLK, SDIO_CMD, SDIO_DAT0, SDIO_DAT1,
+                           SDIO_DAT2, SDIO_DAT3]
+                function:
+                  enum: [sdio, gpio4]
+                drive-strength: false
+                input-enable: false
+                input-disable: false
+                input-schmitt-enable: false
+                input-schmitt-disable: false
+                slew-rate: false
+              if:
+                required: [function]
+              then:
+                required: [groups]
+    else:
+      patternProperties:
+        '-[0-9]+$':
+          patternProperties:
+            '-pins$':
+              properties:
+                groups: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@2026000 {
+        compatible = "zhihe,a210-peri1-pinctrl";
+        reg = <0x2026000 0x1000>;
+        clocks = <&clk 0>;
+        clock-names = "pclk";
+
+        gmac0-0 {
+            gmac0-pins {
+                bias-disable;
+                drive-strength = <13>;
+                function = "gmac0";
+                input-disable;
+                input-schmitt-disable;
+                pins = "GPIO0_0", "GPIO0_12";
+                slew-rate = <0>;
+            };
+        };
+    };
+
+  - |
+    pinctrl@542000 {
+        compatible = "zhihe,a210-peri3-pinctrl";
+        reg = <0x542000 0x1000>;
+        clocks = <&clk 0>;
+        clock-names = "pclk";
+
+        sdio-0 {
+            cmd-data-pins {
+                bias-pull-up;
+                pins = "SDIO_CMD", "SDIO_DAT0", "SDIO_DAT1",
+                       "SDIO_DAT2", "SDIO_DAT3";
+            };
+
+            sdio-pins {
+                function = "sdio";
+                groups = "sdio";
+            };
+        };
+    };

-- 
2.55.0


