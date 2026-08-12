Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B79423E9B
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530993; cv=none; b=ZKh6pVn4GRwrJS5ZKmg3ymMoKrCtFUSywj4cxhx3tbM9qusWgRBegBCGPfMQ/keCbbFxN4Iv6LI8USm6DDFPCZYTmDaRnrekYbgfh5WC8JuV5W7ZXOVJymCSmoN32PrKaEHGRkV/V//+KV/qTvJZUMNowmYpzNwpWf2chqRwI9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530993; c=relaxed/simple;
	bh=sClagvUmiT6O7bZETDOYfatHR0ft7cNK5RMWLl0HUkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8BhD7KRlBoA1uX4FR0Mj+gKJ+eZnx21bweC9zyTWl7jaPJ/qpoemzzqXbZ9dmHdu11jaGek89zOwBdRGBVUvFYtiiZKdfELGvxCWNTg4kcyduLmfcHlY3A+Ygx6TVXlfAkV894heo0dklM6Ev1IxVbjknG+J3gn5Q0UaMI6c5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANQLT/MO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANQLT/MO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so8901565e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786530990; x=1787135790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzmJJY1tPn+fmrketi6Y7iKwO+sxC2jcdTbCz1Vr//0=;
        b=ANQLT/MOCYWpNgnMRaHiZSq8jwJFnNDNuPHnokm8r/NHfVaRQabzaMwB9XRBlW+5bW
         D6mGEEj7y9Z/nlW9qKbDq63LtH/PYeRBYsUcsDwxI0EXXEE/kz7u22SqzGvyEw9sMG5R
         5Bqe6DWnxoNd+3K9hau35kOHscTgo2Pp8PY14D51h46nGW+pQBezRPBBXDgzA7r6DxMB
         ES1YDpSb+QxsvAHtlfkn1bjWEY+mzGRFkmi38nknHBxG2HssC3ygiDT77+/z8SQ1SXTj
         bj5JHQsOegHyPKNEUMkppwzWtjvkwtSZ3QtkyhwTNpaf4nf/Qx+uYAQ3EM/ZOfyqzffK
         fyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530990; x=1787135790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzmJJY1tPn+fmrketi6Y7iKwO+sxC2jcdTbCz1Vr//0=;
        b=AxCLSRU/BLLEOybGguDBd1LMZNfBjvSTXQz97WOY35myHpbUBkyrTmOxVRL5mt0QxY
         tmaEwd+pEqodnGdMrHpBfrtM0Ad5cNpdYVwPvSxycefCXqPRNPZcBuiQQt6FLncfuSE+
         0SAmeGVnCVa3KKj/p34B0U2FjLDhYa6GequPJ+ZCO9a+u8XuvlPbqIjvbhZKZJpefywk
         CaCWAbdStxZ/kSFLYpuwmjDy9EHZgjpim0BuZvkdK9TlP/o8NZ1K9XiPlfMssDWhcmxe
         leX4PY2hFUtiuLCj0yd871Hfb22V05k1zsKjpiMZibCfy45Q0jwhzWAE9AhA975/sdEq
         tBvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4CMvQ4Iykq18oIccl1zpa6u1Y4dc9TR/vjcoqNWJrBifWU9F3+bpsI6VrlU8mGt2n9R1RRwlzJDIC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw65nQKho/ms36HkHc2cgmmqg32n4GqgbfOEDoTDr6SR8U0KKlB
	jfIsaMeOzVc11KVlcBRUofkdZGAkue3cPWJ83uJ9a0jpes/zGi0iaBKw
X-Gm-Gg: AR+sD127I/HYMTogV+O+tcU54tExwgFiU9Qm4Wmg1bzBsqkqotxDl2y2YLvo3YJima4
	IoO1rDyp8u4UrlFQsY9cwD/q75ZBiXiN8QSaUmerSSUe0ESKKLEBAId65txVx4X9ul7C6kZ7Lnc
	SMRklrQO84eO3Q4BbGOavZk7FrVAJI0zg33hMoybSfH+0Zy6sUQ1tS3AwlsPkAHcT4CE/U3Aliu
	EZx2xr6zctP/YHzGTurc7xb3ztWt+/hvNi5OH0d9bI1E7LJEpm9VdpSKD93e/pkquOw75o050/S
	5dFHTtwH7gjlbDVLVaGAT8Nb99fdHC/s78/Qeghqmu+fsN+kgl3L9iWsw+5qRvAkiYTZ9Xjhz5Z
	4I1Y3p2xa/EN5AVGYsOBN3HueRCYWxSdGJFpGR8Fhauh13TfvP1G/IuNWQyLjesU7/KcmfeL+9Y
	hj1UUyMp7i0xlgNxST9bexj1dBAS+huf1ch12EKlajsCZVCEl+VN1aIE/yGb82iLfAGYGQh6fHv
	77WjCjsnqzJiihN79yUzNdh3VxeZVE=
