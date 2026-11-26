Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716203;
	b=Dq7eIKLO0lhjRTP411U0KdMOXANNcSqLIcbB/4Fn8d5xMh8PBNPR4TdaL+wsikGFh+GW
	 2gfNqIDFAPRKR6ViflQc1WT7QZIUm6t+VSyoZOANgJYstYvSsKqeGUYFy/VpKihcmf6hn
	 2C1TbiTmdnVbo4iEYYXe9xdnzbJHzqobCMJtLq030YL6iPt0UjmkAR+T+pQU/smMev0tR
	 p/7yLL2DdIQQa4rdgMzX1ZtO2ejjqljkhEyQhXIl7d+4CAmeKY9UX/0WXpRExpa3z6tbz
	 LkjPQ7QINwMpjKP0XhNYvNyf6JwkX03vR4ehCStO0bFLaOGFoRmKBcSLdUVuVmoW7KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I9bKQN8g3f7XpsfQpR52IE9Iq4xxM0LX7R6BIa4pL78=;
	b=2ivXX77bLXblYHjI0MbR5WqQbAb8lIBup77cMQclhSV/vAovXqCsm/I2kADrmIFwMKom
	 lfsKFxnUZ+WSeOB8+hCR2aeGFIOoFHUlZ+myiXzfDHN/ntDW6+hPL8ROc4QgcndTtRvVW
	 kJluXbsgf2YDJhE4DqMPbtgaYepi39LXpnJwGh3CvWRc8CgfEyK1DJzWx9f5JZMHxWJ/x
	 Kc24jHiL3UeXvBJsVTpCw7HCDhmj94QSHOak+RqUEAQ6yn6L12DrTCw1Tklwmcc5ad6Ib
	 9PRAu3t6jG36JOLiZKiCXY0p+sl1A2Rwdie6ujqALTkJwCzFwiDvRDtrWF41siS0EZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GA9pe8S2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07235606A33E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 18:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07235606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GA9pe8S2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso39447765e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716201; x=1796321001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9bKQN8g3f7XpsfQpR52IE9Iq4xxM0LX7R6BIa4pL78=;
        b=GA9pe8S2GnC2F9xZxNvpyr3BF1l710P69sQAM8eV8RHAmUzz3h7DIOO1BnTBrqyebp
         qsW763nIsa+a4QUUbmXmH3KGue/E32NVP6N86kgmBhmXdSDBUOV1WmwotGvVcPWZAP/u
         2yGOUT48umXJSU2UKSu0xyL52V1imrCU5m5+uZ5WLDBO/nP1wMdmQQgd/kdpLvIjwBtQ
         QHl5btH4TrGYZieaoT/WSsswgT4iAlJI5kIB18CFta6sZR67m3mlrdHiXQMYQTEkkcJp
         KUE91ziprHVtE2dkZcEe/hA4lOzrI5qUnLbAgkfOljzroSHeLsfCiT6J5LzRUfYfTNg6
         g8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716201; x=1796321001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9bKQN8g3f7XpsfQpR52IE9Iq4xxM0LX7R6BIa4pL78=;
        b=txhVsAIa4SRBQ25xekUIz+wpsgW4G/BuSlt4og7qwW90zTqQo5m83ZoFIiU3izTMk9
         jutV3ul2m+ad5btLY8ZVBOEbWnTuGtrmcG0AbvHHpw+y134II1TPzJXsQliDv/FCsirS
         78sCcAG9o9qcGydhAj+Zgvg+QjgAgNlS1ImpL9aXS4EN/eT8cPRTA7bjyF2zubxXxcjf
         fjhC6xjLpmGfBS6tav3hYNsQa6AI47pIrVqeq1q5j1XiQ5kWHYYaT5Z8E0unegNHx+wa
         UhztoHR7u7/V3bvlezmDUFG6uaFpM8B//jBzihI/huI5AKhnY5PsYcAwsxe/RwGuDiG1
         yuqw==
X-Forwarded-Encrypted: i=1; AL+hErGmGxcoVpUDIPpdr7kPuhQY4SOWz6Ec5ZKUF9R8Qv6pZLVceU3heuXcET4l90w4YLNI11j/tuXtUoFU@vger.kernel.org
X-Gm-Message-State: APuU4Z+HfupwpWPllwNhS5WEW+X1oDvP2OlMNhiMvcLAs9QGq7gwTHJq
	7m4wMzw/XHuz/Awoz9206PaaKT2Q2bRI22UrdKRJF9pmSWiMlANbzeg=
