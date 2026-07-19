Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AAF38E8AD
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784486120; cv=none; b=YLc86NaWt5j5HPFxpG5a2DMroTbdGVytp4ojtBodF4QiP9R6aO09lrp4S7ZQbBFVuzJhRqFcUBA85RwIUc95rAg/2ZVtw+HW0MMOLX/4WaCQ3xpxOh2a2TO1R4Vom7NX2NCjM2HeknCKd7sdLPqEaYtGptECPSKjHP0FFYXvsHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784486120; c=relaxed/simple;
	bh=Xt6rvyP+YBdxBlj40zdD/6I4q7XcUvlGM8Xu/V0BkQk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SmpWi3nzuVm3I53F0bTQSwavaoC7zaTQOEuTOGAxXltI7DZottcewLJwKCsbEkjH9dK/7FyD3xVmyP71Vy1nJCUMFd3MtLMV102/bghoWCY4XIJ3O3J0rUr/IUaP2NOM2avfj6eD3z/vHFO4NGYJwTkBUNdzQ7v8CW7CWHIDROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQU/xIG8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQU/xIG8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc61541f8cso35663765ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784486118; x=1785090918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4lN1QVg3980xpo75q/c+nSlT6wv9RmIYQq/zpm4V+90=;
        b=lQU/xIG8UvPgXP2S+PPs8tkZvaizRG3tPTOL1Xre2Pi6+FkVyjRBRrE8ZlLJr/i1/t
         v0PjaG86uo9pRv6Hzn91T2RRApfPuBMwBnC25fl3+C6Vl7ga6IGW+HDaDsKE3fsHqLvr
         jPo8fvzXpR8+yhmO6Djb1jMg+Ft2L2k0LwXAL7QY+iTbO1Xzrjngu7ftAzcrz2NGP1TI
         OywSIk8GLQiSnlppEYXAEbgG6O5YyBy9B9EMWMEI1L5ELtIc2gWrVAzaOmNXMs6QAYgg
         piLhZ4EY0W7oXYNqxsBBNZkoaqIXcW7Kl1A8rqiDl5j6uBN878a3Y+UdI+e8YesLzmmH
         sjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784486118; x=1785090918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lN1QVg3980xpo75q/c+nSlT6wv9RmIYQq/zpm4V+90=;
        b=j/8ZmWwPOJVIyh1raXW2aF6C9z3b4cW7nSxpzhCq7MwLqYHDKHl3Mr77OMva53+nTd
         rVYPNVSUvA1K6afc/i4VWq1a0KeO/rg/reIpcvmli3sZXhgmCgXkjH+eO/rJekEuXi5F
         rtgwbE1JYhgbgeenqIzPA0mJJ6XhQJAATT5NQ5bXVs4E6v6+0owilnlxkSt8D/WwmCez
         E9ftFpby4EY97MxsSX8Y4zpNPvQY7yhnGniv90iR8GQ5ApRQKoGoEK9u+VVbjEgYzgVH
         sHX18at4lw8T9qHSvLDgmh8CHlJCvMVqGJEJiKSS82c1l9NqUmWGqtAqDEgMHK0YigwS
         RFPg==
X-Forwarded-Encrypted: i=1; AHgh+RrXfwGBLJtx5VDKfaPv6kgjxLhR5+80CMWlQMq2+Ic/pBreRze6SPtaMjYbK239O3P+i5fKqYQw6/5w@vger.kernel.org
X-Gm-Message-State: AOJu0YzfE+ag4yf6vOlRk7uWKX673RiCegNgTUBjBDvymrWT4mkz/D/i
	0Uud/BUTNlqg4qFxb46J2MPJ+8Ai0sJSF4MAECJyYdH/jbNdJWOhPWnA
X-Gm-Gg: AfdE7clMHgOyK7+uh+H+p+dN7cNK2CwREDaHFRjrbIrKNQLsOhM8cHltV8L79nraF/7
	13ERUXmCFpn+xPala1zXBpNgtMEL7eJ/1uxO+CU1IQUDhGmkI4aeoVI48yWP/cdESl8Ii96Ucdt
	1DhUUcjSW6X0I2mtJeAunBrnzNpCc2xXkaeMRIa4K253eI/yJPUZyk1Epiit+iI+2RBmeqnKJTM
	JbGarccyMHN/UGXEgRaI9Sz/KbbggFPIO/L6SdLnsL1J1sit2inib6GoAcD+47Kbw5BJKBlb13/
	uTcup7uxpp0vShBUB4eN6EW90gYfzv9MBq678ml8grplFK1MNiHF2TvdRXt8rmSyfKJjyy4n/aK
	Pwtx4Kzm1jPA+A4z3JX1fRPnmhZX/cAuG9xoIok+pqAQcA6giATwQLdsympMnAGOP4gROtpXsPT
	xiXleoEk14ylpVMn7aTjpSZICZCM4IR7E=
X-Received: by 2002:a17:902:f683:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2cf1f2561eemr155818095ad.2.1784486118154;
        Sun, 19 Jul 2026 11:35:18 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.165.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm22616659c88.9.2026.07.19.11.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:35:17 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Mon, 20 Jul 2026 00:04:31 +0530
Message-Id: <20260719183431.124061-1-challauday369@gmail.com>
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
 .../pinctrl/microchip,pic32-pinctrl.txt       |  60 -------
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 153 ++++++++++++++++++
 2 files changed, 153 insertions(+), 60 deletions(-)
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
index 000000000000..7a36e5ff61dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,153 @@
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
+description: |
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^(?!pinctrl_)[a-z]+[0-9]*_[a-z0-9_]+$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      pins:
+        description: |
+          List of pins to which the configuration applies.
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
+  '^pinctrl_[a-z0-9_-]+$|^[a-z]+[0-9]+-[0-9]+$':
+    type: object
+    description: |
+      Container node for grouped pin configuration sub-nodes.
+
+    patternProperties:
+      '^[a-z]+[0-9]+-[a-z]+$':
+        type: object
+        $ref: pinmux-node.yaml#
+
+        properties:
+          pins:
+            description: |
+              List of pins to which the configuration applies.
+            items:
+              type: string
+            minItems: 1
+
+          function: true
+
+          bias-pull-up: true
+          bias-pull-down: true
+          input-enable: true
+          output-low: true
+          output-high: true
+
+          microchip,digital:
+            description: Enable digital I/O.
+            type: boolean
+
+          microchip,analog:
+            description: Enable analog I/O.
+            type: boolean
+
+        required:
+          - pins
+
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pic32_pinctrl: pinctrl@1f801400 {
+        #address-cells = <1>;
+        #size-cells = <1>;
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

