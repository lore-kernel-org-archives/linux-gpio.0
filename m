Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069017A31C
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723596; cv=none; b=UfaWyMdPDi7ajH64UbUNWBExDTxSOIsZxSbMJhyqzBjwsYdhR6Ai9Cq6qVCPvM4Uhq/pn72do5szq7bBfk9o3VVJpgO3Ove0PM7/6EETU3uE8UW8kbcDYclkNZW9Q2DrKHYQ4LwMKZ1C907fLSiKqSJzBD34tpNvp75MX6+nruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723596; c=relaxed/simple;
	bh=t90Nz4neymx/A5iQaaKtBeqiRFzxIMQkYqzWqPUtugY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fCIc2ZfhW2RKnQVlZztxOtBB03bmSlCOx8oasPOyLYW2POobQ2ExNDtfs+YioBeLc1xBDhtaZuKhI8GM9U3RncgSKdQ4ZQSB2D+07vD/fZSBaoisdYNQ1XGG0ZNUg283ayJ86pFuMHIpHweLAqWiEzX2vDyZREvTuByzJaQu7zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQCjqFRH; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQCjqFRH"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso7421978a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723594; x=1785328394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4iZ+Vbnw+vy5ic15MZIpwcvb+7jpLOoQeZZoMRgySY=;
        b=kQCjqFRHdF0XDOuwHH3Q3/8tMj7R3eGUjuzFsjVaTrQzopzwtRG7hChkvG+3mWmbY0
         f0j8ONdgR3NfCOAmbzdH4jKuftlceXmpfGh0Vc8bhV4byTQaAiRVFqrqwDS8gjfgK0eS
         HExu4pKCDEt7sLmPAbI57WvJGz9rn7N0uxDEa0Gyj1Qwrhm48JlKuhmWgx5YuuXXGJw4
         qWSYvGxkFD9126hK4WzWJ5O5hH4275DkavF0Rz55iFIamj3XeOdH+n0jJRDszlGJl4Yr
         copK+asFmkNTup+4X6m5p2uiO9618gxe9b4tNTUBrdaRUAD4WALN7owAMExE7FIMbJSH
         +ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723594; x=1785328394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4iZ+Vbnw+vy5ic15MZIpwcvb+7jpLOoQeZZoMRgySY=;
        b=hqLYwjX4SxYkXJm1q1ZZHq6RtGZ0Hwm4fz9DyeayRUfdTJmfDz4WJI34ndclyA9erV
         EVqxQJqOuSY58xm5vviaioeAJsQ+lCVketfLR5IIZQ0wL/nO8nUajlbMAPBBuqEcJg93
         m3yNKmgO/C9ekVwXIZaND+jPiNAlI5B1ZuvVIRPOgVLEjDC9uQ2LAa8jHVFEuX9D9igr
         pxnoTVljFly+EoWKHxBwvtl998E3oKsCFJs326DuMDFvB0eJmNocoSIN6n7GAw6f3Fvp
         AXtysEeIsdXOyepqhGg2hazQfDHAlz2bWLaMq2codlYNaFzVBh9pfIIlqMUScfQZkRQd
         eHbg==
X-Forwarded-Encrypted: i=1; AHgh+RqwQrlhAy4ihNJ/Sq7z0ownYqRJSDjkDQO/nnyr/QEFeupOSQz0n5F243R0vgir2D3R/iHQ6yn766bS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo4ECOaS2J/rmHuqA6OYpZ/nvgzLtj+rR3FKuT4FoUKe/3UUyq
	pRouTtCj2efTQDfe5eNkLWMpIwSRmu6sw6mskA55jUt1XrIax8AwiuPA
X-Gm-Gg: AR+sD12XbpxW1XCq700ko1XxRSWWFpcYIsx/VsINB+Y386ho4NY//3xG/BHJIk85XKQ
	fU/DCnjlYRi1l1Sd7oZAak3P24xY1RmHnujrztbd3l4vxs4PsXrxaVEe2fhGCrWBEYEFd/RIAma
	PijMspmFw9eMRTJ5Yam5tyzjerO00fJ8EsL5useTEQW16PN8pB9vpRG9O4vGfGaHvurK4/+kRtl
	KQ7V9ziNXpmR8PFpsou+yTosPbudEF1N6obNGS3lM8CtIP34+Wlg1UhAJUvJscTBiUOGBIyTp4y
	9tPoIwFbixXGYsriXrl1iUz/u0X2UoFbcJ7289jNkHRXBFmfoa8BREN2yyoIin0yWnHerjxwEsR
	o4PxATs2IRm4THyhNVADIYhtAS9XRHgYACkODAccqzt8HbVN2VWCLM+3LR2NSAxPzlsgd5MbfZ0
	IWcoPyQEl5Z+oGqf9QoOEwhV8AFol+MOo=
