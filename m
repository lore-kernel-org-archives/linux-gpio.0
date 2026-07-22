Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B886466AF2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738791; cv=none; b=WWPb/Mo3YCjkXxGCNgWJdoGQfSaitC4nCb09NrrShSb2RtqHZEa4R7cjzH2EDED0gPF+32RoKqDBJr7lCRuvIMAgNN9lE6Z6J5sCYJp/oTEHGJBXcXnEsirdsyyZSRSfIvJlnTteRX+z+9dXXh56ypd4i4nVoYieyTMXYBxYzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738791; c=relaxed/simple;
	bh=vbUaQgLr8MujYHQ5b5L4HHRWyH6HlD6i/56H/NwdBJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cu2sTah0MU4IQzvEx4ACLFDtHs52R8lrV4AxalDtdkBIKtgaP72k/Tf8i12xutEexJxvZFBf6YQTkRoI52RTuwa41H7qDFYQbi+WCKDVamjHRB/+TUin+35yMyhzQQj40xK6MJ/Vc++rs+jSpugQrLYmuqRVaYAb6s9Uzzfmo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHzi2CiE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHzi2CiE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso287a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784738779; x=1785343579; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ApRmu0hV+edA5zoSd0iaFk7vC5Xw6Ixw9nitS/yb1RY=;
        b=ZHzi2CiE1/64qqDMlsUpwOMG819T8JFLfKO6O9zILkfkrtGZjl8jOTqCFi/rxBFIQy
         7Og7yaf27dAVOujUX9JNMO9NTf9eqJvDseDxajc8Y+u7NCmO5BU07jWd627i14/dNhAl
         RpsbWZr5LPtNS60rC8s2qpggyNJWmitiNlnaee1APUni91E73BXojcgskzNj3YFDlVZb
         ih2XLiCNlZ3QkBPyHAbMGzN+Yu75V1IB6gGko7L+wyrdHsXrqDdpByGLZHt77ImEYl7C
         2ZfW9z5usxfu93KvYJGdWiRytn3OfP/wcrZ4NCqU8Z3hxs3HkLMKoqu7+xHV8YGfPGSm
         VYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738779; x=1785343579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ApRmu0hV+edA5zoSd0iaFk7vC5Xw6Ixw9nitS/yb1RY=;
        b=OIEjajWSjUdbsmpyLr/oHUUeevOLJSiGLpK9X7AhUk3WD0u1+w1uw/KkQiHwszDYPS
         osvzgSUP7OXEZ3naQ/rrrIe5ztRWofYNwhvRT52yrUasGnjMFsnQ//+KV1Dl25pM/qNJ
         TQ/o7Y9FbO71VTwSOQ8GCQYYDyTBvAk71xW1BKWSCFgSX9TZWEWFZLqTfkmMgJcnxLdZ
         etqCcd0+i60vMsqnB3mQRdbsaA5xd1MU9nagddiP5jN41g7rMHxmuPfKSRXgfR3YEEQi
         c4uUFO+mT+nX5s0oxR0eWeCt15KkeJst/y8+Qqmf2c9aWPEpgcoj3rjckwBgpppS4+98
         2jnQ==
X-Gm-Message-State: AOJu0YyGmY36O3/Q+BXw2n30Nurnb46Pq3y+YsdyYwvoPrjvBnji18p3
	6L5bxqFET5l4SjqlO7vBTo5X7TVomVqDgmuGBE0Cflw1B3oPRf9g+wqm
X-Gm-Gg: AR+sD11uokZYprqOqLyhyyQM7uRILmaI4hICaG1SCa+qHtCyJPbUdfZfUh8+M4j3inz
	2qvgnVatKSGGa0nv/kgoHuXL4aBCEaJQlDYKUy3A8jXbIgPGDYZY2+uyHHqUBHLFvLlr6cGspwP
	uTelzM+g3omK4ZhsGg6UMbrE8V8oKpU/GkU4ANWyCmAJNcR8n5GkGhgQPtlSpRb+ew9lfEz2DXc
	nUkLE0xpM+DAM8OxZ6ayDU5ETx7/Vgcum/jarP4MMvw7OtNaX7WAw3+jJOKQr19765MAyE6Ig1j
	zk474r6zHLP3yvPlBok9eFIw8k9v8y2A+NnpJ7RTUgdUpiZ6AiWQkpVDSmIEKgoqn0AsZb4QAdf
	29SJB960HB0b8NRNFj+aIWgUDCetESCUfrXySfkHuzik70AEmdmkhqOZpoGqRB45QnndyWUf4/A
	hqN/7+/7cpIYN7ScE=
X-Received: by 2002:a17:90b:390b:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e92a12cf3mr7370793a91.6.1784738779007;
        Wed, 22 Jul 2026 09:46:19 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:2944:6b74:18c8:3132:3887])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d12f267fdsm8075300c88.0.2026.07.22.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:46:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 22 Jul 2026 22:15:54 +0530
Subject: [PATCH v2] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03MQQqDMBCF4avIrJuSRDvSrrxHcRGSiQ6oKYlIR
 XL3ptJFl/+D9x2QKDIleFQHRNo4cVhK6EsFdjTLQIJdadBSo2wlipUFB0eT2YVG397R28ajh3J
 4RfL8PrFnX3rktIa4n/amvuuPUfU/symhxM1LdDXaxhjbDbPh6WrDDH3O+QNXsZBzpAAAAA==
