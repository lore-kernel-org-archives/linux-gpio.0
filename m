Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AE356757
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 21:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544473; cv=none; b=PBRUKYe5bSrfPeQi4yWXj3drfxHvabEwwu5F7fZD4mIExNc/AHkK/Gt2YmJ8daEZR4rBFIjmkQW2+5yTvsluBn46SiquwXiVBf65gMPBz0pdZfFoWQV3phpNHFWrRm/LBWCTDI25MxsX1IN3vYon5F4Qze0EX/b9KyTmJVy8bBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544473; c=relaxed/simple;
	bh=VhY8NDHn4bXrBI+l05CQzD0IHafaAdXFqYbCV7HnThs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJlzEYNYEM4Gd2NCa185sMkLxojbKY3fMQ2kAcWQwAdqAyckQ+ueqn4sVgQSQF7TeC9EUVxx9GbSJY7QTc75ahXJzZgrInIMYY/YrwgWOBTtcKfVaz/WWCcaT9meavaf7WxjSVFVoGDjEpUSotxm5YANpn8EZ1/V1qtVSKzp2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuVhqUd0; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuVhqUd0"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df90e859e8so7255355ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 14:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790544471; x=1791149271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDsfQvOhX1AEI5bK44RDh+3P9lruHos8bz0YTnuqwuw=;
        b=BuVhqUd0eB4Z7couLlG+332/80ZcYWbT+DByrpxFi7v0C6HxEWRU6Ey/rjOoY1bkaF
         B+ZTe8VjZTAFbkxCoMPxEib/2jGk7q8HppDvG6HdCRTX4WA1ltQIhyZ5W7fFSF8o4jsk
         kv0d5VqDElubNbNc/+KVVfPObMi5ry2VYS1AkETNqffc2OCKWU/i7vDv7z8x+abINAYd
         SRRcQLr1DWYqxkwBMK4ZIqA/5n6Pke2WqIfpb21OFOVxYziEr1hBNZF4FMC0mTh0HfFi
         rCdbmQsMq+i2/7eoBbj8Am+gko1J6hYSDkBhUVAtCpHRsJHZLwO0iHyzyd2/VAutE4ze
         lqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790544471; x=1791149271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDsfQvOhX1AEI5bK44RDh+3P9lruHos8bz0YTnuqwuw=;
        b=gVojd99mOH2+pmCi7I3ONLga6Ea7EmatGUSkmx1mISKgYjVA+LSQZ7yYyEKYIwmpIc
         QeRi5VslG5OR/9FkvyAipwiATkKxWt3vCrM1LTzKXloG0/yuGhXaxG6mdUOebyoqxpdH
         HD7XCySzy1h9BHHhg+n/U24h3gj75LtiRFh6xSRLJZ9yDXzwiZUAN15j7PazNOiF1kDk
         zLW8fUv9JfvSEU8VYheTRUu1FDoTmqB+iw17s93femapoRdFqq8RHhElyUfbYdJu88p8
         gZ43x9285z4b23LkpS3AgiSAE9Umbj2Gv4luufhje02zFY+H26u9kyI49PzCdXmKP+SV
         JXBg==
X-Forwarded-Encrypted: i=1; AKwUvBzEArDweV7oAX/imshGZmPA/A52TL/ghhUpYcFI2uXbjHJ/AGmMIsXIETOaQUbuGve/pPbEt9A61F+O@vger.kernel.org
X-Gm-Message-State: AFq9FYLFdV/B16K5o0+gJkBWC/6cv1eKuJ7ktarAYjZ5llsRQYARq2dS
	Me87XOH8zdls0Tz3h/6XZIInNs9Fjqu09y1u/8qFWsnvvMR+46FtnN+qP5qvkTQZ
X-Gm-Gg: AYBFou2YsW1UefOV3hVw75ZcJPlUrO5xrvNHZx3MahBqI/DPXcHiV6+uqPkGajhu3ky
	K033/u9DSpXmu9oWaaKUU/PG/CfFSyRG0FILomMg87Qwl0Q2BC9KTGG6YVD0/HmJTcH9t/mhiBy
	OgnWC3DTwCAssUanHOtaj6mAcBwLSY8oA0cNc8r4BN9bu4o80OYkD+VBb34vKAbtlXQnGMMVYSL
	orFUjCdg1GELrXkdLBnV+nuLAUHOSt95HioglXkW+017MG0l+eT/rN7hxabghIlZUYUesJgb7OX
	l4vwrwaVhMSWtStgyZbjCqRdF7heEC277XqC7cWM6sPh3BredqBV2GPqY6bQv7ZxKyxYyi7txsW
	z09uWEswFbk5QS0Z/h5gmzncCxEXV12Tc4hQW2N3Sd8ExaeE7+Xi2vVX2cPuX/nFNlG5EKkh6G3
	GF0JwXcSmv6JV4wOpVXO8ikmbhNdKvHgDeML2//FBdIvw3SUgWiK6GAGQ13Di9Q2jlc7TchViTu
	1mh5ufn7Wejes2EKejA1XPiLBTWHokYHE70HYg/veU48jvaXsVktmtFcFfMhYT8yFZ4bioqUR0L
	ctQe9awD0HxgnErTnGFQXrUwzgRokPMQYGtgYVx3iUEPkUVu8YQ5IF6ohn4=
X-Received: by 2002:a17:903:3d06:b0:2df:9928:7e82 with SMTP id d9443c01a7336-2df9928a2d0mr40222775ad.20.1790544471286;
        Sun, 27 Sep 2026 14:27:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91461d43sm31233775ad.75.2026.09.27.14.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:27:49 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: pinctrl: convert nsp-gpio binding
Date: Sun, 27 Sep 2026 14:27:48 -0700
Message-ID: <20260927212748.123558-1-rosenp@gmail.com>
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

The generic pinconf and pinmux helper schemas end in
"additionalProperties: true" and cannot close the node from an in-place
applicator, so spell out the supported subset and set
"additionalProperties: false" in the local pin configuration node schema.
Without it misspelled or unsupported properties such as "bias-pullup" or
"slew-rate" are silently accepted.

Controller children are matched with "anyOf" against the pin
configuration node schema and against "not: { type: object }". The
latter keeps non-node properties such as #pinctrl-cells or clocks from
being forced through the pin configuration schema, while still rejecting
pin configuration child nodes that do not look like one. A plain
"additionalProperties: false" cannot be used here because it would also
reject the directly nested pin configuration nodes.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add additionalProperties
 v2: don't drop gpio-hog
 .../bindings/pinctrl/brcm,nsp-gpio.txt        |  80 ----------
 .../bindings/pinctrl/brcm,nsp-gpio.yaml       | 144 ++++++++++++++++++
 2 files changed, 144 insertions(+), 80 deletions(-)
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
index 000000000000..e5144da1bf57
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
@@ -0,0 +1,144 @@
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
+    additionalProperties: false
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
+  anyOf:
+    - $ref: '#/$defs/nsp-gpio-pinconf'
+    - not:
+        type: object
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

