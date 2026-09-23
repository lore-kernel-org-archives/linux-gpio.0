Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F05413780
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194987; cv=none; b=CJw2NXjHu/9ruUeW17BBXo6XlF5d9HPGM5yxT4iOOD5e7itXIJRJaN9YLDVRUQICPNB9FnnqBcNiTgGxf2ruic4VfRfIwP+2Fwv0DmP7AykvBdIIWHMZ3X2c+r53l2VTUYUJY+o8ceMqksCkQ0ryPvPKhT3RL1KqxI6L01w1fxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194987; c=relaxed/simple;
	bh=hYDoDnMsKfc2K4l73QX3mfc01djD0ZHm4lyFuIhD2tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9192YyXAshleMmnZHHAQojg8CdyDaKIrNJfzK+FAQrdb0siuRvVH6lqD6iqnVIzNINB2ZSviifyOzutgPeUJeeAHJZs+FnnARjW+zyl06D6FViQmWQ92jLuCEN/SNBNGFwqvlji+T5hdfKkPdAKuLp45uPEA8irCseo7klCdj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVM9kFAL; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVM9kFAL"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso237980366b.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194978; x=1790799778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=AVM9kFALLk8fuss+2aQEvSzlTBZBq8JrAovZhfgvqEWq0vuxvMQ0pNat4RXtVML26i
         bqEkFkcx5nQ+5ceNFtJCXEqo/Gi2/58Ug/NrqHSgjyQaZpZmeUxt1k3umS8ChNfPq7pP
         ZY+SzzYDBvo8GpoHTbPlOKG3s6Khyr/682RXkj2b0FQSlGQEH57xEbvOoJUGAAQz0tF/
         03jLWpJhXZyAjI+hiLUKcMPfeqwLlPi2k7IZC5KgCCCt4h/QN/LGDcbxzmwQue8t/4uR
         Sc4Veslmc2XpElJsgreDhm9aYEi9tRCM3aMy7tOCZE1kIdrUVhaCILWftw6lczXX79NL
         5qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194978; x=1790799778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=uCHcHWttIemwfI0E7M3+H3xCRZmEx5wMewbDiZ8XdATmJbnloxlTk4+rNRy8L225WD
         Wpqm6verqYuzFx+ET9jR+Srbyquod260fse4Ct0eXTrOnnpxE2gP0K2wOhsixfD/l+wc
         oIx+X2KnT7jq36u620dOde/hcGzKe+x87gt/KEJ9R+/YsNqk/34p1xw+Nvs1qmf/+frW
         VSFtXQfojtzr327IglDX5QcoSUkAg0/ObDa7r4QCdIJdEW3M8UvjM+8/l7kVFucyJiTN
         MoVmzYYeFiMV57MQjsuhhd7LYmkNEHX4PHPx75xq2BCAHx5xGBaafD9elTY4UXjXz9ZN
         7BCQ==
X-Forwarded-Encrypted: i=1; AKwUvBykbiAQ0u5PTVHqLBhepP/U7Db1jcvLK3nb810bX+sqCzDN6PdCt7ZmTEUTavS3okiuM/qEPJVLEqE1@vger.kernel.org
X-Gm-Message-State: AFuF++kqW1rJMBz7Wy+VsTdfw+BuyqtNED5FOY38ApOeb8xcGY6hHuuQ
	swR0YRQIxtChXe+XLLXFOXYvEO2WFSe9mtZVHIL/DPYPIINCCVw0Fze7
X-Gm-Gg: AYBFou0hVMk/GMQ9ENlowJ3pNswcxdG4pS75vrAbvIno4wTbf+l7SNSKoyBJCn0HSdi
	AzGwOzSLW74RYsCUWubB4vF1nsRcJ8Z4P7Qy1TI/A+a4547oh0RD9RYg+nfQ92thJZj+9cO9XYE
	AkRulv0/jfBvu/nxmlDhay+o0mI4uoGHB309GCT6yrWLO3Qi4gqAIJJxQJtC86hWy1bJvnjjnK+
	dsvTyiX/AZQBDmiCDjXFLMG8RkEmm8UECAS5k+nsdfV2hbCwUwY4INAuLtFDYTTADCzhJ1Ow49A
	RFLsW+EwnsU6s1zQT2HG9tN2tGT0zBdhSexsiYQeouSXMQWQMY7M47+UMbJATqicpOoCB9hByzE
	IiF8KdYZT+VXOaEhGprXIRREf5Bh+wRLbSy7vAcZT+7mvgVuJTZHISS3CgAgwwdLCm6aSGFOXwy
	2vOXHIRKzUyN4mfjWByaQ1P68gM2DzSVJkSshEXNHAyucD/PJriZ8R+ZcusY+r6RxIFK/XFHlwm
	AbXpxGjoAnwLlKRSOMVrVdtE+PnBSShI5h0qphatl8+
X-Received: by 2002:a17:907:d24:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2ac2106076mr27276466b.0.1790194977830;
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
Date: Wed, 23 Sep 2026 21:16:53 +0100
Message-ID: <20260923201701.43391-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One controller at 0x01c20800 with four external interrupt banks.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
new file mode 100644
index 000000000000..806da97ab708
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Pin Controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun8i-b288-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      One interrupt per bank of external interrupt capable pins.
+    maxItems: 4
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: apb
+      - const: hosc
+      - const: losc
+
+  gpio-controller: true
+  interrupt-controller: true
+  gpio-line-names: true
+
+  "#gpio-cells":
+    const: 3
+
+  "#interrupt-cells":
+    const: 3
+
+patternProperties:
+  "-pins$":
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      pins: true
+      function: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-disable: true
+      drive-strength:
+        enum: [10, 20, 30, 40]
+
+    required:
+      - pins
+      - function
+
+  "^vcc-p[bcdfg]-supply$":
+    description:
+      Power supplies for pin banks.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun8i-b288-ccu.h>
+
+    pio: pinctrl@1c20800 {
+        compatible = "allwinner,sun8i-b288-pinctrl";
+        reg = <0x01c20800 0x400>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+        clock-names = "apb", "hosc", "losc";
+        gpio-controller;
+        #gpio-cells = <3>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        mmc0_pins: mmc0-pins {
+            pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+            function = "sdc0";
+            drive-strength = <30>;
+            bias-pull-up;
+        };
+    };
-- 
2.53.0

