Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304721;
	b=nL+6kiFH/DZoFZDp3BSAP7anGOL2UZ0DYr2M7KaN6D3dH75mdKZRty+4J9jyZlHZWeQk
	 GdUkSn1I6MOzL0oi2cnwIi1sxjoqCLrGj+ry2XpMHn3EsU0etS5Ng/fowsTy/FOhdgtYB
	 7Q1Yl5FCEvPRRf8MCY3NzmEqUWqyK1baJspyvQlxsbhse5VB1W3f/CeV3fhjhHKh+LFdJ
	 97u2TGEIQpxfkjCp3R/9Rd5+NlPL4jJZsuDaUFKI88687/ZYcZySSzHeDMSi8ln3RdCeb
	 ghqwrexQf8+5cxGhuLh+1Ux6rGGbrIRtaofz2uOdO+nf/KW3HouODLfISTv7JdlRBog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304721;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=BtCXTNp14PYk+4PGgK4D0wqEtct66E189W2rGQXtMiU=;
	b=XatMjqTHKNUOcdyuig3ssUOce4oKRWk2FWZHHvmXNCxZ16D0xLMa0mu6R/SrJYAwdqd+
	 qHHUiN4Eytx3a50XT6bTRZ4CJE2dxLdrdLkq1D80Gs9PRUWuWUQU2e/P6nunQeM4pnYL0
	 ezsk2/Y2p0WJr++lIQbluFrf/TyBD03lJMFGA1U1DOmcGWpyBIb6WkqkmhaHr+ubcCM04
	 53R2cvZo++0Zks6yC1vvDh5/c7tTq0wohnCd5h+8g4sN9yXP3GhHBtabMOi43VNUKsddr
	 7PV1rQsKNIi7/NZ3ScxVgV4TXCGUyplZTbAvI8NNDrq+7dtJ9335ruEJ+/4L5lDFc3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abFDBMyA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6952B60A2628;
	Tue, 10 Nov 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abFDBMyA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630B91F00904;
	Tue, 10 Nov 2026 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304721;
	bh=BtCXTNp14PYk+4PGgK4D0wqEtct66E189W2rGQXtMiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=abFDBMyA162eessmwSFXRUWaXgx/2Z823540axp6iUW9d3/0Dc0xt69d5GmYKml5s
	 Cv5X+OMDn+12LzDFDVHkhV2zx+m8Gnlpj9iWNZ1T13PGTzBes+Fxp5q7ljDF4qM7TB
	 mBDLSVq/QnSVG/ebdWGeSStGb+qeHlBL1HIrWPSmBAcw5AcQtUqgWY+86vPITniWVy
	 2gDzosr6aG9/Ut1zBZ+O5c4Qd3PVJei1BuzhtDtbExjofQgbLx2cD39JeM4/ZIY/to
	 QJvO5WwfjS5nWAzreR5EqVG6fGWEMs5N9x7Gi5pug4UrTMrM2NWCKx3+Y4wjQ3q+yy
	 bmCQ3Q930Ql5g==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Nov 2026 10:58:34 +0100
Subject: [PATCH 2/2] dt-bindings: pinctrl: nomadik: Convert to DT schema
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
Message-Id: <20261110-ux500-pinctrl-bindings-v1-2-a9f0e9d12d19@kernel.org>
References: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
In-Reply-To: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0

Describe the Nomadik and DB8500 pin controllers, GPIO bank references
and nested pin configurations in DT schema. Preserve the existing
ste,config references and numeric configuration encodings. This adds
validation for the pin groups in the Ux500 board trees.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/pinctrl/ste,nomadik.txt    | 148 ---------------------
 .../bindings/pinctrl/stericsson,nomadik.yaml       | 113 ++++++++++++++++
 2 files changed, 113 insertions(+), 148 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt b/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt
