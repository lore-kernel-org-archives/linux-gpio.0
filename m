From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/6] ARM: dts: augment Gemini GPIO nodes
Date: Mon, 13 Mar 2017 00:28:14 +0100
Message-ID: <20170312232818.26304-2-linus.walleij@linaro.org>
References: <20170312232818.26304-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35810 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935523AbdCLX2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Mar 2017 19:28:33 -0400
Received: by mail-lf0-f54.google.com with SMTP id j90so57567284lfk.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2017 16:28:32 -0700 (PDT)
In-Reply-To: <20170312232818.26304-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

The binding should state "cortina,gemini-gpio", "faraday,ftgpio010"
stating the full name of the IP part.

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/gemini.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index 67c0a63d5527..b8d011bdcc76 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -82,7 +82,7 @@
 		};
 
 		gpio0: gpio@4d000000 {
-			compatible = "cortina,gemini-gpio";
+			compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
 			reg = <0x4d000000 0x100>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
@@ -92,7 +92,7 @@
 		};
 
 		gpio1: gpio@4e000000 {
-			compatible = "cortina,gemini-gpio";
+			compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
 			reg = <0x4e000000 0x100>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
@@ -102,7 +102,7 @@
 		};
 
 		gpio2: gpio@4f000000 {
-			compatible = "cortina,gemini-gpio";
+			compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
 			reg = <0x4f000000 0x100>;
 			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-- 
2.9.3

