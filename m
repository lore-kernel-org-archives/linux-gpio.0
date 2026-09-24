Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1464D5983
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 23:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292946; cv=none; b=mlfac2JnHMKLdZHZaEhLnvZ5Fh9anB0G+fuzhUsPIlO+u1daqrq1+P21kqNpyOhRWr1cJvgM7ZVqa+wnhJb8AQ9KGOSQjLq0MFSQZLk+Wqzr3TJVepgdHsimVJJC0kyFL9RWUL6+1Skx4xx2DZQevo8QKrLciSMANLcUzz5bojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292946; c=relaxed/simple;
	bh=r0Qa8xVuI0KcD+XC59NoXG5s+uJOLb5/D81cWicdzDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AiDdo4eHkHqyV4XQn6PjZytRIAyoRyjOcTqBOb0qMHYC+dxOH1dLgZB7Ew+bqYmQelRcz8zm3CdILdPaPZxo3US631Z7v4+b+pH0e5RnR8ZWo6RKvEYB75O50ZKf5yZAzlKESnq1hywR5LL6sPQfspq2oc2uGtKCx18FOQBa77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODbiiRwX; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODbiiRwX"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df90e859e8so946635ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790292944; x=1790897744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0attvnvfD82Y5pwFdr+qz9ZTNVA9nqcawgFb98iWqJk=;
        b=ODbiiRwXSd2/+EY1/LPoGkzvQfrsIWyjYhEis735LoXbnEtckUwomWbT6PgQqpTmVf
         x9/u4qJGrT4z0CTSxwnHvTw2dG0EYSK6sn00DvXjAWVYN4Hv5i5RphNodOMNBcW3jp/v
         5uCUtZpYPtTAyGPWoLAJkRxjsLVU07lDyyHuJvwgJ9R8lE7pC6KXNE6f9M/xmFyY8cdn
         uySyBJ+Sif7ig+zQkkMypvysxk5YmK5R4cGSp6fw6rpdLGvOHPTps1QFJ7Wqw9K5Kmyn
         aiuglOm1//RxCcamf8swq9RA5QZbnmvmzoq60l/XhwVDTosmaMUIV4aKSXLGzpBtZi4Z
         8Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292944; x=1790897744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0attvnvfD82Y5pwFdr+qz9ZTNVA9nqcawgFb98iWqJk=;
        b=Wjjr+rH3Eute0ZoR1JcxOnlDSQhV2pmstWT0vPD5l7u8/SNjdUyA7sOGmdi7YFJVv8
         DLV5fWYS6YI9pL1c5Dm6W1ze0na4KPecluWkcfcgeRF4OF1GePLP8mPqIuCqlcX8464n
         3rKciRWiC03l5WuS8uPTLvJKSIMDJBRTcWETw78UbOeP6OE83UuUVS1sD9Xgzh4KMDwT
         DMSwMBqcZpclW+fE2/ky8Mbd0MxKZm1XnjGrK57bSiTVRPpt8r+WYumL3/YapmOTykeA
         jnbHVxR6PzNNm2WbtAtUT2OEKzpCVSWd90OkwNrfvxbaoEDcIAnjBZix+SrGCU06ym3P
         L7Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxp1wZvf0Ydw9ydAJJepG+ws443AkxH2tnHb65pVZVwoZ5t2RMnGjR98j9js4YitarhSurqMpDvph2t@vger.kernel.org
X-Gm-Message-State: AFuF++md2WwLCcI7UlSn8Uanqu0yKq3c3iemAOxlMI1Ya9/wD1jqB0kp
	zBz3W2Tux5qZW4wcwZJJpTKfmHMOMyCNBLepHIlci0xV/AfrYrlx7/we
