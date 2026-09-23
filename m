Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791754B1BD
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 18:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189595; cv=none; b=NE/JUzLPHY18LgWuy34oYx6PFc8Xwik/F6aPu4qufwyyoFZu+uulwfi7gOgp9BgRjVICWxLfdvuNG+XboB144COuMCf/L2Jx620Flu7Od+3OcqjZvCmnSlZ+KCyCKPjrVVs5V/LzIx0NP8rIn4za5ZVWRVndwHTDaNwfk2c3R/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189595; c=relaxed/simple;
	bh=i0/Ud+/noGW0PP+lXUlJszcNgcaYYgaR+bLb+Qgf7ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQqLLtmMT/i+/v3QkALCSn5ZqhI8FtX0bzyUvfS7+sRj0elu9zdIEWrg9965fML5XIA4nzxEZnMoqq76l70cfu8qb3Vv8A2S252zYXYpcrr/RYCSMHOqa5ZKR1HiWzsOroJLvY5KRD9pXJ98zhwYKl9D1WrqbkLLqcHezDgYZmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbHDtCUw; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbHDtCUw"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300816so3555585ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 11:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790189588; x=1790794388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3s/MMajyZUTrt05y+Cn99bNu886D7Ka1lQx9ECIkJR0=;
        b=WbHDtCUw2L3kgZ0pElHJl+akmegSxjTlfnYWqd3HzpZNE9zviAj2ZdYZjxH5u+hMDy
         PASFJkgwWlIFv/lIix/SGwBTCLNxjks1rw0mcXpShRzz8G4nKqkpTJiR311yvR/M10l9
         ZLkowRd51YhOr0CWyjQM9X7OnltAI6x0tWeKjN3Cp1Rd06AsFix8TK/ysO33X38GkJcM
         TBYA5/dCrODZGrw9x+W9+IipuxRWr6RoaPKutfQxSUEgmqcZSiPS0Fdo83ZlaKgMAxl0
         ZyjjIJEXKXivPel5cDAtMz7mluBn+Fj0eUC6DuWZp1bdkPlmFM0AvKjNaeMzCKCcKXwx
         eT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189588; x=1790794388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3s/MMajyZUTrt05y+Cn99bNu886D7Ka1lQx9ECIkJR0=;
        b=ImzOa6sa5E9nPbqxjydunZACZdN91TvNanyesSVi9Mf05J0BP7dEgOnXO8TscxrRj8
         j4Ldg/9EdbGe3Z30Tby2Un2qk+XoDP4kT05GlieGBLA1ulTbJpQnGRdpgdXizERuhGD7
         yQ2ez1I0wliERqWc1PcEd59BZy9rLWWph6fNxGyBJ/eApGSWZNlLo/Jmz3PEEIjLMn7A
         xat4aC+Z/mnDsjZbBIvlT4Pcjrx3T1Fp/Npa57JZA0xDsYnNQxGHI1silEBtQupulqkj
         9LMSyqqV+UbCiZbd0Cy46XteQuGosOAi7hMwcvGflq+IelGnuxPDjYY2YMC0IPrQrwfm
         jCuA==
X-Forwarded-Encrypted: i=1; AKwUvByN3LUBYvWNsRsouQuG78US3fAaEcjLrYtkssO7rHemVnGgbwrI5rOdziJp9dWBh8+iKaUYSjE7is1a@vger.kernel.org
X-Gm-Message-State: AFuF++nYC5xUX/54tu4yp6MybRz6P6RoKsSjjluFJPl4R8UnTikj+c8y
	tRNm9hRxcRb0xWWhvG5Q20S0RginLK9ossyXYe9+1FgbIJo2lnnh0fY/
X-Gm-Gg: AYBFou2/nsR3BGNQkq9oLp1S0Qz+uC7XFCqY6oAZtDxmpIGvkjAdd5fHNpi3nq3pPGP
	y0SKssLltXTgyhF3vRtiphxxkvIuRQTXLtfHYnfYw/0HW/XI4rMzF8OTNwLnMT9m4ymn55S94VP
	yltK3MG61ED18qzcy01FpUcvK31ZsEHaPiq9JF4EN+zw2bVpGRaVmujAUdQhCmUC/nRmRyZRgRD
	01qig0V6s/sQyoqRApPLnq6nxqjmvSWZ9OXHdOtslhe9EQfngG3vx4RorGmbUOP/sOU4ZSMA19h
	bcO4jhzU3ibYMxRXIf8I+zDY7ExUgHFgfbCHHIV8/FSbNAAHIlrc/KHKhwzCB4FDqxBw/tWpQ9e
	mO1MVNxuMVSpbLhgHXfmhfTVSiOI6wt1fiQp/EBle29d2bnDdmMtwswOkoq1VenHmo52PsDEkxr
	wZrtfUg/c1hK2Q3NNnscD0QZ+k4I3JAdMS29bp3ucJh7al/02rdkmoTM/yVE74ft8v++ZVqFaLX
	Ehr5R7udUSOXtclcmXV4qtgG5/xQT6kKE28dF6NLmxHOCYupXEq8APp6ZD6fV8W3bgC4rW0oX2C
	8s934vLSj8z/WrRb02oIkwwqhOotC9XOo0n6YPy21iSZZCeOJcOJzLW9COs=
X-Received: by 2002:a17:90b:5183:b0:39e:6c68:fd96 with SMTP id 98e67ed59e1d1-3a098b98996mr35249a91.43.1790189588207;
        Wed, 23 Sep 2026 11:53:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm409335a91.12.2026.09.23.11.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:53:06 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: pinctrl: convert nsp-gpio binding
Date: Wed, 23 Sep 2026 11:53:05 -0700
Message-ID: <20260923185305.26223-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was
only documented in the legacy text binding, so dtbs_check reported
'failed to match any schema' for the gpio@20 node present in every
bcm958625 and related board DTS.

Convert Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
to a YAML schema and drop the text binding. Keep the existing
required and optional properties (reg, #gpio-cells, gpio-controller,
ngpios, and the optional interrupt/gpio-ranges support), including
the generic pinconf child nodes with pin bias and drive-strength.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/pinctrl/brcm,nsp-gpio.txt        |  80 --------------
 .../bindings/pinctrl/brcm,nsp-gpio.yaml       | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 80 deletions(-)
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
index 000000000000..9eb4a2a1f02f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
@@ -0,0 +1,101 @@
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
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties:
+      description: Pin configuration child nodes.
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+      additionalProperties: false
+
+      properties:
+        pins:
+          items:
+            pattern: '^gpio-'
+
+        bias-disable: true
+        bias-pull-up: true
+        bias-pull-down: true
+
+        drive-strength:
+          enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+      required:
+        - pins
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
+        led-pins {
+            led {
+                pins = "gpio-1";
+                bias-pull-up;
+            };
+        };
+    };
-- 
2.55.0

