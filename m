Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851348;
	b=NkY3joHcZhpghW9f2gHiVk93g4aLYshxVndYMuzaG0XKc96H6M5cdNb5cXtgNMrYyiyS
	 adQxOVIVOLCuCe6TL9T6C9w3j53jdJr80+R6dB6D0uWfQxlEn7i6BLnwZJe2Mt79zUr1o
	 dXEKGPYfSI7KdAHms0hpT5Bx/okGRSrguWHytQqoKQ4Wsk0NYxMyk2I1dI9I7r0yUcZjl
	 vbtoncrYukuOrVBOHMm2lw95oWNHCRC8GHjAlMz08S5RqWIah2gUKGkSg8ORrzN4aLZuy
	 TwqAJXdK4+WIS5k7tyCzXhDhByNPVAyLTv3suUhjyN5bY1MxXGIa6jaecUt6DElz7pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851348;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PL2y37zds9Kzlv9bYRLZKZ+6rnuY6+0UYPZeYlgUGC4=;
	b=utXlVhHVaKgPo8kResxM5a5LcZSafNJKMnU4eesa2CfSJ8i3cIpbukRgzxibnnzM8PO+
	 rOu6NFkdhPPiIKDOwn3I6zgVc4vTYspkTQAgPxtd84AynKQmiRyU5AclfT7Liex4dsGwH
	 73vfbzQ72Z9Dh8pGQiL33LbXZLmfGjMuAoccbTYu7+3tfWqxIDbvrGWuV6Kd6AM6NBsGp
	 NIP4scnsqQj0f2Z3Vi9NthBPGp/SBaT61GM3ImVtw4IzGyrxmVY/9BMLYvkyXubEdeCZC
	 uxeTZDsrPAA1uInrywYwgCohhYJhk8Lj3PY3QyODprgKTTrexC1vhooBB2T4mR0a0kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E88606A8BF;
	Mon, 16 Nov 2026 17:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E88606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0pD-004GcH-1v;
	Mon, 16 Nov 2026 18:49:03 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v3 6/9] dt-bindings: pinctrl: airoha: add AN7589
Date: Mon, 16 Nov 2026 18:48:51 +0100
Message-Id: <20261116174854.342912-7-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174854.342912-1-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the AN7589 pin controller. It lives under the GPIO system
controller and selects functions through a separate IOMUX syscon,
referenced by the airoha,iomux phandle. Every pin is a GPIO in mode 0.

The AN7589 has no chip SCU dependency and the vendor SDK carries no pull
or drive registers for it. Groups follow the SDK naming without its _grp
suffix. As in the other Airoha pin controller bindings, a function names
a block type, such as uart or i2c, and the group selects the instance. A
node selects one group, except for pcm_spi and pcie, whose groups carry
different signals of one device. The PON groups keep the working mode
only: the SDK encodes the driver reset sequence as extra pinctrl states,
which belongs in the consumer driver.

The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
one group per pin. The pin also needs its GPIO output enabled, so conf
nodes allow the GPIO direction and output level. Pull and drive
properties are not allowed, as no registers for them are known.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v3:
- Move the IOMUX syscon compatible and the GPIO system controller to
  patches of their own (Lee, Conor).
- Allow one group per node, except for pcm_spi and pcie, whose groups
  carry different signals of one device (Conor).
- Fix the uart5 example, which listed uart5 and uart5_full together.

Changes in v2:
- One function per block type, with the group selecting the
  instance, as in the other Airoha pin controller bindings (Conor).
- List the valid groups for the groups property (Conor).

 .../pinctrl/airoha,an7589-pinctrl.yaml        | 355 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