X-Change-ID: 20260706-ti-iodelay-26f796fc4f6f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784738769; l=5450;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=vbUaQgLr8MujYHQ5b5L4HHRWyH6HlD6i/56H/NwdBJw=;
 b=rEU0i1BziL3CY0uUPYI8Q4A7fXhen3llw9rlXnVMuf5jobLvgA1LKrAKEhRW/j4d1pDbPTsxN
 ARQAzRBuqfIBuhpgREizy1wY8EY12fvT+WKr/JdFsQh8IupSn6DJdte
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI IODELAY controller from text to DT schema. Document child
properties missing from text bindings for proper validation.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add pinctrl-pin-array as required for child node
- Support generic child node that ends with _conf
- Link to v1: https://lore.kernel.org/r/20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com
---
 .../bindings/pinctrl/ti,dra7-iodelay.yaml          | 83 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/ti,iodelay.txt     | 47 ------------
 2 files changed, 83 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
new file mode 100644
index 000000000000..a798552c1ac2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,dra7-iodelay.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin configuration for TI IODELAY controller
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  TI dra7 based SoCs such as am57xx have a controller for setting the IO delay
+  for each pin. For most part the IO delay values are programmed by the
+  bootloader, but some pins need to be configured dynamically by the kernel such
+  as the MMC pins.
+
+properties:
+  compatible:
+    const: ti,dra7-iodelay
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pinctrl-cells':
+    const: 2
+
+patternProperties:
+  ^.*_conf$:
+    type: object
+    additionalProperties: false
+
+    properties:
+      pinctrl-pin-array:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An array of 32-bit integers defining the pin delay configuration.
+
+    required:
+      - pinctrl-pin-array
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - '#pinctrl-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/dra.h>
+
+    padconf@4844a000 {
+        compatible = "ti,dra7-iodelay";
+        reg = <0x4844a000 0x0d1c>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #pinctrl-cells = <2>;
+
+        mmc2_iodelay_3v3_conf {
+            pinctrl-pin-array = <
+            0x18c A_DELAY_PS(0) G_DELAY_PS(120) /* CFG_GPMC_A19_IN */
+            0x1a4 A_DELAY_PS(265) G_DELAY_PS(360) /* CFG_GPMC_A20_IN */
+            0x1b0 A_DELAY_PS(0) G_DELAY_PS(120) /* CFG_GPMC_A21_IN */
+            0x1bc A_DELAY_PS(0) G_DELAY_PS(120) /* CFG_GPMC_A22_IN */
+            0x1c8 A_DELAY_PS(287) G_DELAY_PS(420) /* CFG_GPMC_A23_IN */
+            0x1d4 A_DELAY_PS(144) G_DELAY_PS(240) /* CFG_GPMC_A24_IN */
+            0x1e0 A_DELAY_PS(0) G_DELAY_PS(0) /* CFG_GPMC_A25_IN */
+            0x1ec A_DELAY_PS(120) G_DELAY_PS(0) /* CFG_GPMC_A26_IN */
+            0x1f8 A_DELAY_PS(120) G_DELAY_PS(180) /* CFG_GPMC_A27_IN */
+            0x360 A_DELAY_PS(0) G_DELAY_PS(0) /* CFG_GPMC_CS1_IN */
+            >;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,iodelay.txt b/Documentation/devicetree/bindings/pinctrl/ti,iodelay.txt
deleted file mode 100644
index c3ed1232b6a3..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ti,iodelay.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Pin configuration for TI IODELAY controller
-
-TI dra7 based SoCs such as am57xx have a controller for setting the IO delay
-for each pin. For most part the IO delay values are programmed by the bootloader,
-but some pins need to be configured dynamically by the kernel such as the
-MMC pins.
-
-Required Properties:
-
-  - compatible: Must be "ti,dra7-iodelay"
-  - reg: Base address and length of the memory resource used
-  - #address-cells: Number of address cells
-  - #size-cells: Size of cells
-  - #pinctrl-cells: Number of pinctrl cells, must be 2. See also
-    Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example
--------
-
-In the SoC specific dtsi file:
-
-	dra7_iodelay_core: padconf@4844a000 {
-		compatible = "ti,dra7-iodelay";
-		reg = <0x4844a000 0x0d1c>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#pinctrl-cells = <2>;
-	};
-
-In board-specific file:
-
-&dra7_iodelay_core {
-	mmc2_iodelay_3v3_conf: mmc2_iodelay_3v3_conf {
-		pinctrl-pin-array = <
-		0x18c A_DELAY_PS(0) G_DELAY_PS(120)	/* CFG_GPMC_A19_IN */
-		0x1a4 A_DELAY_PS(265) G_DELAY_PS(360)	/* CFG_GPMC_A20_IN */
-		0x1b0 A_DELAY_PS(0) G_DELAY_PS(120)	/* CFG_GPMC_A21_IN */
-		0x1bc A_DELAY_PS(0) G_DELAY_PS(120)	/* CFG_GPMC_A22_IN */
-		0x1c8 A_DELAY_PS(287) G_DELAY_PS(420)	/* CFG_GPMC_A23_IN */
-		0x1d4 A_DELAY_PS(144) G_DELAY_PS(240)	/* CFG_GPMC_A24_IN */
-		0x1e0 A_DELAY_PS(0) G_DELAY_PS(0)	/* CFG_GPMC_A25_IN */
-		0x1ec A_DELAY_PS(120) G_DELAY_PS(0)	/* CFG_GPMC_A26_IN */
-		0x1f8 A_DELAY_PS(120) G_DELAY_PS(180)	/* CFG_GPMC_A27_IN */
-		0x360 A_DELAY_PS(0) G_DELAY_PS(0)	/* CFG_GPMC_CS1_IN */
-		>;
-	};
-};

---
base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
change-id: 20260706-ti-iodelay-26f796fc4f6f

Best regards,
-- 
Bhargav