X-Gm-Gg: AZFdTZfKp2p7VAvGw8ZLUUIqino+SP78/Z3H6Liu4m68Qux+q2/Y1w707Az18WnpPV6
	fdlFwDnOjU800stL5/713i6O+EJBXHDW7wXFiMA948K6kvKeI7GzKvoDOcYNByP25DQqe1yBgrE
	oxH1cV8jO0CBMMoWAvkLPhtiiQhU6smK3dLXcVbrL4IhExCLhxJaFhDo0SG/MDGSKrsbcmRirqv
	b3++cVRDvVP8OeFA/Nneg94IdiDsTXDDXbmVIF3l+Luv4rzrNz2Uo7YtcCAkKVecfpL4o1J2g6o
	ucoznmKcNZkXR+2A16jIv5beyrXCbecfAN4HuogCIM7tQurQsV425zqbG6rwlihstAGr7CoulC5
	u+acQ41io8Hqith79DVl4Q96QusT8BQz1bD0sVnfdnqziJFCZR7VzyTVZTKnHc/8Piw2G0K271C
	tHMmPRhWWPYjaY/5GO0Q4r1uAFwWbf2yWbD+wapqfw3pI5BnKlCz+la7sakDhlJJqs+ZGtMUXD8
	Lrh1NQzccn+/5VeULPNFxtT+k4JgyMtUK+N+ZwuKuyu6mlJDEp+O483f6zpKVM28drSzHWChqIH
	bcFHuV6cuBUm3gaJgJrhklLAUybBhEe61OGXPr5s+Pf4DeNXEvWvtAmrFdXWODHu63zTY4b+fYv
	U0IRDiYqgI8itlWC1jOW0WQabPBXZGtmcwrBcB87NNGHBfNU2ZwjbYf0BzFA=
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr454614305e9.15.1795716201307;
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 2/5] dt-bindings: gpio: Split fcs,fxl6408 from trivial-gpio and add diodes,pi4ioe5v6408
Date: Thu, 26 Nov 2026 19:03:12 +0100
Message-Id: <20261126180315.98034-3-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fairchild FXL6408 and its pin- and register-compatible second source
Diodes Incorporated PI4IOE5V6408 provide an active-low hardware reset
input, dual power rails (I2C bus and GPIO port bank), and an open-drain
interrupt output.

Move fcs,fxl6408 out of trivial-gpio.yaml back into a dedicated schema
to document reset-gpios, power supplies, and interrupt controller
properties, and add the diodes,pi4ioe5v6408 compatible with fallback to
fcs,fxl6408.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 .../devicetree/bindings/gpio/fcs,fxl6408.yaml | 97 +++++++++++++++++++
 .../bindings/gpio/trivial-gpio.yaml           |  1 -
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
new file mode 100644
index 0000000000000..5977aa026ec14
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/fcs,fxl6408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fairchild FXL6408 I2C GPIO Expander
+
+maintainers:
+  - Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: diodes,pi4ioe5v6408
+          - const: fcs,fxl6408
+      - const: fcs,fxl6408
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 8
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low GPIO connected to the RESET pin.
+
+  vcc-supply:
+    description: I2C-bus interface power supply (VCC / VDD(I2C_bus)).
+
+  vddio-supply:
+    description: GPIO port power supply (VDDIO / VDD(P)).
+
+  wakeup-source: true
+
+dependencies:
+  interrupt-controller: [ interrupts ]
+  "#interrupt-cells": [ interrupt-controller ]
+  wakeup-source: [ interrupts ]
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@43 {
+            compatible = "diodes,pi4ioe5v6408", "fcs,fxl6408";
+            reg = <0x43>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+            vcc-supply = <&reg_1v8>;
+            vddio-supply = <&reg_3v3>;
+            gpio-line-names = "Wi-Fi_W_DISABLE", "Wi-Fi_WKUP_WLAN",
+                              "PWR_EN_+V3.3_WiFi_N", "PCIe_REF_CLK_EN",
+                              "USB_RESET_N", "USB_BYPASS_N", "Wi-Fi_PDn",
+                              "Wi-Fi_WKUP_BT";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index fe9b14a72d698..aca42dd1ad20a 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -21,7 +21,6 @@ properties:
           - cirrus,ep7209-gpio
           - cznic,moxtet-gpio
           - dlg,slg7xl45106
-          - fcs,fxl6408
           - fsl,ls1046aqds-fpga-gpio-stat-pres2
           - fsl,lx2160ardb-fpga-gpio-sfp
           - gateworks,pld-gpio
-- 
2.25.1