X-Received: by 2002:a05:6a21:a8d:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3ad5aed77mr24600477637.9.1784723593491;
        Wed, 22 Jul 2026 05:33:13 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([117.231.200.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0d872bsm1097186a12.7.2026.07.22.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:33:12 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Wed, 22 Jul 2026 18:02:43 +0530
Message-Id: <20260722123243.341346-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v3:
- Drop "|" from description fields
- Remove '#address-cells' and '#size-cells' properties from the schema
- Consolidate repeated pin-node property definitions into a single
  $defs/pin-node entry
- Replace the two patternProperties blocks with additionalProperties
  using oneOf to allow either:
  - container nodes holding nested pin configuration nodes, or
  - direct pin configuration nodes.
- Update $ref to use the absolute schema path
  /schemas/pinctrl/pinmux-node.yaml#

Link to v3:https://lore.kernel.org/all/20260719183431.124061-1-challauday369@gmail.com/

Changes since v2:
- Add container node for grouped pin configuration sub-nodes
- Correct regex patterns of direct and nested child nodes
- Fix interrupts values in uart2 example

Link to v2:https://lore.kernel.org/all/20260707144223.120417-1-challauday369@gmail.com/

Changes since v1:
- Add interrupts and clocks to uart2 example to satisfy uart schema validation
- Corect regex patterns to accept standard DT node naming conventions
- Add function property to top-level pin configuration nodes
- Remove restrictive enum from function property to support all mux functions

Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challauday369@gmail.com/
---
 .../pinctrl/microchip,pic32-pinctrl.txt       |  60 ----------
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 107 ++++++++++++++++++
 2 files changed, 107 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
deleted file mode 100644
index 51efd2085113..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Microchip PIC32 Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-PIC32 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "microchip,pic32mada-pinctrl"
- - reg: Address range of the pinctrl registers.
- - clocks: Clock specifier (see clock bindings for details)
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
- - bias-pull-down: Enable weak pull-down.
- - input-enable: Set the pin as an input.
- - output-low: Set the pin as an output level low.
- - output-high: Set the pin as an output level high.
- - microchip,digital: Enable digital I/O.
- - microchip,analog: Enable analog I/O.
-
-Example:
-
-pic32_pinctrl: pinctrl@1f801400{
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "microchip,pic32mzda-pinctrl";
-	reg = <0x1f801400 0x400>;
-	clocks = <&rootclk PB1CLK>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2-tx {
-			pins = "G9";
-			function = "U2TX";
-			microchip,digital;
-			output-low;
-		};
-		uart2-rx {
-			pins = "B0";
-			function = "U2RX";
-			microchip,digital;
-			input-enable;
-		};
-	};
-};
-
-uart2: serial@1f822200 {
-	compatible = "microchip,pic32mzda-uart";
-	reg = <0x1f822200 0x50>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
new file mode 100644
index 000000000000..a1ecae3b1cd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,pic32mzda-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32 Pin Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  PIC32 pin configuration node is a node of a group of pins which can be used
+  for a specific device or function. This node represents configurations of
+  pins, optional function, and optional mux related configuration.
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+$defs:
+  pin-node:
+    type: object
+    $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    properties:
+      pins:
+        description: List of pins to which the configuration applies.
+        items:
+          type: string
+        minItems: 1
+
+      function: true
+
+      bias-pull-up: true
+      bias-pull-down: true
+      input-enable: true
+      output-low: true
+      output-high: true
+
+      microchip,digital:
+        description: Enable digital I/O.
+        type: boolean
+
+      microchip,analog:
+        description: Enable analog I/O.
+        type: boolean
+
+    required:
+      - pins
+
+    unevaluatedProperties: false
+
+additionalProperties:
+  oneOf:
+    - additionalProperties:
+        $ref: '#/$defs/pin-node'
+    - $ref: '#/$defs/pin-node'
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pic32_pinctrl: pinctrl@1f801400 {
+        compatible = "microchip,pic32mzda-pinctrl";
+        reg = <0x1f801400 0x400>;
+        clocks = <&rootclk PB1CLK>;
+
+        pinctrl_uart2: pinctrl_uart2 {
+            uart2-tx {
+                pins = "G9";
+                function = "U2TX";
+                microchip,digital;
+                output-low;
+            };
+
+            uart2-rx {
+                pins = "B0";
+                function = "U2RX";
+                microchip,digital;
+                input-enable;
+            };
+        };
+    };
+
+    uart2: serial@1f822200 {
+        compatible = "microchip,pic32mzda-uart";
+        reg = <0x1f822200 0x50>;
+        interrupts = <145 IRQ_TYPE_LEVEL_HIGH>,
+                     <146 IRQ_TYPE_LEVEL_HIGH>,
+                     <147 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rootclk PB2CLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart2>;
+    };
-- 
2.34.1

