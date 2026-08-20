Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A69343DA3C
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228777; cv=none; b=f90pGnCC6uJV8153DLUfFQvyfxkGDuZM4C+BBbotEMfeiFc4T5j1pQsRjJy/N6EUl+vARMromDH0sDuQB1YWA6HpTArgN/2ucShWM5ww1zpAHZx6YbbBsnC3X5/X516KVd40bbWJ5wdJfBJJoqQlyM057RRuMhEW7/zuRC0K5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228777; c=relaxed/simple;
	bh=/+AZg6hP2XDv78PWt241IT+LpSwJDBWfvUMImlV1iL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=di/JXskTCud4b+L4VAe1KA0bw2+h7EyAAyPChE+sOIdVnkjL93hvhxpMg1wb0A407YJummUgC6PIuuwuFVzeuEk8tnkPhihaFxCXHizif4DTzvN1IHokeGyzak0kHK6f18Sr0U9LwXFPpLhu4X+DETWMMNCBWTmw0CfuP7nU048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=me1PEY3L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="me1PEY3L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so25167395e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228774; x=1787833574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=me1PEY3LXNQ+5k5ACPPSCMZ8aEt02ld+qTfCGSAXCL87w5XoQQVHExqEuhCI7cXlfD
         IQIJc2rdFIyTVsqwY2+g8K4fJf6RoypNt/j99NU19Br2yjHFp8f0VPqJQuGArHjMIP3+
         B95xqv7QLUZPk9JDOqhwB1xBWPLdZbs4U2G9oO9zoTnAKCVXO6A5U+W1hU4OVYWGBRqV
         JB1j+gumbkzvt7iu5Xg8el5D3z9dJmcbR/JP2hRUiJXb/iawfiLa+KNgPRc6SuVZSSA6
         RUmu0mdOvr3sHwXy27e6T2K2r0ycN09R7RR2aEFN23kTqTSX2yuBrUfQssr9qUGkJ1Tk
         6i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228774; x=1787833574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=VCS5BNN04qGkHp9nvPSQYyAXlEqiLdWFFnp6GruppqfOHrwPNG9t7oMbsgjIMeHEDj
         h2WJdVwF5OuZ9QEDT2Z5HZvIR5ErwkxHOTuNe8ZE62tLLKVqsWq0zpa4C2VjnsFDuzLZ
         5ovXtm1ieFVVOukWuuWYzwpaZ+ChdxeX8su3ewu9J8cIDNRDEY7+19KG0HMfWRceL1lG
         clEhIkiAyQ3xafEwd7PJOOT6XjiMBrdH8tqkBFfUo1yehb0LgFBqKO1QJjnWM5fdFePb
         iE1JUEV/FA+sXj4Dvuuc4dTBq3xoaQMmh5etVJaVZ9KDb5w3Yjg4F0gpq7/nX3zwRhWN
         iTtA==
X-Forwarded-Encrypted: i=1; AHgh+RrD7nG8Eu2oI7GuzzU3zYaXTZdWo3Ya6GH3vS25l4T8F1S/yEg+7F+R+p1hhJinrGrpDbgVnvQ/PY8G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgda3VHEFiTcp2UUnz/zpcM4xa2LaZBqKS2gs9n4RLP2bbyRTb
	jwBTwb1yY0UKQjJ+HUE3WdQqr0r4URo35y1uQYUs/mULsbkcyR/sWJqH
X-Gm-Gg: AR+sD1347Bv5wqHLRUW5FYCthKbphkYckKlxwpkrFZ+suqXLUaLHA7NCSYUpB1IAYEu
	d+XvjMg0y+Fd/gQ+O1H8GXfCPqtUWW37aZmer9uDbk4nJNhJtBhZihuzi62+OwwNgImDB8eMCuq
	+nWjdH03x7RfIAUOZThKxS4qjwbLOnHoSd7oRLc5ySa4/JEGGmKXBzOkwclr/PV7BGJ5ZMXvJ/m
	alFRnalPWEj4g+Uh0mE9qJRWOA6mFBPQ697fXEe2kOdXxgfXe1q4wgSLZUXhc0fTRQy7g7LO2+l
	k+qLAT2K7PDsAGdnJjdw9qpHSjbVdp7oJBtWnKC3WR9N6NyfcQVFfgk2kzW036vSGdd4CnoDZS0
	2jh2j1cawONi/NP3KoqiLFztk7DKvgLaYNi4NYmVdFKnYhcHeiLXATjxw1GT832f/yMV7ViIABh
	MR5/SzwuoF2fUQcCwyNjSWxWErY7tTCEFtPgD57qAlPXhesczFDC44rQ==
X-Received: by 2002:a05:600c:8b27:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-499aa16a958mr242769715e9.8.1787228774181;
        Thu, 20 Aug 2026 05:26:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Thu, 20 Aug 2026 14:20:01 +0200
Message-ID: <20260820122242.120039-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
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
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
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
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
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
+        enum: [0, 2]
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

