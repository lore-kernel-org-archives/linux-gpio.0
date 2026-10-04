Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E669247F3A9
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791142612; cv=none; b=csoxWxG+kjMDIhI0ypxyjLFYQErmGr76orVxD6nBn00xLLSN6UaDeVmfEXJgzbI2CuAV5b1ReKjTXAQ+VadUN1tfJj5qWgAjx6Ogz7qw+HgFEX8L49ozyR2QYNs6Lc2YRntW0VK/Q5Hcz5ZA/2VS+9uDJB9Qmhe1UGNX/1D4bJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791142612; c=relaxed/simple;
	bh=8g4zVRDdm7AFB9V8eMNB5liEHMmZXnhicReABTjaU4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5YY/xtoayJccdJIA1Cc8TbkBfXeaaJNq7Eov/VdCWboVOtNBflbzO3XoXpDZ7JRHDdtPZaTDkBe6PLxJ5QVLGC40AzthE6suT3XmNXHFSP/6zIjrqRf8p+TwQFEvTBRsgawUf5cmibuvcFH9EGlqOdXGxydVyNQY2qMIYnXlPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8CB2jFl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8CB2jFl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so504563a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2026 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791142610; x=1791747410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=thSakCopdqdyxg0wl9015hNt7s21og4flg1RvJbjOvQ=;
        b=F8CB2jFl42i8+0n+QJ2qDxGNjNsJXRBI3TlUpXLIvEfFaW+HRGneX51WF3p9bAwOTL
         92pyNJGtoGdeA6LUcl+u3WR3qdJ/KBH9yv4fEVLoMZKWleiOfHGzREjMJPqGqwWuyODP
         60QFl4MJLpKKx+8qmws9vYcKy0tTWrZPxL1Rn8esr0XhJTgpKXTRQzsteAfoLBh9yHjf
         ZB2JxWM+WLbB5IrVRE278omtZQQxbhrGGKhdMim00m8ckDLWPc99OVzqOANyghQFfQ7g
         tL4O3QGy6jFLWz+0OOMteKsuGNKuvJ+8oL6xQ1ghG5oNppUbhPi5doT1U/XnQIWV7zb2
         zd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791142610; x=1791747410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thSakCopdqdyxg0wl9015hNt7s21og4flg1RvJbjOvQ=;
        b=u0Le2Vg6ogyG+LENVatSiGzDRUOZKM8Ku8ZihBWnjyHYIeKXoABVjm0qvNz4g1/IeC
         ZVW3iaFu9aY8rDmDBmyl4t838DB7VGc+6GKeTl2WYWrLmpnL/FlP0M1CM7Z2yu8j9Ts5
         9Jogo95sSkoWBjkS5tW1MzokDdvSe6+p/MAMoJEfVh+b2Ckk0qoQpaSsUCza3CJjji3F
         sFbujl0O87qaTrDNbi9kMDcaw/2bdkDIT20zH97l6IKoEe2iQpDTAlZttmAbXJF5UEfH
         40vvHTZSAUFQ/e96ZukojJYnc7321gJ5JrfYY9wk0wuaPVn7QK685zF32FyFMciqC/oE
         iJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBw2oQQFNS8c9dYvkm2YplFXdAZw4Lff/InSxn7j+IYc7Xebws1/Vb9eS4buIwjTKlcyaz/vNb4pMuPm@vger.kernel.org
X-Gm-Message-State: AFq9FYJL63fxSZV1rwkMTiYAs5UkOA0WQcPOCqpKbXTpR9UlWPHZbYHJ
	AdybQjkmc+HRff9UeEYjvW8tR+wfeAn+HKwAjix6B5fsFbG6C+x7NbyJ
X-Gm-Gg: AYBFou3Ae0VqJH4dwUr9OkS/XUHc8L2JhdrNxw+SpWkchvggpGwwGGPMsA3Zih/JOVd
	pPuvO6NmLw0CvKUprXa/8o+I9i+T/73ehsat6wSR+iUGP7twaCqAAU88vH2svnhQ5OTcSbbZ8m5
	XT1Q41SzNT/5Y6rQ49x3SAYz9jrz9XsIQ3tgziTMgY1Lasmr5l/p4qmKmAIDIBc2ktbDhAtekSw
	/v1xcWddOfqaq055LQkaWmEjCHFTZ2W2vaA01JwKMDOVkyT/36bFjKhOysOv4z915h7KJIPDQvL
	TiOuU52E3awCclU2r4CVyIGhNV3oCxEsCOj6YDxtTdc24cA3Zemz94r3/9bxj9TOTIELrNHmZYV
	C7YbwOBeQtEa2YeSn3whGH7XJTm4gR1fuw2W0XCj6cRpnC3p8uPIiw4z7zDq3MtMtGGJBf99S35
	Aqji74pXQ9k7StyvnYSgh8/Zgpst7ExulhuyzbWwIxnLAWJDY2n7NKONB8lAlCIKFEZnQ7E/H0/
	4HK5c4SZt1yD5IVINDU2dZROBJA3G6r55rs7alwHH0aRnEiTs/pKxhF9G8/ldmFMX4q3tXsCsjx
	J7/FIeKI05bfCcTNp6D93t1FVtdnlJ8UHB20ZN76CT3Gt0K7
X-Received: by 2002:a17:90b:180c:b0:3a4:a229:58b2 with SMTP id 98e67ed59e1d1-3a7873dbd40mr4051614a91.38.1791142609926;
        Sun, 04 Oct 2026 12:36:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7cd99a7e5sm3849849a91.6.2026.10.04.12.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:36:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] dt-bindings: pinctrl: brcm,nsp-gpio: Convert to DT schema