new file mode 100644
index 000000000000..8af9f8e83cf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
@@ -0,0 +1,355 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7589-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7589 Pin Controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description:
+  The Airoha AN7589 pin controller is used to control SoC pins. Pin
+  functions are selected through a separate IOMUX register block, one
+  mode field per pin. Every pin is a GPIO in mode 0.
+
+properties:
+  compatible:
+    const: airoha,an7589-pinctrl
+
+  airoha,iomux:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the IOMUX syscon holding the per pin mode fields.
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - airoha,iomux
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [uart, i2c, spi, pcm, pcm_spi, i2s, mdio, mdcs, mdios, emmc,
+                   pcie, pon, sgpio, watchdog, shiftmux_spi, tod, sync_e, jtag,
+                   pwm]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            items:
+              enum: [uart1, uart2, uart3, uart3_alt, uart4, uart5, uart5_alt,
+                     uart5_full, uart6, uart6_full, i2c0, i2c1, i2c2, i2c3,
+                     i2c4, spi0, ext_spi0_full, ext_spi1, ext_spi1_full,
+                     ext_spi2, ext_spi2_full, ext_spi3, ext_spi3_full, pcm1,
+                     pcm2, pcm_spi, pcm_spi_cs, pcm_ctrl, i2s, mdio0, mdio1,
+                     mdio2, mdcs, mdios, emmc, pcie0_rst, pcie0_clkreq,
+                     pcie0_wake, pcie1_rst, pcie1_clkreq, pcie1_wake, pcie2_rst,
+                     pcie2_clkreq, pcie2_wake, pon1, pon2, sgpio0, sgpio1,
+                     watchdog, shiftmux_spi, tod, sync_e, cpu_jtag,
+                     cpu_jtag_alt, npu_jtag, ibex_jtag, pma50eth_jtag,
+                     ainpu_jtag, pma50pon_jtag, gpio0, gpio1, gpio2, gpio3,
+                     gpio4, gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
+                     gpio12, gpio13, gpio14, gpio15]
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart1, uart2, uart3, uart3_alt, uart4, uart5,
+                           uart5_alt, uart5_full, uart6, uart6_full]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [i2c0, i2c1, i2c2, i2c3, i2c4]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi0, ext_spi0_full, ext_spi1, ext_spi1_full,
+                           ext_spi2, ext_spi2_full, ext_spi3, ext_spi3_full]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm1, pcm2]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_cs, pcm_ctrl]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [mdio0, mdio1, mdio2]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: mdcs
+            then:
+              properties:
+                groups:
+                  enum: [mdcs]
+          - if:
+              properties:
+                function:
+                  const: mdios
+            then:
+              properties:
+                groups:
+                  enum: [mdios]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc]
+          - if:
+              properties:
+                function:
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcie0_rst, pcie0_clkreq, pcie0_wake, pcie1_rst,
+                           pcie1_clkreq, pcie1_wake, pcie2_rst, pcie2_clkreq,
+                           pcie2_wake]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pon1, pon2]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: sgpio
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [sgpio0, sgpio1]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: watchdog
+            then:
+              properties:
+                groups:
+                  enum: [watchdog]
+          - if:
+              properties:
+                function:
+                  const: shiftmux_spi
+            then:
+              properties:
+                groups:
+                  enum: [shiftmux_spi]
+          - if:
+              properties:
+                function:
+                  const: tod
+            then:
+              properties:
+                groups:
+                  enum: [tod]
+          - if:
+              properties:
+                function:
+                  const: sync_e
+            then:
+              properties:
+                groups:
+                  enum: [sync_e]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [cpu_jtag, cpu_jtag_alt, npu_jtag, ibex_jtag,
+                           pma50eth_jtag, ainpu_jtag, pma50pon_jtag]
+                  maxItems: 1
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15]
+                  maxItems: 1
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              pattern: '^gpio([0-9]|[1-6][0-9]|7[0-3])$'
+            minItems: 1
+            maxItems: 74
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,an7589-pinctrl";
+      airoha,iomux = <&iomux>;
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      gpio-ranges = <&pinctrl 0 0 74>;
+
+      mmc-pins {
+        mux {
+          function = "emmc";
+          groups = "emmc";
+        };
+      };
+
+      pcie0-pins {
+        mux {
+          function = "pcie";
+          groups = "pcie0_rst", "pcie0_clkreq", "pcie0_wake";
+        };
+      };
+
+      uart5-pins {
+        mux {
+          function = "uart";
+          groups = "uart5_full";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37dd..9d67ef6b4531 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22137,6 +22137,7 @@ PIN CONTROLLER - AIROHA
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 
-- 
2.34.1

