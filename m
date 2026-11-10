Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304719;
	b=eTMEuf3kTmW77qya3/0ekL1rEMbW6b08Iif6LxBbVGpld8UBSTsxY77NjF44vAmmRFYI
	 IcZs+JYDkuBgl71xjwJkrQclFTwmnOsiOf0nwUc0TdfZ3U/lZkpYpd0Sw8NaOXBl7B/0+
	 5B2A961jixCa8ekmCcqIVwJsGPXo99ckqp8I+JJ5sW1g5AwkVYfPFX0T5XVLptXfUc8fI
	 Qma5uFruA3eubT9Xy0ICFURmAStGATvI32AjIvSinfPXvye5+iWJUoQcYTz024mWgifh4
	 xj1hx1Odz4fZE2uEI4jI8u7aX5TteJlcEcJQcR80K4EJ0g++EhVKEqs5uA/Im8nCvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304719;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=HY2fITZkPFJUhd8oER4PoZZXL/8bzK742/wg8uDmmns=;
	b=QDHkQgaekEpXco+IuDmI34tq/BlQybv1t4AZD8OzdVdtOK6nhmKHFamIk0mh108uwwtr
	 s8ceVSyF+Sy4rxy1gIhCDFWla6iueGeUqbyBEhuvk4qpbuk9eCsXmvNREJvX03gPXHTjN
	 X3QPnfMJKoEkjtI+8gLU2HOOnE7rDNPkcb90CuEdSqdt7mMleF6sM9mtM8RMNoMqorAug
	 +yzyrWxOIVbfBWZNuuWr4EDIeuDppMmEQ5iZszcxEUr8CUVB32ka5tr8d8wGePWUwG8iP
	 nS6ap7YE53Uj3gsu7ITfMmK1e3FdGJC8+MkSDm5WcWFpiuQZIP85FktWhlGEUk56OZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBmOZ9e5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A295606A331;
	Tue, 10 Nov 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBmOZ9e5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2D81F008A3;
	Tue, 10 Nov 2026 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304719;
	bh=HY2fITZkPFJUhd8oER4PoZZXL/8bzK742/wg8uDmmns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lBmOZ9e5f8Iaa+BK3VoZS3BQfNfRXXnKFaAZ9u+SI0IqfCPLBo3zM2ULYWkAL5hze
	 H2RhoBxXKOh5ohojzl4HR8Gf6vCAD9zAcrnykKvJNNUezwY+0mvbjpVuqCB5sWtCFG
	 aE2mIHCU4MyeqCXqyQmu87wkK1t+AUkn0lNI4YpMVlSHr/F/ArW8Zvf27euTWs3xAX
	 XfzS3Vwk30CVUL/JYPrPRFhVbYBspyz1e1406KWSZX+QQ0sQLHzr6LRr2x/wcEeFDA
	 K/ejefeRFfif0toJGY17QhlWl+wAAhr3FgsFWkaXTEMUTfapWi41gF6x29wLwiskVN
	 yIowz2pqwcgjQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Nov 2026 10:58:33 +0100
Subject: [PATCH 1/2] dt-bindings: pinctrl: abx500: Convert to DT schema
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
Message-Id: <20261110-ux500-pinctrl-bindings-v1-1-a9f0e9d12d19@kernel.org>
References: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
In-Reply-To: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0

Describe the ABx500 GPIO and pin controller in DT schema, including
the nested mux and configuration groups used by existing boards.
Reference this schema from the AB8500 MFD instead of rejecting all
pin configuration children. Found with CHECK_DTBS=1.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml |  16 +-
 .../devicetree/bindings/pinctrl/ste,abx500.txt     | 318 ---------------------
 .../bindings/pinctrl/stericsson,abx500.yaml        |  68 +++++
 3 files changed, 69 insertions(+), 333 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index d819954ee731..055e983310d8 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -61,21 +61,7 @@ properties:
         const: 1
 
   gpio:
-    description: Node describing the AB8500 GPIO controller. A few
-      GPIO pins available for misc usage.
-    type: object
-    additionalProperties: false
-
-    properties:
-      compatible:
-        enum:
-          - stericsson,ab8500-gpio
-          - stericsson,ab8505-gpio
-
-      gpio-controller: true
-
-      '#gpio-cells':
-        const: 2
+    $ref: /schemas/pinctrl/stericsson,abx500.yaml#
 
   rtc:
     description: Node describing the AB8500 battery-backed RTC.
