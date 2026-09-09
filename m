Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265A470EA3;
	Wed,  9 Sep 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944064; cv=none; b=ifbTTIdl8OIbm+nIrxntsfZIarj6U2kKQ5WqG3lZAaERyrMHGZV0DHvfgyjNcvL/XIjkXGX/G67gACgEE91wwhfQc97ow3aAf4uECSpjQx6HvOqTLZS2TCQq8VCnTyVTiDwaUU3HtbEgR7xpbB5C7glwHx4ntX7pwmwZwABNVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944064; c=relaxed/simple;
	bh=OT3HE675N+VdybCn3UOUW38GVdcZHrAGIqgFEgNE7wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5VjUw6rAC81zB+vzR1bwNoUJq+jQ1sKoupYgTgPyZyFA0w6QOsM27H/4qVuI4xHtyx5edty+CgejxjhYNcjf0XFGNERCeUB+it9S/4nxXdDwXUXl1kwIWZ8o6orgHADqPHOGgbFSfHS12XDWoiachnailclWr0gdOgJ6oJr2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: alvin.sipraga@analog.com
X-PTX-Original-Recipient: linusw@kernel.org
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: sboyd@kernel.org
X-PTX-Original-Recipient: krzk@kernel.org
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: mturquette@baylibre.com
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.hauer@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C28DB202043;
	Wed, 09 Sep 2026 10:54:12 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1x4E4K-0003io-23;
	Wed, 09 Sep 2026 10:54:12 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1x4E4K-00000006WeY-2GL6;
	Wed, 09 Sep 2026 10:54:12 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 09 Sep 2026 10:54:07 +0200
Subject: [PATCH v8 1/2] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-clk-cdce6214-v8-1-4dfa355c1f65@pengutronix.de>
References: <20260909-clk-cdce6214-v8-0-4dfa355c1f65@pengutronix.de>
In-Reply-To: <20260909-clk-cdce6214-v8-0-4dfa355c1f65@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788944052; l=6861;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=OT3HE675N+VdybCn3UOUW38GVdcZHrAGIqgFEgNE7wY=;
 b=HUmJlHyah0E6yRPguByL833PJoT1r04F2pA0f2QCoVaJWlmqljUIwxudcf8d6zcKM1baB5cQm
 bhN+YD9fZOXCIiDSX22caHEREYa06TVzSTXb2oLLKCFgwkIBQ3odbPa
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
Generator With One PLL, Four Differential Outputs, Two Inputs, and
Internal EEPROM.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 192 +++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |  25 +++
 2 files changed, 217 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000..4a9c9155894af
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,192 @@
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
+    minItems: 1
+    items:
+      - enum: [ priref, secref ]
+      - const: secref
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
+              Driving mode for CMOSN output:
+              1: Low Polarity
+              2: High Polrity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 3
+
+          ti,cmosn-mode:
+            description: |
+              Driving mode for CMOSN output:
+              1: Low Polarity
+              2: High Polrity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
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
+                io-standard:
+                  enum: [ 1, 5 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: secref
+            then:
+              properties:
+                io-standard:
+                  enum: [ 1, 4, 5 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: out0
+            then:
+              properties:
+                io-standard:
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
+                io-standard:
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
+                io-standard:
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
+
+            cdce6214_pins: cdce6214-pins {
+                conf1 {
+                    pins = "secref";
+                    ti,io-standard = <CDCE6214_IOSTD_XTAL>;
+                    ti,xo-cload-femtofarads = <8100>;
+                    ti,xo-bias-microamp = <100>;
+                };
+
+                conf2 {
+                    pins = "out1";
+                    ti,io-standard = <CDCE6214_IOSTD_CMOS>;
+                    ti,cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    ti,cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                };
+
+                conf3 {
+                    pins = "out4";
+                    ti,io-standard = <CDCE6214_IOSTD_CMOS>;
+                    ti,cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    ti,cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
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

