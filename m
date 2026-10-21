Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612126;
	b=HEqSgnl24n+6zWYy8VEFy1sKjGwN9UBg9NsvvH7xz0UxovMgFCejsuk3meTOdMKlTP7F
	 H7JC7+y8o+OtlsrqPrWJzvetomQamZpRvXt7Q9D/0Wk3NrJL+q+ghl57Z4SjeqLY+2ACy
	 wgBKr7ntyJoGPP9IFS4soTzw5z9cTt65z6UtFZLjjDxxQRcx2JcHTlM45uFMM1g6Xu/l5
	 U/7J1R8ty7D9hLmN4Wqa9cWd12nYNupJflux4uSFI4W+3ENYrrt+lLWj2D6lrEgOuBeSr
	 0LwNLodbftDGog/DZbFx6f90CQUxHv2i16BnfZ0BGD5sIycDrEa+sItVGjq0OstLCoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612126;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=55Zai5vUFJF6y42H3h7fFkdKOBlnA3DVBhVDRli/qYQ=;
	b=dbEwCK2yThShWTs/cnGJHyoHtuxCNOkOPE1+cbXkpbZ1UxnV0e3z02yylzUfG2FAB+Cl
	 JpkAmvATAKirZFptcI/bfU5DFxJnfXXTqpEflb2gvdR6WvYV5GFLL3KJCnq2EXMLDrHN0
	 NghoNqGVQ+l8sMWC2bitJeJ2wk9p6f6gycZcXwnE7HgBjAnqxY0Oy7UWHBnUICAHLnR8l
	 V1QvDgCmPldIUXy44wmjqTi4n/p5v69o5mhIEOlXj2JaOF/i5pkdiwlJ67K62HB++hSnN
	 nAjo+EDj/wHNVMw/cJczPkYosHysLSj1Nt4lMlagSqQ7mhZvnWtNeu4Nhn55F+pteyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91F606A324;
	Wed, 21 Oct 2026 19:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A91F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.48])
	by APP-03 (Coremail) with SMTP id rQCowAB3gT_6Ftlqxu5hCw--.4480S10;
	Thu, 22 Oct 2026 03:48:20 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Oct 2026 03:48:16 +0800
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
Message-Id: <20261022-a210-init-v1-8-09fb4d99da65@iscas.ac.cn>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
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
X-CM-TRANSID:rQCowAB3gT_6Ftlqxu5hCw--.4480S10
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw45tFW8uryDAry8JryxXwb_yoW7CryfpF
	43G39xtr4vqr40g3yxAa18ZF1fGa97Arsakw1DKryjqa9xt3Wvvr1akr1Yq34DWr1kXa43
	Za98XFZrtF18CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
	JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
	A2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjTR_nYFDUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwYHDGrYyeCSrAAAsv

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

