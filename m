Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332395;
	b=QTWUWsk856Tq34FPpPymVXUa+hd1ZkfxGX1eISDPUO3KVP12FhrBXRkPTtJvon67QUsr
	 aHQ30Y0BTatpmAUCKlY9C38hHNnlrscpYWukc31yQvknjyROEYY9wGsYdVEVf0fsl8lc1
	 II/jKCKW+7N+qhDr3kkd8FOGWzP00wF2J9F+72NlPFnbJ31zMk3cOzXxTTWGV0A+IvCpK
	 NpnHlyCs9pFRgkv8BYt20zWi0VyelrVXeUuVuDXKFNjAIXLzLWNODTTVH8fBvIFDLYb8m
	 vMTkLcQfjM6DhMe7IiK963xjKHiKLgxGDHwJXy5hDukyMNgL3XjlBxWSI6IPTiB9tbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332395;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pcTN9uuXS6r6wkfFTTI5pruffq/rNRk39f+3fgvKchI=;
	b=Nh3x+p5AZ3A3OkE7oDdUYCVvPNvGriKeAlvvK20+fG0mvzvAvERAGn9WcqLpNuEY0Xkw
	 CvFik8AA6a60bW0AZXKfE2/jQbScNl4/CtEcxE3A08ggV3Nrz50dLZtDv3XsmWY8fY6dM
	 PmQ6WB85I3+DzjTJ30pJnNM2IBVmYUxTEZxOAcLcWe6WhnuH9hrhEspgAStbHmHyzWccQ
	 JryKAl/rT3tb8szdPZPJEds/URcxm7MC0SjmiUYKUEBTNTL+6ZJv8Udxoe7i7TyLp2ngX
	 iny88nsKIiPAuggRE64MtSQcJ5HT6lIX8uKf9gvaY2Vt+tvOpb+6YgXtALWfDje4HRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39F606A325;
	Tue, 10 Nov 2026 17:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D39F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpoz-001CWh-38;
	Tue, 10 Nov 2026 18:39:50 +0100
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
Subject: [PATCH 5/7] dt-bindings: pinctrl: airoha: add AN7589
Date: Tue, 10 Nov 2026 18:39:39 +0100
Message-Id: <20261110173941.301478-6-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110173941.301478-1-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
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

Document the AN7589 pin controller and the GPIO system controller it
lives under. The pin controller selects functions through a separate
IOMUX syscon, referenced by the airoha,iomux phandle, and every pin is
a GPIO in mode 0.

The AN7589 has no chip SCU dependency and the vendor SDK carries no
pull or drive registers for it. Groups follow the SDK naming without
its _grp suffix. The PON groups keep the working mode only: the SDK
encodes the driver reset sequence as extra pinctrl states, which
belongs in the consumer driver.

The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
one group per pin. The pin also needs its GPIO output enabled, so conf
nodes allow the GPIO direction and output level. Pull and drive
properties are not allowed, as no registers for them are known.

Signed-off-by: John Crispin <john@phrozen.org>
---
 .../mfd/airoha,an7589-gpio-sysctl.yaml        |  66 +++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/airoha,an7589-pinctrl.yaml        | 533 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 4 files changed, 602 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