Date: Sun,  4 Oct 2026 12:36:47 -0700
Message-ID: <20261004193647.182052-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
documented in the legacy text binding, so dtbs_check reported "failed to
match any schema" for the gpio@20 node in bcm-nsp.dtsi.

Convert the text binding to DT schema. Beyond a direct conversion:

- Require pin configuration nodes to use a '-pins' suffix and GPIO hogs
  a '-hog' suffix, as the old example used arbitrary node names. No
  in-tree DTS has child nodes under this controller, so nothing is
  affected.
- Document slew-rate, which the driver supports but the text binding
  never listed.
- Add #interrupt-cells and gpio-line-names, and make #interrupt-cells
  depend on interrupt-controller.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: rewrite to add extra stuff not present in original.
 v3: add additionalProperties
 v2: don't drop gpio-hog
 .../bindings/pinctrl/brcm,nsp-gpio.txt        |  80 -----------
 .../bindings/pinctrl/brcm,nsp-gpio.yaml       | 130 ++++++++++++++++++
 2 files changed, 130 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
deleted file mode 100644
index 0844168a6dd4..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-Broadcom Northstar plus (NSP) GPIO/PINCONF Controller
-
-Required properties:
-- compatible:
-    Must be "brcm,nsp-gpio-a"
-
-- reg:
-    Should contain the register physical address and length for each of
-    GPIO base, IO control registers
-
-- #gpio-cells:
-    Must be two. The first cell is the GPIO pin number (within the
-    controller's pin space) and the second cell is used for the following:
-    bit[0]: polarity (0 for active high and 1 for active low)
-
-- gpio-controller:
-    Specifies that the node is a GPIO controller
-
-- ngpios:
-    Number of gpios supported (58x25 supports 32 and 58x23 supports 24)
-
-Optional properties:
-- interrupts:
-    Interrupt ID
-
-- interrupt-controller:
-    Specifies that the node is an interrupt controller
-
-- gpio-ranges:
-    Specifies the mapping between gpio controller and pin-controllers pins.
-    This requires 4 fields in cells defined as -
-    1. Phandle of pin-controller.
-    2. GPIO base pin offset.
-    3  Pin-control base pin offset.
-    4. number of gpio pins which are linearly mapped from pin base.
-
-Supported generic PINCONF properties in child nodes:
-- pins:
-    The list of pins (within the controller's own pin space) that properties
-    in the node apply to. Pin names are "gpio-<pin>"
-
-- bias-disable:
-    Disable pin bias
-
-- bias-pull-up:
-    Enable internal pull up resistor
-
-- bias-pull-down:
-    Enable internal pull down resistor
-
-- drive-strength:
-    Valid drive strength values include 2, 4, 6, 8, 10, 12, 14, 16 (mA)
-
-Example:
-
-	gpioa: gpio@18000020 {
-		compatible = "brcm,nsp-gpio-a";
-		reg = <0x18000020 0x100>,
-		      <0x1803f1c4 0x1c>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		ngpios = <32>;
-		gpio-ranges = <&pinctrl 0 0 31>;
-		interrupt-controller;
-		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-
-		/* Hog a few default settings */
-		pinctrl-names = "default";
-		pinctrl-0 = <&led>;
-		led: led {
-			pins = "gpio-1";
-			bias-pull-up;
-		};
-
-		pwr: pwr {
-			gpio-hog;
-			gpios = <3 1>;
-			output-high;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
new file mode 100644
index 000000000000..e32b2cde0f17
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,nsp-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar Plus (NSP) GPIO/PINCONF Controller
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+description: |
+  The chipCommonA GPIO block also provides generic pin configuration for the
+  pins it controls: bias, pull up/down, slew rate and drive strength. Pin
+  configuration is described in '-pins' child nodes, referenced through the
+  standard pinctrl-0/pinctrl-names properties. Child nodes named '*-hog' are
+  treated as GPIO hogs.
+
+properties:
+  compatible:
+    const: brcm,nsp-gpio-a
+
+  reg:
+    items:
+      - description: GPIO base registers
+      - description: IO control registers
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the GPIO pin number (within the controller's pin
+      space) and the second cell is used for the following:
+      bit[0]: polarity (0 for active high and 1 for active low)
+
+  gpio-controller: true
+
+  ngpios:
+    description: Number of GPIOs supported (58x25 supports 32 and 58x23 supports 24)
+    maximum: 32
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+  - ngpios
+
+dependencies:
+  interrupt-controller: ['#interrupt-cells']
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pincfg-node.yaml#
+
+    properties:
+      pins:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        items:
+          pattern: '^gpio-'
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+      drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+      slew-rate:
+        description: 0 disables and 1 enables slew rate control
+        enum: [ 0, 1 ]
+
+    required:
+      - pins
+
+    additionalProperties: false
+
+  '-hog(-[0-9]+)?$':
+    type: object
+    required:
+      - gpio-hog
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio@18000020 {
+        compatible = "brcm,nsp-gpio-a";
+        reg = <0x18000020 0x100>,
+              <0x1803f1c4 0x1c>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        ngpios = <32>;
+        gpio-ranges = <&pinctrl 0 0 31>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&led_pins>;
+
+        led_pins: led-pins {
+            pins = "gpio-1";
+            bias-pull-up;
+            drive-strength = <16>;
+        };
+
+        /* GPIO hog */
+        pwr-hog {
+            gpio-hog;
+            gpios = <3 1>;
+            output-high;
+        };
+    };
-- 
2.56.0

