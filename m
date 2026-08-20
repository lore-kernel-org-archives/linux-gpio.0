Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D943F0BD
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228754; cv=none; b=IlXj7PiTNbka2rErvjcgnFg58JdQC2HluSRBH2OdOYc6xCmCuaRLJyp2O0FDjna9ELOvBOomZJsolgrcZWI4bxlE0jom972BF74IKfvY1FRzygedaOFQYmTK5Ftkp3CxxFXvMyyNPq/899XDhDY+xN7NQtl2EpLYIcpoCVRM0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228754; c=relaxed/simple;
	bh=tfTNd5tjFz9L3yETKktoI1guJcDo130AJeYFbFp3xqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDux4UbXM5K9UUWtSuQTb9nPsIkl34tX4Xrn/kNj/K934iF03AT+Ak+aSdWJQ6kvOofHXy4jdDNrSnxNeKsnJfMOIpP1VIG7GelQ9F8uJQ4y2fdrcsMYI9A35P7A7AknMmWZzDpX/vvqlQwcNe4RF6XYTbWYTYBmNZYpjofQXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgVMhno2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgVMhno2"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1455943f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228751; x=1787833551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=ZgVMhno2QaNMwLTiXdlwRcP/jtOJCaZCd7Iq0fuJE4H6TWjFuU0hVw59yXw7Qdt4Kt
         S45NpwNWnJDNg3FSH4PLkpXXgDanX+lz4MGe58L4pb+heCVmNhYntVPgZvYGJFNMVWGK
         QTMweDWNVXOoTXzS2wXSN2wc9DJNVdZL0qNb1TRoQOzaoS74MjAPYwxrjYZPStCdpLp7
         0nJB3Djw+3YyGt5gszqeKZ2ucxWX4gsJzP9/Debv0W21kQ6f9fXSHeRdjyKxCBfHjhdL
         NCvBrrhEx4hAQ1QPrYn3xAAEXealQwY2WbcbSy/HUA+d7YRUgHonTls1LkOHxQxpLbL+
         4qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228751; x=1787833551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=NcuYG+s5/rlLnyl5NtvRnTikogMgZlCQEId5EKqLVRpb5Dh9GflSvTcg/71GDMPK7r
         Hr0wnDiIL3PHHEJw2LE6hXO9/wz4koIxLGbA2llhZJ1MIt+7iY5Q/zvMbKwHfD6n+fNN
         ztNr0zU5CiPEMhZOWJLw2u9yV0fQfPKnsCdV7VomFASodSHg9a8tTh1AZdv7D5MIgcXP
         Vvni4ceXd+NbudRwIoMDrodUHDWeG36fUO2crbBi40XJ7rT0QS9EhsosSKMSR7NWudTQ
         j9uBIqwQitdb1ixj1eVqKiDQU7vLxC+TUiadoLRPAoTGUP4LazEGa84ZwqTIaqjeUFdM
         HgiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbtIYI+KOiqkvqIvLLIygCZfvh80Zn9zyCSf12FrI9O/GK+wfF0TQF/zJ44cUaJl4n1YAJ8pILR5u/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3wXkbW5bF8h+l/8lRm/Ksz51mguEhtJW4pSGm+YQd6FSugKe
	db3zcBZdJQ50bSd59Qr9aC2oXcijj1D6UuCYrJ0AqR60i4kLNOpKtZge
X-Gm-Gg: AR+sD11mLIAuncvnXu98rt2j9New/VD7lTNJinuIh2g0h4H2hZ0Y2YHoiIcvsdYPY/o
	dZ2dab36kdjAxSrGy9dFtVnc9ejabR/1LbgniR0k/+LTTFLaRgPoshbVJaZjNWgKtz5QaEwznmA
	iEMtfeTRAEHnYJpzisIXI2xTlPaKq/SIuqEbkreu/SDvUBQcxZKEi8hG+U9ieGsQiYUAUC/pdu7
	0/bepAwuc0lkFUAYwARu0RJheP5ogIMFbZcIy5xDwaMbAiaTaJ0LZ6kVWqcOmBnaX7KzoCCBOTR
	KmMxLd4y1iRVSMiU4uFe2MN2Rc2O3+oCF1qLUB+vTZksRYDkYJKg5MmlZJrqfJYW51GeaDmGF5z
	l1gcx03SRRkiw3d6hxlU2MA7UKpzwz81pA6vabpYA4V6Rpn7uBYiXJerrDzPBuvHOxJ2ISVuYN0
	XG92zL8Xtwhtt9Uv3eVGJsnaaTYZsO9bOiyTGv2DBHwQtHXul8/lg4ag==
X-Received: by 2002:a05:600c:5288:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499aa1ea46dmr243508505e9.13.1787228750345;
        Thu, 20 Aug 2026 05:25:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:25:49 -0700 (PDT)
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
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
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
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu, 20 Aug 2026 14:19:59 +0200
Message-ID: <20260820122242.120039-2-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..fd4b41bd3716 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +672,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392", "mediatek,mt6323";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0