deleted file mode 100644
index 2213802435e0..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ste,nomadik.txt
+++ /dev/null
@@ -1,148 +0,0 @@
-ST Ericsson Nomadik pinmux controller
-
-Required properties:
-- compatible: "stericsson,db8500-pinctrl", "stericsson,db8540-pinctrl",
-              "stericsson,stn8815-pinctrl"
-- nomadik-gpio-chips: array of phandles to the corresponding GPIO chips
-              (these have the register ranges used by the pin controller).
-- prcm: phandle to the PRCMU managing the back end of this pin controller
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-ST Ericsson's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as input, output, pull up, pull down...
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content. The subnodes use the generic
-pin multiplexing node layout from the standard pin control bindings
-(see pinctrl-bindings.txt):
-
-Required pin multiplexing subnode properties:
-- function: A string containing the name of the function to mux to the
-  pin or group.
-- groups : An array of strings. Each string contains the name of a pin
-  group that will be combined with the function to form a multiplexing
-  set-up.
-
-Required pin configuration subnode properties:
-- pins: A string array describing the pins affected by the configuration
-  in the node.
-- ste,config: Handle of pin configuration node
-  (e.g. ste,config = <&slpm_in_wkup_pdis>)
-
-- ste,input : <0/1/2>
-	0: input with no pull
-	1: input with pull up,
-	2: input with pull down,
-
-- ste,output: <0/1/2>
-	0: output low,
-	1: output high,
-	2: output (value is not specified).
-
-- ste,sleep: <0/1>
-	0: sleep mode disable,
-	1: sleep mode enable.
-
-- ste,sleep-input: <0/1/2/3>
-	0: sleep input with no pull,
-	1: sleep input with pull up,
-	2: sleep input with pull down.
-	3: sleep input and keep last input configuration (no pull, pull up or pull down).
-
-- ste,sleep-output: <0/1/2>
-	0: sleep output low,
-	1: sleep output high,
-	2: sleep output (value is not specified).
-
-- ste,sleep-gpio: <0/1>
-	0: disable sleep gpio mode,
-	1: enable sleep gpio mode.
-
-- ste,sleep-wakeup: <0/1>
-	0: wake-up detection enabled,
-	1: wake-up detection disabled.
-
-- ste,sleep-pull-disable: <0/1>
-	0: GPIO pull-up or pull-down resistor is enabled, when pin is an input,
-	1: GPIO pull-up and pull-down resistor are disabled.
-
-Example board file extract:
-
-	pinctrl@80157000 {
-		compatible = "stericsson,db8500-pinctrl";
-		nomadik-gpio-chips = <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>;
-		prcm = <&prcmu>;
-
-		pinctrl-names = "default";
-
-		slpm_in_wkup_pdis: slpm_in_wkup_pdis {
-			ste,sleep = <1>;
-			ste,sleep-input = <3>;
-			ste,sleep-wakeup = <1>;
-			ste,sleep-pull-disable = <0>;
-		};
-
-		slpm_out_hi_wkup_pdis: slpm_out_hi_wkup_pdis {
-			ste,sleep = <1>;
-			ste,sleep-output = <1>;
-			ste,sleep-wakeup = <1>;
-			ste,sleep-pull-disable = <0>;
-		};
-
-		slpm_out_wkup_pdis: slpm_out_wkup_pdis {
-			ste,sleep = <1>;
-			ste,sleep-output = <2>;
-			ste,sleep-wakeup = <1>;
-			ste,sleep-pull-disable = <0>;
-		};
-
-		uart0 {
-			uart0_default_mux: uart0_mux {
-				u0_default_mux {
-					function = "u0";
-					pins = "u0_a_1";
-				};
-			};
-			uart0_default_mode: uart0_default {
-				uart0_default_cfg1 {
-					pins = "GPIO0", "GPIO2";
-					ste,input = <1>;
-				};
-
-				uart0_default_cfg2 {
-					pins = "GPIO1", "GPIO3";
-					ste,output = <1>;
-				};
-			};
-			uart0_sleep_mode: uart0_sleep {
-				uart0_sleep_cfg1 {
-					pins = "GPIO0", "GPIO2";
-					ste,config = <&slpm_in_wkup_pdis>;
-				};
-				uart0_sleep_cfg2 {
-					pins = "GPIO1";
-					ste,config = <&slpm_out_hi_wkup_pdis>;
-				};
-				uart0_sleep_cfg3 {
-					pins = "GPIO3";
-					ste,config = <&slpm_out_wkup_pdis>;
-				};
-			};
-		};
-	};
-
-	uart@80120000 {
-		compatible = "arm,pl011", "arm,primecell";
-		reg = <0x80120000 0x1000>;
-		interrupts = <0 11 0x4>;
-
-		pinctrl-names = "default","sleep";
-		pinctrl-0 = <&uart0_default_mux>, <&uart0_default_mode>;
-		pinctrl-1 = <&uart0_sleep_mode>;
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/stericsson,nomadik.yaml b/Documentation/devicetree/bindings/pinctrl/stericsson,nomadik.yaml
new file mode 100644
index 000000000000..48b2b5773946
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/stericsson,nomadik.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/stericsson,nomadik.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson Nomadik pin controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - stericsson,db8500-pinctrl
+      - stericsson,stn8815-pinctrl
+
+  nomadik-gpio-chips:
+    description: GPIO banks providing the pin control registers.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 9
+    items:
+      maxItems: 1
+
+  prcm:
+    description: PRCMU controlling the alternate pin functions.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+patternProperties:
+  '^(?!phandle$|compatible$|nomadik-gpio-chips$|prcm$|pinctrl-[0-9]+$|pinctrl-names$)[a-zA-Z0-9_-]+$':
+    $ref: '#/$defs/config-node'
+
+required:
+  - compatible
+  - nomadik-gpio-chips
+
+additionalProperties: false
+
+$defs:
+  config-node:
+    type: object
+    properties:
+      function:
+        $ref: /schemas/types.yaml#/definitions/string
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+      pins:
+        $ref: /schemas/types.yaml#/definitions/string-array
+      ste,config:
+        description: Shared pin configuration to apply.
+        $ref: /schemas/types.yaml#/definitions/phandle
+      ste,input:
+        description: Input pull configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 2
+      ste,output:
+        description: Output value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 2
+      ste,gpio:
+        description: GPIO mode enable.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 1
+      ste,sleep:
+        description: Sleep mode enable.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 1
+      ste,sleep-input:
+        description: Sleep input pull configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 3
+      ste,sleep-output:
+        description: Sleep output value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 2
+      ste,sleep-gpio:
+        description: Sleep GPIO mode enable.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 1
+      ste,sleep-wakeup:
+        description: Sleep wakeup disable.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 1
+      ste,sleep-pull-disable:
+        description: Sleep pull resistor disable.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 1
+    patternProperties:
+      '^(?!phandle$|pins$|groups$|function$)[a-zA-Z0-9_-]+$':
+        $ref: '#/$defs/config-node'
+    additionalProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "stericsson,db8500-pinctrl";
+        nomadik-gpio-chips = <&gpio0>, <&gpio1>;
+        prcm = <&prcmu>;
+
+        uart0 {
+            uart0-default {
+                mux {
+                    function = "u0";
+                    groups = "u0_a_1";
+                };
+                config {
+                    pins = "GPIO0_AJ5";
+                    ste,input = <1>;
+                };
+            };
+        };
+    };

-- 
2.56.0