diff --git a/Documentation/devicetree/bindings/pinctrl/ste,abx500.txt b/Documentation/devicetree/bindings/pinctrl/ste,abx500.txt
deleted file mode 100644
index 87697420439e..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ste,abx500.txt
+++ /dev/null
@@ -1,318 +0,0 @@
-ST Ericsson abx500 pinmux controller
-
-Required properties:
-- compatible: "stericsson,ab8500-gpio",  "stericsson,ab8540-gpio",
-	      "stericsson,ab8505-gpio", "stericsson,ab9540-gpio",
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-ST Ericsson's pin configuration nodes use the generic pin multiplexing
-and pin configuration bindings, see pinctrl-bindings.txt
-
-Example board file extract:
-
-&pinctrl_abx500 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&sysclkreq2_default_mode>, <&sysclkreq3_default_mode>, <&gpio3_default_mode>, <&sysclkreq6_default_mode>, <&pwmout1_default_mode>, <&pwmout2_default_mode>, <&pwmout3_default_mode>, <&adi1_default_mode>, <&dmic12_default_mode>, <&dmic34_default_mode>, <&dmic56_default_mode>, <&sysclkreq5_default_mode>, <&batremn_default_mode>, <&service_default_mode>, <&pwrctrl0_default_mode>, <&pwrctrl1_default_mode>, <&pwmextvibra1_default_mode>, <&pwmextvibra2_default_mode>, <&gpio51_default_mode>, <&gpio52_default_mode>, <&gpio53_default_mode>, <&gpio54_default_mode>, <&pdmclkdat_default_mode>;
-
-	sysclkreq2 {
-		sysclkreq2_default_mode: sysclkreq2_default {
-			default_mux {
-				function = "sysclkreq";
-				groups = "sysclkreq2_d_1";
-			};
-			default_cfg {
-				pins = "GPIO1";
-				bias-disable;
-			};
-		};
-	};
-	sysclkreq3 {
-		sysclkreq3_default_mode: sysclkreq3_default {
-			default_mux {
-				function = "sysclkreq";
-				groups = "sysclkreq3_d_1";
-			};
-			default_cfg {
-				pins = "GPIO2";
-				output-low;
-			};
-		};
-	};
-	gpio3 {
-		gpio3_default_mode: gpio3_default {
-			default_mux {
-				function = "gpio";
-				groups = "gpio3_a_1";
-			};
-			default_cfg {
-				pins = "GPIO3";
-				output-low;
-			};
-		};
-	};
-	sysclkreq6 {
-		sysclkreq6_default_mode: sysclkreq6_default {
-			default_mux {
-				function = "sysclkreq";
-				groups = "sysclkreq6_d_1";
-			};
-			default_cfg {
-				pins = "GPIO4";
-				bias-disable;
-			};
-		};
-	};
-	pwmout1 {
-		pwmout1_default_mode: pwmout1_default {
-			default_mux {
-				function = "pwmout";
-				groups = "pwmout1_d_1";
-			};
-			default_cfg {
-				pins = "GPIO14";
-				output-low;
-			};
-		};
-	};
-	pwmout2 {
-		pwmout2_default_mode: pwmout2_default {
-			pwmout2_default_mux {
-				function = "pwmout";
-				groups = "pwmout2_d_1";
-			};
-			pwmout2_default_cfg {
-				pins = "GPIO15";
-				output-low;
-			};
-		};
-	};
-	pwmout3 {
-		pwmout3_default_mode: pwmout3_default {
-			pwmout3_default_mux {
-				function = "pwmout";
-				groups = "pwmout3_d_1";
-			};
-			pwmout3_default_cfg {
-				pins = "GPIO16";
-				output-low;
-			};
-		};
-	};
-	adi1 {
-
-		adi1_default_mode: adi1_default {
-			adi1_default_mux {
-				function = "adi1";
-				groups = "adi1_d_1";
-			};
-			adi1_default_cfg1 {
-				pins = "GPIO17","GPIO19","GPIO20";
-				bias-disable;
-			};
-			adi1_default_cfg2 {
-				pins = "GPIO18";
-				output-low;
-			};
-		};
-	};
-	dmic12 {
-		dmic12_default_mode: dmic12_default {
-			dmic12_default_mux {
-				function = "dmic";
-				groups = "dmic12_d_1";
-			};
-			dmic12_default_cfg1 {
-				pins = "GPIO27";
-				output-low;
-			};
-			dmic12_default_cfg2 {
-				pins = "GPIO28";
-				bias-disable;
-			};
-		};
-	};
-	dmic34 {
-		dmic34_default_mode: dmic34_default {
-			dmic34_default_mux {
-				function = "dmic";
-				groups = "dmic34_d_1";
-			};
-			dmic34_default_cfg1 {
-				pins = "GPIO29";
-				output-low;
-			};
-			dmic34_default_cfg2 {
-				pins = "GPIO30";
-				bias-disable;{
-
-			};
-		};
-	};
-	dmic56 {
-		dmic56_default_mode: dmic56_default {
-			dmic56_default_mux {
-				function = "dmic";
-				groups = "dmic56_d_1";
-			};
-			dmic56_default_cfg1 {
-				pins = "GPIO31";
-				output-low;
-			};
-			dmic56_default_cfg2 {
-				pins = "GPIO32";
-				bias-disable;
-			};
-		};
-	};
-	sysclkreq5 {
-		sysclkreq5_default_mode: sysclkreq5_default {
-			sysclkreq5_default_mux {
-				function = "sysclkreq";
-				groups = "sysclkreq5_d_1";
-			};
-			sysclkreq5_default_cfg {
-				pins = "GPIO42";
-				output-low;
-			};
-		};
-	};
-	batremn {
-		batremn_default_mode: batremn_default {
-			batremn_default_mux {
-				function = "batremn";
-				groups = "batremn_d_1";
-			};
-			batremn_default_cfg {
-				pins = "GPIO43";
-				bias-disable;
-			};
-		};
-	};
-	service {
-		service_default_mode: service_default {
-			service_default_mux {
-				function = "service";
-				groups = "service_d_1";
-			};
-			service_default_cfg {
-				pins = "GPIO44";
-				bias-disable;
-			};
-		};
-	};
-	pwrctrl0 {
-		pwrctrl0_default_mux: pwrctrl0_mux {
-			pwrctrl0_default_mux {
-				function = "pwrctrl";
-				groups = "pwrctrl0_d_1";
-			};
-		};
-		pwrctrl0_default_mode: pwrctrl0_default {
-			pwrctrl0_default_cfg {
-				pins = "GPIO45";
-				bias-disable;
-			};
-		};
-	};
-	pwrctrl1 {
-		pwrctrl1_default_mux: pwrctrl1_mux {
-			pwrctrl1_default_mux {
-				function = "pwrctrl";
-				groups = "pwrctrl1_d_1";
-			};
-		};
-		pwrctrl1_default_mode: pwrctrl1_default {
-			pwrctrl1_default_cfg {
-				pins = "GPIO46";
-				bias-disable;
-			};
-		};
-	};
-	pwmextvibra1 {
-		pwmextvibra1_default_mode: pwmextvibra1_default {
-			pwmextvibra1_default_mux {
-				function = "pwmextvibra";
-				groups = "pwmextvibra1_d_1";
-			};
-			pwmextvibra1_default_cfg {
-				pins = "GPIO47";
-				bias-disable;
-			};
-		};
-	};
-	pwmextvibra2 {
-		pwmextvibra2_default_mode: pwmextvibra2_default {
-			pwmextvibra2_default_mux {
-				function = "pwmextvibra";
-				groups = "pwmextvibra2_d_1";
-			};
-			pwmextvibra1_default_cfg {
-				pins = "GPIO48";
-				bias-disable;
-			};
-		};
-	};
-	gpio51 {
-		gpio51_default_mode: gpio51_default {
-				gpio51_default_mux {
-				function = "gpio";
-				groups = "gpio51_a_1";
-			};
-			gpio51_default_cfg {
-				pins = "GPIO51";
-				output-low;
-			};
-		};
-	};
-	gpio52 {
-		gpio52_default_mode: gpio52_default {
-			gpio52_default_mux {
-				function = "gpio";
-				groups = "gpio52_a_1";
-			};
-			gpio52_default_cfg {
-				pins = "GPIO52";
-				bias-pull-down;
-			};
-		};
-	};
-	gpio53 {
-		gpio53_default_mode: gpio53_default {
-			gpio53_default_mux {
-				function = "gpio";
-				groups = "gpio53_a_1";
-			};
-			gpio53_default_cfg {
-				pins = "GPIO53";
-				bias-pull-down;
-			};
-		};
-	};
-	gpio54 {
-		gpio54_default_mode: gpio54_default {
-			gpio54_default_mux {
-				function = "gpio";
-				groups = "gpio54_a_1";
-			};
-			gpio54_default_cfg {
-				pins = "GPIO54";
-				output-low;
-			};
-		};
-	};
-	pdmclkdat {
-		pdmclkdat_default_mode: pdmclkdat_default {
-			pdmclkdat_default_mux {
-				function = "pdm";
-				groups = "pdmclkdat_d_1";
-			};
-			pdmclkdat_default_cfg {
-				pins = "GPIO55", "GPIO56";
-				bias-disable;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/stericsson,abx500.yaml b/Documentation/devicetree/bindings/pinctrl/stericsson,abx500.yaml
new file mode 100644
index 000000000000..59ca14992427
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/stericsson,abx500.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/stericsson,abx500.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson AB8500 and AB8505 GPIO and pin controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - stericsson,ab8500-gpio
+      - stericsson,ab8505-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 53
+
+patternProperties:
+  '^(?!phandle$|compatible$|gpio-controller$|gpio-line-names$|pinctrl-[0-9]+$|pinctrl-names$)[a-zA-Z0-9_-]+$':
+    $ref: '#/$defs/config-node'
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+$defs:
+  config-node:
+    type: object
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+    patternProperties:
+      '^(?!phandle$|pins$|groups$|function$|bias-.*$|drive-.*$|input-.*$|output-.*$|power-source$|slew-rate$|low-power-.*$|persist-state$|skew-delay$)[a-zA-Z0-9_-]+$':
+        $ref: '#/$defs/config-node'
+    unevaluatedProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "stericsson,ab8500-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        sysclkreq2 {
+            sysclkreq2-default {
+                mux {
+                    function = "sysclkreq";
+                    groups = "sysclkreq2_d_1";
+                };
+                config {
+                    pins = "GPIO1";
+                    bias-disable;
+                };
+            };
+        };
+    };

-- 
2.56.0