X-Gm-Gg: AYBFou18/yjsFWm4qHW6VZQ5bkvMwbMAoQ15gqtk9V4fFypd9pRvyYQvXxCD7OOytWC
	XL0jk25cWeQrpnt1rpCFibgdr0wyBNCvhl8fXElau4HkWQfNurj0NcwgpTz+RCOthjLIdpHlxRo
	57vnnokxTNtLNnttOzmRJCk6YEqd5kdGK7HoIszZm6QuadvMydkVL+XPwKWxe/2Buc7cwUSTVNR
	SqAxKaL7zhd96opifh6CUiwprRaiEgIoOz1XwDAn2DiL9J92YjhvICob2kRZJK9ytpqdSDbavH9
	VlyEWH+k9tjQ3MKc0XIDUDqJ3yNfgKFaf7aeoH3HkVPtEKD8Pc4lt/smvGDQDTOU8tFA3iPFawq
	KhEGuwhQ8qZ+cKhL+QddAkioJnq6zYw4Y0htD6ur3apNMji/H4LhiHrehcD5WoUaQyX5ejNoyS1
	R0mhfqMewTjZ9a21k73dz28hmImRcnWv+QjHwyBQ35hwghcGc0b6pBpMuvLdNer12e0VWW3LtJC
	4z86YkE8zMcoLFA2DRQeCP9IvE7hMRqV4SJP0TLhzCIeE83xvnet2eQHGlNb6vkdRluyFWwLclo
	QsnbVQBX3nib/HTQooqmgW+ruZ8Q1vYkwAQwcz3CL8SJ0A6m9Q==
X-Received: by 2002:a17:902:e889:b0:2df:49be:3148 with SMTP id d9443c01a7336-2df7e28c46fmr24990435ad.35.1790292943643;
        Thu, 24 Sep 2026 16:35:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e030dsm2108085ad.16.2026.09.24.16.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:35:43 -0700 (PDT)
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
Subject: [PATCHv2] dt-bindings: pinctrl: convert nsp-gpio binding
Date: Thu, 24 Sep 2026 16:35:41 -0700
Message-ID: <20260924233541.126868-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
documented in the legacy text binding, so dtbs_check reported "failed to
match any schema" for the gpio@20 node present in the bcm958625 and
related broadcom boards.

Convert Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt to
a YAML schema and drop the text binding. Keep the existing required and
optional properties (reg, #gpio-cells, gpio-controller, ngpios, and the
optional interrupt/gpio-ranges support), including the generic pinconf
child nodes with pin bias and drive-strength.

Pin configuration nodes may be direct children of the controller or
grouped under a "-pins" node; both forms are recognized, and each "-pins"
node may group further pin configuration children. Child nodes named
"-hog" are supported as GPIO hogs.

Assisted-by: LLM
Signed-off-by: Rosen Penyev <rosenp@gmail.com>
---
 v2: don't drop gpio-hog
 .../bindings/pinctrl/brcm,nsp-gpio.txt        |  80 ----------
 .../bindings/pinctrl/brcm,nsp-gpio.yaml       | 139 ++++++++++++++++++
 2 files changed, 139 insertions(+), 80 deletions(-)
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
index 000000000000..d7f9a1eb3b93
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
@@ -0,0 +1,139 @@
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
+  pins it controls: bias, pull up/down and drive strength. Pin configuration
+  child nodes may be direct children of the controller, or grouped under a
+  '-pins' node. In both cases the pin configuration nodes are referenced by
+  the consuming device through the standard pinctrl-0/pinctrl-names
+  properties. Child nodes named '*-hog' are treated as GPIO hogs.
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
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+  - ngpios
+
+$defs:
+  nsp-gpio-pinconf:
+    type: object
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
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
+    required:
+      - pins
+
+patternProperties:
+  '-pins$':
+    oneOf:
+      - $ref: '#/$defs/nsp-gpio-pinconf'
+      - type: object
+        additionalProperties:
+          $ref: '#/$defs/nsp-gpio-pinconf'
+
+  '-hog(-[0-9]+)?$':
+    type: object
+    required:
+      - gpio-hog
+
+additionalProperties:
+  $ref: '#/$defs/nsp-gpio-pinconf'
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
+        /* Pin configuration node applied as a pinctrl state */
+        pinctrl-names = "default";
+        pinctrl-0 = <&led>;
+
+        led: led {
+            pins = "gpio-1";
+            bias-pull-up;
+        };
+
+        /* Pin configuration nodes may also be grouped under a '-pins' node */
+        pwm-pins {
+            pwm {
+                pins = "gpio-0";
+                drive-strength = <16>;
+            };
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
2.55.0