new file mode 100644
index 000000000000..0785b61bdda3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an7589-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7589 GPIO System Controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description:
+  Airoha AN7589 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,an7589-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,an7589-pinctrl.yaml
+    description:
+      Child node definition for AN7589 Pin controller
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    system-controller@1fbf0200 {
+      compatible = "airoha,an7589-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x1fbf0200 0x100>;
+
+      pinctrl {
+        compatible = "airoha,an7589-pinctrl";
+        airoha,iomux = <&iomux>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..e87158d42e87 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -24,6 +24,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - airoha,an7589-iomux
               - airoha,en7581-pbus-csr
               - al,alpine-sysfabric-service
               - allwinner,sun8i-a83t-system-controller
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
new file mode 100644
index 000000000000..546e333f3467
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
@@ -0,0 +1,533 @@
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
+            enum: [uart1, uart2, uart3, uart4, uart5, uart6, i2c0, i2c1,
+                   i2c2, i2c3, i2c4, spi, ext_spi1, ext_spi2, ext_spi3,
+                   pcm1, pcm2, pcm_spi, i2s, mdio0, mdio1, mdio2, mdcs,
+                   mdios, emmc, pcie0, pcie1, pcie2, pon1, pon2, sgpio0,
+                   sgpio1, watchdog, shiftmux_spi, tod, sync_e, cpu_jtag,
+                   npu_jtag, ibex_jtag, pma50eth_jtag, ainpu_jtag,
+                   pma50pon_jtag, pwm]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: uart1
+            then:
+              properties:
+                groups:
+                  enum: [uart1]
+          - if:
+              properties:
+                function:
+                  const: uart2
+            then:
+              properties:
+                groups:
+                  enum: [uart2]
+          - if:
+              properties:
+                function:
+                  const: uart3
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart3, uart3_alt]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: uart4
+            then:
+              properties:
+                groups:
+                  enum: [uart4]
+          - if:
+              properties:
+                function:
+                  const: uart5
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart5, uart5_alt, uart5_full]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: uart6
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart6, uart6_full]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c0
+            then:
+              properties:
+                groups:
+                  enum: [i2c0]
+          - if:
+              properties:
+                function:
+                  const: i2c1
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: i2c2
+            then:
+              properties:
+                groups:
+                  enum: [i2c2]
+          - if:
+              properties:
+                function:
+                  const: i2c3
+            then:
+              properties:
+                groups:
+                  enum: [i2c3]
+          - if:
+              properties:
+                function:
+                  const: i2c4
+            then:
+              properties:
+                groups:
+                  enum: [i2c4]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi0, ext_spi0_full]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: ext_spi1
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [ext_spi1, ext_spi1_full]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: ext_spi2
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [ext_spi2, ext_spi2_full]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: ext_spi3
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [ext_spi3, ext_spi3_full]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm1
+            then:
+              properties:
+                groups:
+                  enum: [pcm1]
+          - if:
+              properties:
+                function:
+                  const: pcm2
+            then:
+              properties:
+                groups:
+                  enum: [pcm2]
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
+                  const: mdio0
+            then:
+              properties:
+                groups:
+                  enum: [mdio0]
+          - if:
+              properties:
+                function:
+                  const: mdio1
+            then:
+              properties:
+                groups:
+                  enum: [mdio1]
+          - if:
+              properties:
+                function:
+                  const: mdio2
+            then:
+              properties:
+                groups:
+                  enum: [mdio2]
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
+                  const: pcie0
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcie0_rst, pcie0_clkreq, pcie0_wake]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: pcie1
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcie1_rst, pcie1_clkreq, pcie1_wake]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: pcie2
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcie2_rst, pcie2_clkreq, pcie2_wake]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: pon1
+            then:
+              properties:
+                groups:
+                  enum: [pon1]
+          - if:
+              properties:
+                function:
+                  const: pon2
+            then:
+              properties:
+                groups:
+                  enum: [pon2]
+          - if:
+              properties:
+                function:
+                  const: sgpio0
+            then:
+              properties:
+                groups:
+                  enum: [sgpio0]
+          - if:
+              properties:
+                function:
+                  const: sgpio1
+            then:
+              properties:
+                groups:
+                  enum: [sgpio1]
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
+                  const: cpu_jtag
+            then:
+              properties:
+                groups:
+                  enum: [cpu_jtag, cpu_jtag_alt]
+          - if:
+              properties:
+                function:
+                  const: npu_jtag
+            then:
+              properties:
+                groups:
+                  enum: [npu_jtag]
+          - if:
+              properties:
+                function:
+                  const: ibex_jtag
+            then:
+              properties:
+                groups:
+                  enum: [ibex_jtag]
+          - if:
+              properties:
+                function:
+                  const: pma50eth_jtag
+            then:
+              properties:
+                groups:
+                  enum: [pma50eth_jtag]
+          - if:
+              properties:
+                function:
+                  const: ainpu_jtag
+            then:
+              properties:
+                groups:
+                  enum: [ainpu_jtag]
+          - if:
+              properties:
+                function:
+                  const: pma50pon_jtag
+            then:
+              properties:
+                groups:
+                  enum: [pma50pon_jtag]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                           gpio13, gpio14, gpio15]
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
+          function = "pcie0";
+          groups = "pcie0_rst", "pcie0_clkreq", "pcie0_wake";
+        };
+      };
+
+      uart5-pins {
+        mux {
+          function = "uart5";
+          groups = "uart5", "uart5_full";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37dd..2041a8aed28f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22137,6 +22137,8 @@ PIN CONTROLLER - AIROHA
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 
-- 
2.34.1

