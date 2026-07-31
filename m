Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D900D43CE6C
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519978; cv=none; b=HQVK1WUrf5PfnI/hQxwkGsV8xJzzMf08G34wt3gUos4RIiQCs+CsXBjUy/dVauka0bxMs19zpsu21wWdRRLNS7YCBdyeh/MSnIgYGpkf4EzjyBfi+i53CuSC3f/9ZXtJRVdTNihLrP4FLEZbncmnhwF/5J2UkKGAJgrXW1xv9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519978; c=relaxed/simple;
	bh=z6WTJdkFIeXrgFaezQL1WS00nRLmZJBKUbnxCznPukc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B0bcdfC5G5X2GVPDQnEN1oomNuCj4E8bA9luH9BXh7EFT8KIjf4inG8MQSakwYSzapTLVZRjZ2CeBKPi7DnII9PUf4AyEZApuKrI3ma3t88ZNX9UO9HU8Eq+SNh7Q3zktwk8A0hB/g93SBnadp3Mxwb57R7WLOXOMDrRvFIb1CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBj+Dfyp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBj+Dfyp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a451915d8aso727496b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785519975; x=1786124775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7Xbtur0sVUBQodD8WJmY/6tMjdHBar4IEaj9jQofJo=;
        b=aBj+DfypxklPrEhOs6kfBhCkLhmaLRItLHQjPSh9VRdZ6cJtxUeL0KXpwUg4Tb1rrB
         XeFRjf8suFKvOt1WwmCWRyOJXrFYxTlzEh2zC+iQgyhKi8ZHhcEwRmpCiLOSqNopPgED
         VhBPmTXNKSpOC+8EGMAbtbF0BkpO4dpw1dkxI7o4Z2Xw/cbZAcLMoCw/8FvnbG0ejweM
         dj0+Ley2NTqnPYcv2KHBIYuluqj5DeFB3cQ9P/Rcz9eRZzDxfNAbfdJde8Rc8EUaHVWr
         d0dQ5FhPKi8i2phXPl4hvknlpox1+0g3GvTHePkD+N3g70W/VSNqIWUP/KEhNqhC8AlA
         zxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519975; x=1786124775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7Xbtur0sVUBQodD8WJmY/6tMjdHBar4IEaj9jQofJo=;
        b=Pzr/G92DgaG9LqzxMGdfKuBlHB0cvbyvwAiDuKHHX4JemWNFBy+K61RXzJGZUMzSiq
         tBHkShNH0TtiLIQdDo1LqGulLA0Ec6HFsWUJHiJzIPdLFhCAhxkgiPlLwul5mwirLfZf
         7njHrIhgx1gqZGtpNkjjULZiZ8GQfm2p2zXbX6elPTjQ8gUA4T50LWzvLdb8ZmnYwnX2
         WQ/9OKOQQE9qxnp/fUDOp8QPdBvNAe9J5dfN6DB6nPhcBYj3tBrNPXnnLagp3bAnrs2l
         Emn5fJg0Lnys+iRTlHc8aKXvgMJOXQgYAtD0O8MVgZZ2ry8p5LURmWS1f+X9JjRN8BQj
         5x4A==
X-Forwarded-Encrypted: i=1; AHgh+RpSQYa3x+DQRKc2UoecTeQsEoR7xhiqtQmL8+bQltw4pf6oSXDL0W7UvVE+neBc+raSh+ZG1Lzth7h3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxil9MY2OujlwhvVl4Qm4GVEcGVm4CXUSluOgsWFmA5LK8E8IWX
	o1ZtMk3Jv4u+7L8CzYEeGnUXfGKijw0BP9Es282oGu3950gNZ6rNxJUn
X-Gm-Gg: AR+sD13li0gzrbEpvBNZvNSxI6u6MOzMq85dPi+dLbvYFMqkj6s8G2tBP3e3+SqZILc
	US1d/pVgMEd7e/BqAI7WOLEv4alVKgEhblWE8+5Nt/ZIV2FgDCujqJafXhG1rasKp1FER9ucYF9
	FrZlb+44goEF/OEOp45WIwLzeYBBor3olZdrtLJj0CMdTZaWrWWlwmL8M2kUEFQ7QtAGMYUpLEz
	INIBuTJDbPMMOXo/yNklAoXiK/8h2eT2fy7OW/96CAa4YJchXKEPR2KvjYSMuEsLSpyMBPdwIAC
	vIrv+dq/zeMfph2zamwlWe6nno5YXgjTAZe9KrXwp6rcpgGSGBd6Cl84NSiAVs/5h95eJ7eSuF6
	4bC0IyqpWIhhalE+CJoGtFCNN3RedjEIVwl9IveGr16IIxw7E3MiuVkvoggyVXn4eUOC6kH+XIg
	lda7dLnVY47nJWjm+zr3gYwOERkv/pFJBcIFJ3tuHvkdmh/AXbGDw09laAAd09jv0WL/3zQ2oZe
	R02J8k=
X-Received: by 2002:a05:6808:1201:b0:496:1ca:e437 with SMTP id 5614622812f47-4af5e338314mr1392810b6e.12.1785519975540;
        Fri, 31 Jul 2026 10:46:15 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.242])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58ce0a1bsm1156853b6e.2.2026.07.31.10.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:46:15 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Fri, 31 Jul 2026 23:15:51 +0530
Message-Id: <20260731174551.86367-1-challauday369@gmail.com>
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
Changes since v4:
- Add reference to pincfg-node.yaml

Link to v4:https://lore.kernel.org/all/20260722123243.341346-1-challauday369@gmail.com/

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
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 109 ++++++++++++++++++
 2 files changed, 109 insertions(+), 60 deletions(-)
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
index 000000000000..dcaa87d9a30b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,109 @@
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
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
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