X-Received: by 2002:a05:600c:2e11:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4997c0e2ba9mr30935055e9.6.1786530990191;
        Wed, 12 Aug 2026 03:36:30 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm100146855e9.7.2026.08.12.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:36:29 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v3] dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema
Date: Wed, 12 Aug 2026 10:36:21 +0000
Message-ID: <20260812103621.1096140-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
controller bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v3:
- Restricted the pin group node names to 'disable', 'pull-up' and
  'pull-down'.
- Switched the pin group nodes to 'additionalProperties: false' since
  all of the valid properties are listed.

Changes in v2:
- Excluded the 'phandle' property from the pin group node pattern so
  it is no longer validated as a pin configuration node. This fixes
  the 'make dt_binding_check' failure.

Link to v2: https://lore.kernel.org/all/20260811111023.721262-1-egbostina@gmail.com/
Link to v1: https://lore.kernel.org/all/20260811092057.687155-1-egbostina@gmail.com/

 .../bindings/pinctrl/ti,da850-pupd.txt        | 55 --------------
 .../bindings/pinctrl/ti,da850-pupd.yaml       | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
deleted file mode 100644
index 7f2980567c9f..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Pin configuration for TI DA850/OMAP-L138/AM18x
-
-These SoCs have a separate controller for setting bias (internal pullup/down).
-Bias can only be selected for groups rather than individual pins.
-
-Required Properties:
-
-  - compatible: Must be "ti,da850-pupd"
-  - reg: Base address and length of the memory resource used by the pullup/down
-    controller hardware module.
-
-The controller node also acts as a container for pin group configuration nodes.
-The names of these groups are ignored.
-
-Pin Group Node Properties:
-
-- groups: An array of strings, each string containing the name of a pin group.
-          Valid names are "cp0".."cp31".
-
-The pin configuration parameters use the generic pinconf bindings defined in
-pinctrl-bindings.txt in this directory. The supported parameters are
-bias-disable, bias-pull-up, bias-pull-down.
-
-
-Example
--------
-
-In common dtsi file:
-
-	pinconf: pin-controller@22c00c {
-		compatible = "ti,da850-pupd";
-		reg = <0x22c00c 0x8>;
-	};
-
-In board-specific file:
-
-	&pinconf {
-		pinctrl-0 = <&pinconf_bias_groups>;
-		pinctrl-names = "default";
-
-		pinconf_bias_groups: bias-groups {
-			pull-up {
-				groups = "cp30", "cp31";
-				bias-pull-up;
-			};
-			pull-down {
-				groups = "cp29", "cp28";
-				bias-pull-down;
-			};
-			disable {
-				groups = "cp27", "cp26";
-				bias-disable;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
new file mode 100644
index 000000000000..21d439e08d4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DA850/OMAP-L138/AM18x Pin Configuration
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  These SoCs have a separate controller for setting bias (internal pullup/down).
+  Bias can only be selected for groups rather than individual pins.
+  The controller node also acts as a container for pin group configuration nodes.
+  The names of these groups are ignored.
+
+properties:
+  compatible:
+    const: ti,da850-pupd
+
+  reg:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-names: true
+
+patternProperties:
+  "-groups$":
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^(disable|pull-(up|down))$":
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+        properties:
+          groups:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description: An array of strings containing the name of a pin group.
+            items:
+              pattern: "^cp([0-9]|[1-2][0-9]|3[0-1])$"
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinconf: pin-controller@22c00c {
+        compatible = "ti,da850-pupd";
+        reg = <0x22c00c 0x8>;
+        pinctrl-0 = <&pinconf_bias_groups>;
+        pinctrl-names = "default";
+
+        pinconf_bias_groups: bias-groups {
+            pull-up {
+                groups = "cp30", "cp31";
+                bias-pull-up;
+            };
+            pull-down {
+                groups = "cp29", "cp28";
+                bias-pull-down;
+            };
+            disable {
+                groups = "cp27", "cp26";
+                bias-disable;
+            };
+        };
+    };
-- 
2.43.0

