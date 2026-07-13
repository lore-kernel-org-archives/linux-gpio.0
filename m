Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8192441A6
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946598; cv=none; b=ITia/QuoMSUV8GrYj7NfnRsgrUKaqlous+ZljBSqTd1A9La/adrnF2arjJPWFA9uQeNi+79YsZkU+nuUSpMapZpGtLqi4p3Z0TWEu+w3wvcA/J2pfclDEZZppLux5KMvyK7gchr+8nSS5yVlHOrdY1jPzUjjV/keuTGWHF3Af5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946598; c=relaxed/simple;
	bh=CEpKfsyg1Tl3SeFdN8fnBQI+KQ/x6gXRgjkpeD0m8Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hHjY+ASA3B1rHg/Mqar+VI2qhU+mI/uMj8K6G98QNlbAek/geuuCWGvlwK0sSqH5NYOkyXaVoJaF9WqiBbcCekF2NCTQkkW7VrYEyMGYW0HYFZp0u+pQZsm1H1CAx3JEg/+amYqcSmpXYBSka98ndhjSAHvNxu66N65dsyNPSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq71VKox; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq71VKox"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so221804a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783946596; x=1784551396; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AmGigREwFUDRKnrZJH2JhdOBNjH+to7SqwWlffJ4Rh0=;
        b=iq71VKoxNGcwUZlUcsyAT2B8yYBX4pnXHeHD0FIENI6Nc9/OWtmeB+T16MebK8NuVM
         Ho4jLWvZ+pSLiiKfOMsv9h483VdWtEEW+IpnUC+k9lCMrYdSLQ13cqFzshnmIeVl/zMK
         Xn6i9dtcmYMmSjSg1GfPyOsqf7vNIF67KJcYn5QQsd8Sx0RIvZx5eAxDMbQ++LWMQNbF
         3y5B+I0fVtnQF/MNVq1IJz641+6ktXlvwhSUPz1IZpO99h3bX/nr7qCkHRiLE41uyFj6
         uEIEv1H7i2k0bvBjb6BRKVXpPM5J9khvAK/hhWzDeYq5rQit0gbnPXbkYgcybUoFF51S
         FFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946596; x=1784551396;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AmGigREwFUDRKnrZJH2JhdOBNjH+to7SqwWlffJ4Rh0=;
        b=A1/h+Tmowc9xEREQ2gU5LI3HKYIcC1qvzHDIkf6tlWk3AL4DiG69QNv90oBBIsI2UT
         zJiNBwb8c+Zrqeki5FZo8DekjOkRFQABbThpFHpDZGJOzPRz7zg3kGEPzXgHz3fDwZk+
         nr/cPjGzQuV5yORtNo/o9mOyxUkdndaxxXHCe+2RHrW6mjwVhhwq4eFiIqwh/62u07Na
         nuMMAJtPjpqTz5gP/LyDzcs+4dprDVHZsIyuyzcqtBbMu3PmGPnbZmz1pScqVNwBr1uC
         Nlz/sovSd12HnbWg7NkDpWVnXmqbUkDcs+Gd4EefoCwzZ08E9h8eW74hDO/fr5vfyEQm
         3Dmw==
X-Gm-Message-State: AOJu0YwAeV13Mdk8plzbv+DBSKSzj+bQ3SAE4xDlzap/w5jGBMRD2v1v
	/4cZsFiyNkmHmaYjRs19cmMkL8CjkO2/YJBRpwuXd7I7VKjsbxehkjfX63OPHg==
X-Gm-Gg: AfdE7cmui9sK2XEqDjODcY4zbpRXRnG1hs9vBGt9ZQxKIkIf5z5nRuMqKzUjGtcVf6n
	HlHEWOp1VRQU5/QPpueod+C8tYMyRBvRb4BA97kBZ6otF06Ls/Sdapu4A+1xpNoQuLKDXDfjQe0
	apLlwdQYX5rKQC6MVAedSJpVM/kC2YIzSXBPkivRfXg24uGcNSlXMeA39EwYU81KIJZ7Mc0NW8L
	yIyX1dSvpG9oSInnaK+h9x0Z3L5VWYWfspkRoAALlgTI7rXm7dvawFMExPXoS0CNXvtjRCXZf7b
	QBtbDY/oydN/1O/8/lN6/litCnx4xzACS4ocrZO1sIA01n6lt9BngOI5c2zR+56ABPEMxC8icTm
	6yf6pBmxIQmu4BmApCvsbeXmv3Lz6YyDYvxtoQKMzB/rGsMxyyeYocf+RZO5nPbiLuJMqRH7RzY
	Ii9yHYSyRmDgcpTLRQU92MGQ==
X-Received: by 2002:a17:90b:51cc:b0:381:6cf0:d5f5 with SMTP id 98e67ed59e1d1-38dc780f503mr7033696a91.5.1783946596463;
        Mon, 13 Jul 2026 05:43:16 -0700 (PDT)
Received: from [192.168.1.2] ([2401:4900:881f:4446:b692:9244:2734:87f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28219139eec.23.2026.07.13.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:43:16 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 13 Jul 2026 18:12:59 +0530
Subject: [PATCH] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMz3ZJM3cz8lNScxEpdI7M0c0uztGSTNLM0JaCGgqLUtMwKsGHRsbW
 1AKQaNXhcAAAA
X-Change-ID: 20260706-ti-iodelay-26f796fc4f6f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783946592; l=5158;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=CEpKfsyg1Tl3SeFdN8fnBQI+KQ/x6gXRgjkpeD0m8Xs=;
 b=IRLIDsFRi7FQ1RUdvOYAiQYLKaTDrlPSIJpsjsiLTq/R0zLehPKs0XyIqGD1ZRYtySDFiTkYR
 U3G6qBouEZHB6KKkd5j+tp2bHeWzDi0a2xgyOZVmUrnlPSMCVTRTMVS
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI IODELAY controller from text to DT schema. Document child
properties missing from text bindings for proper validation.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/pinctrl/ti,dra7-iodelay.yaml          | 78 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/ti,iodelay.txt     | 47 -------------
 2 files changed, 78 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
new file mode 100644
index 000000000000..a399946ae817
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,dra7-iodelay.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin configuration for TI IODELAY controller
+
+maintainers:
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
+  ^mmc.*_conf$:
+    type: object
+    additionalProperties: false
+    properties:
+      pinctrl-pin-array:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An array of 32-bit integers defining the pin delay configuration.
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

