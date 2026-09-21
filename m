Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8242935AC1B;
	Mon, 21 Sep 2026 06:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973411; cv=none; b=JiQ2SCaHDrFQnp2sGvzFqJRet71MhON1UdHzH7OjZGjG6lm6qnu9rHPyYcwRC6CMV1hAjC1MaSIGMxxAk9xUVny1vBfwnwgBMiTRzs4sQfOaxhLxYDSQ1russ3InzcfMjaveC1eZbmMPrcG+g36PCjUzBfxhI2Q9nWTeigrEyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973411; c=relaxed/simple;
	bh=1dbccMFgoxGDDUW5fhi3TDjQLC/5SBBhtXsHnbI2baM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOGd47Q3xG+xtDJCUP9RDd7c/BgzR/mLjhzz1nfwHBvYryw5vnKgzSU2iq3vsec4A+/lYo4yNAXI1WGS9pddyheAGjbyKfawC2fsACZ04xYklWywcyYQwOoFUgw2rfb0HUf5fhGGPlmYc65Yole99cpG1qbPbGsRk2c1e8av96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4225D2006D0;
	Mon, 21 Sep 2026 08:50:00 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 21 Sep 2026 08:49:59 +0200
Subject: [PATCH v9 1/2] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-clk-cdce6214-v9-1-f2ea74fd38a2@pengutronix.de>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
In-Reply-To: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789973400; l=6948;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=1dbccMFgoxGDDUW5fhi3TDjQLC/5SBBhtXsHnbI2baM=;
 b=6aqryKyU2nHk7xaTJglNuI9Kakuzu4ttoEmMsZj+/rtGfjGqI0LHsbh4bBZOuQa6g36QHUSQp
 Jm8RRJXApRqCLI85HZ+e0gKCUYmfE8o2wk4Kt3YRBIPrUCrQQV6Y5G9
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
Generator With One PLL, Four Differential Outputs, Two Inputs, and
Internal EEPROM.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 198 +++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |  25 +++
 2 files changed, 223 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000..cf8eed38abec1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CDCE6214 programmable clock generator with PLL
+
+maintainers:
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description: >
+  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
+  Two Inputs, and Internal EEPROM
+
+  - CDCE6214: https://www.ti.com/product/CDCE6214
+
+properties:
+  compatible:
+    enum:
+      - ti,cdce6214
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [ priref, secref ]
+      - items:
+          - const: priref
+          - const: secref
+
+  '#clock-cells':
+    const: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^conf':
+        type: object
+        additionalProperties: false
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
+        properties:
+          pins:
+            items:
+              enum: [priref, secref, out0, out1, out2, out3, out4 ]
+
+          ti,io-standard:
+            description: |
+              1: CMOS
+              2: LVDS
+              3: Low-Power HCSL
+              4: XTAL mode
+              5: differential
+            enum: [1, 2, 3, 4, 5]
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          ti,xo-cload-femtofarads:
+            description: Load capacity for XO in Femtofarad
+
+          ti,xo-bias-microamp:
+            description: Bias current setting of the XO
+
+          ti,cmosp-mode:
+            description: |
+              Driving mode for CMOSP output:
+              1: Low Polarity
+              2: High Polarity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 1
+            maximum: 3
+
+          ti,cmosn-mode:
+            description: |
+              Driving mode for CMOSN output:
+              1: Low Polarity
+              2: High Polarity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 1
+            maximum: 3
+
+        allOf:
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: priref
+            then:
+              properties:
+                ti,io-standard:
+                  enum: [ 1, 5 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: secref
+            then:
+              properties:
+                ti,io-standard:
+                  enum: [ 1, 4, 5 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: out0
+            then:
+              properties:
+                ti,io-standard:
+                  enum: [ 1 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum:
+                      - out1
+                      - out4
+            then:
+              properties:
+                ti,io-standard:
+                  enum: [ 1, 2, 3 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum:
+                      - out2
+                      - out3
+            then:
+              properties:
+                ti,io-standard:
+                  enum: [ 2, 3 ]
+
+        required:
+          - pins
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ti,cdce6214.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@67 {
+            compatible = "ti,cdce6214";
+            reg = <0x67>;
+            #clock-cells = <1>;
+            clocks = <&clock_ref25m>;
+            clock-names = "priref";
+            pinctrl-0 = <&cdce6214_pins>;
+            pinctrl-names = "default";
+
+            cdce6214_pins: cdce6214-pins {
+                conf1 {
+                    pins = "secref";
+                    ti,io-standard = <CDCE6214_IOSTD_XTAL>;
+                    ti,xo-bias-microamp = <100>;
+                    ti,xo-cload-femtofarads = <8100>;
+                };
+
+                conf2 {
+                    pins = "out1";
+                    ti,cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                    ti,cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    ti,io-standard = <CDCE6214_IOSTD_CMOS>;
+                };
+
+                conf3 {
+                    pins = "out4";
+                    ti,cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                    ti,cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    ti,io-standard = <CDCE6214_IOSTD_CMOS>;
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
new file mode 100644
index 0000000000000..41ec4f8868bbb
--- /dev/null
+++ b/include/dt-bindings/clock/ti,cdce6214.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+#ifndef _DT_BINDINGS_CLK_TI_CDCE6214_H
+#define _DT_BINDINGS_CLK_TI_CDCE6214_H
+
+/* Clock indices for the clocks provided by the CDCE6214 */
+#define CDCE6214_CLK_OUT0	2
+#define CDCE6214_CLK_OUT1	3
+#define CDCE6214_CLK_OUT2	4
+#define CDCE6214_CLK_OUT3	5
+#define CDCE6214_CLK_OUT4	6
+#define CDCE6214_CLK_PLL	7
+#define CDCE6214_CLK_PSA	8
+#define CDCE6214_CLK_PSB	9
+
+#define CDCE6214_IOSTD_CMOS	1
+#define CDCE6214_IOSTD_LVDS	2
+#define CDCE6214_IOSTD_LP_HCSL	3
+#define CDCE6214_IOSTD_XTAL	4
+#define CDCE6214_IOSTD_DIFF	5
+
+#define CDCE6214_CMOS_MODE_LOW		1
+#define CDCE6214_CMOS_MODE_HIGH		2
+#define CDCE6214_CMOS_MODE_DISABLED	3
+
+#endif /* _DT_BINDINGS_CLK_TI_CDCE6214_H */

-- 
2.47.3

