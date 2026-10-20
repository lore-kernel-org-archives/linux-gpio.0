Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517809;
	b=FKfPCBvvmVxbO+dOe48m4sYPKgc89NfWNh3DZ/YXNEdR0x8LQtYRRbowJx7IKRUwbDyp
	 /1Ab2Df9IXTSk7DuUY/xt1ZJqt9NcU2hH0gBJzBa2zA9bYUP8y9La7OItJ6xG/azfMWNI
	 SY1NsDW4ZWUuKOCbsDnP8LY3M466N0mGY5AyobwOnH10hOiNZlh2xAoMY3u+nfbwQT5aH
	 OTLTyGsCAaWCMwNNMJQAT8vlZ1WltJnTutNSn7xJP/lfvZJ+heZFWMf+KPIuO2xqm09YH
	 w5NfxUBiQggZDF7X3Rcxy2BJFef4bN7KKoFCwT2puR88vwiT7H+f94pE3+ZVfo3VEAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
	b=3qEtyc0vDIjTF/x/IBMf0GFa6HsvPeAF08YM3TF0TwcDRh9KqiHpeUlsjCDxVfKsgd76
	 nBA0zFGI3C9NZ37cgKZVVX67pDeXikvnHnWsr7wrqDoMTK4QmTdspnnWA55ACSAx/qgn3
	 Ul6Xlrl1IBARzZYhPbDFOIgbdyGwdGf0A6wMqR4aTJjISHAJexJWFpEPpnN/pQkXiZwnS
	 U+tayBNPUn6gI5p2PaoanpooX1+lA2tmbLFwHRXBfzbi7NJfltjjzj4IhRTStYmnTs+ip
	 WgtVnpdnu7V9G8hffSVJwqx6Ex9c/dOmaNA87q8Bs7cgmNULG5X3UZv0kCoaDxL5IAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=shFLywWF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAE606A327
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 17:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FEAE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=shFLywWF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso38503375e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517808; x=1793122608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=shFLywWFYmCew9DhtJQzFsoE4pnvQm941YaCMTCeX3aU+gUEWiZy2vl3SuibviZVx0
         7AwcQcpjnJNuIdq0r5R06ZdCPvZdj52wfgcIrmHlyRSz5i5DTtvChBUjKjsO+aO6+L9a
         RXveUrqr4Q3r+YWUMGdOlUrBooxK8/sxOoDf/TECDDvzR6JsnQZXtS3uymp5F4dRYYl1
         Pm3r2zZQp/uT+9GAJYSQIsZbTgGP/RC9sUTrgDaViWSyjoHaz3nuFMFwpJp+X/MzP+Nk
         A+tf7Qf+RofvAmYXuTpbz31GK489KFlObY6dm/lY4eibdeYp7Q7Dk2O2sbnJ5MjxVWSa
         Zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517808; x=1793122608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=IFkwQc0hT9l3mgZ98eHQPVaXjSU/tjrwepY014ohMGYzZp89QYzZIjerMaVJtigWb0
         YIMUK4TyDEYhtzMrUGaXblOTFzbjrOCyUeEUEsNLpzv9xjVYn0SBNQqRA0iBgF5QGNbX
         yED290mpgIGhj39hPJf447zVJrg4jPwe4uqaEZZ2NlX6y4WuRktn+YulcOe4P71rySH/
         9hHUXlhr7dslWkFf12pwOLNCDVMg6CqQmeABW0I8ZLtmo/xon2uZ47pFet23l5ObzSIJ
         jt9zx8jctLIXLDWrH6YPcl2rxj/lHoN4zadO4RJFIGotG7jX+znhMZq0Ai38lRB87i21
         vyrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0uQD2paAQ6GfIVV/3Uh2+dQs5ocfN5WJbZfQiF6tgFK++7Y1/lYwSa6wkIbP96X3WforeuVZzxDDL@vger.kernel.org
X-Gm-Message-State: AFq9FYIQxb3q80YVuPKSgjA85PM9YdnW5i7gNBC+8dDb85mf9MfwrGgE
	cg3Qj3Fg/0dh0rNziR8VxmKrAB5t1uq1GVkSkwceN0aLU8VHsvYTnvJm
X-Gm-Gg: AYBFou29xIjpHDmLSn5ZVExRid/Uo2LPDtu6DtRPH254o/6ClC4T9Yeio9gd1BARskI
	gqCXt9LEP7H2dZUTnyfB0gGTsXvxcylaWMiJfc84if8N8oWqiFVtFKGagRyitKdab4vjCCQBCKT
	ldVc5UwyVGsT+TmTc4hRKmmd9v9nJG9dQZHakdiHttnCs3hA34JGk3yIPYehsSLReKZ9pSkEMcY
	a6s89Ee+gYzHD0jjVqVMixs2L3McEDUvCUruwkC0wuEpitM8GcstrfKymAr73vB/ZyoHXp0Qf/H
	rSb2pcJ8xhiHbe6lBbTfQ5bWgYENyYDm+oTTGtrxeO/ElNH0zYncOrmM2hhXaNriCNdcXG6+aYH
	SBPw6ydicFLKtQPC9RuTX3AS/pnnmgO975HF4gkE3gVUe7Qy8p8xf2NGaDSV+bThho8JxBwdAxJ
	e2iOAmgv5HLmygwGDx7f4FIzZXZEqgqillnQyXsI8bjYqZdtHyLcMiqgVkRzf/Tf1xSQ==
X-Received: by 2002:a05:600c:19c7:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1d761b90dmr248715685e9.30.1792517807739;
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
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
Subject: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:22 +0200
Message-ID: <20261020173556.632798-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
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
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
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

