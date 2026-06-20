Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71334250D
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985693; cv=none; b=I/kbxJdYfBmrFoggukkqQykPPjkapH4jUHnKOIBlUIr6Q6l5Mee+71nEvF+LrnaGHTNweCasWmIGKdAhnVShqkSvuiDS4PpR4PN0N/NphbkTcD6rhxkY5m50LNdDs080+2K5FxDytJmdvmUBJwF3SH8dVRJMuEMmfxXzVgMmHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985693; c=relaxed/simple;
	bh=lUssnadtXFpcswpoeo6viSrsHtSq9oHAKwST+vFL/dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdgyPMvzxZRKN/4gf5pTA6/0Xjdkc2T+fY2OPZrr6PCsHxKbwrUHnJ+pqI7PomAHYmcwprgIFNsxLnq2pJcmYn/sjCKjdNeE/THW2dX1K+ZAHHpijnv7gR6AQRISAfAXgCCN1Pa2uRNfQ2iGXB6Xd5zLa47yr3hLk3qB9Uju7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP19vjBn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP19vjBn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so26815525e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985689; x=1782590489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxe0F21akykBChd9b7ZIMr9bfYgwXWJeztqohM0WWO0=;
        b=HP19vjBnuPNKU7Et25wj8hUQmMzSTdi4gnPtj/usgm8i5OQ+y2c76tPt1sfN1JV7Fq
         KMwZ+ePQ2Tu/X8wZqDyCCjNNtDS6pixpjsoGeNC7TwxL4AWuU4993JyzGZ33trVXIXok
         +XUEcKlHttdWsfFvsZytP8XOH2tdpwtSOO9jYg4tv3/YuxnNHpQbZ3PVa8KXZBTLOdgp
         GQvcNmgmHxZ8KIMefTBXfzihfuNKx35eKpU/wZwAId+QjvIE9aFbSRyscVvmBP4nrlXx
         zNeG3/qsMalaRm6ejUGw2tuCPJbM+5/9mDkKXEV7m8hBoJaAu/DynutXB5uicjtqVX+k
         Gy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985689; x=1782590489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxe0F21akykBChd9b7ZIMr9bfYgwXWJeztqohM0WWO0=;
        b=h+x+OHRb8JJDK7paXO+IuHxztUrTMIY2tcJyK3SxpKAQO/Ml1duEQ6zJhdc3LlCKKt
         OOAVlDHzx7auNZrkmy46QyHkx2yDETcQRgdeOW6H3jkQHrHJ+hamrZBfeZdYXJu9Tw17
         NcQZfBgG0VdHQ5JRtp3vVrQR74d4rme0T3JgREE83j6o3bN+CurW2XLbt1yH5NwWWr9j
         aRb0Q7xIPxQci5GArvoS44xss1s9x/RrBDsWZVt650JyLBRsJj6xRnsDw2YD9InaMMYx
         Q28V2wh+PjDU5nbJ5ytD2SQYmbVeseubp3GiFelc/LA8Y4DEa+qEUKvh7eN8zRzaHaNt
         lhzg==
X-Forwarded-Encrypted: i=1; AFNElJ87fzOsIabPYEHMx4QTzppWntlwt0619YGMHQ1wt7oluw/bfwkQ+hBcC8RYhHFxDGouunyjL18qp7lT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OnKQChhAnbz1j3V3P9FOrfeXco88UhQkdqVRIgmXI/J0Zp4r
	AvLZTLtKV5XsfwC9EEgMxccHXzuuZIFACGEEQsNxTVV/ptgmNya4LXdk
X-Gm-Gg: AfdE7clM8fPYW9fIfT7xJtTyiF8dUgAd5tstBVamMinzlA83iiYeJTy3J/b+1IhgK9r
	7HA0lhfnpRZ0J88orR/ltiFFDbaW4vPIPic/mvcOdYOhcIbMRIAO5tRuzW18oLrprltQe8KG1Q3
	zPbON07fbs/wPXFQhjoOUMusfll7Dm8r/+k1Z3peK1HgKGoIHtymCBkjosmj6lIM3zl08dyJd6u
	H8OXq2aA+2j0n3JQhBA2ufeBl02VYyNb9khiIoXM5qEj5vHgLkxwnfBwh+G1jSBS9ImtchVAft7
	zLOdNf+muQ13kooCNnT8KRD0JyY33I/TjwP4No7+vSjr6e0JYwkxONtiZwILe6xS8e1oDpJWt+v
	llXZnE5JACu0Ef2aAlZvyRTWxV1ETcjr7JJXo5gPGEgvatcKfBYiaJ4O3ETeuORUBF/TVeWSGWe
	FgO3qppPuTDjH3y8Py
X-Received: by 2002:a05:600c:a43:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4923ef47dcdmr159838425e9.2.1781985689314;
        Sat, 20 Jun 2026 13:01:29 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:01:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Sat, 20 Jun 2026 21:56:49 +0200
Message-ID: <20260620200032.334192-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 118 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..f3d5a3498d18
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        maxItems: 1
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        maxItems: 1
+
+  "^v(cama|dig18)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0

