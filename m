From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/6] ARM: dts: augment Moxa ART GPIO node
Date: Mon, 13 Mar 2017 00:28:15 +0100
Message-ID: <20170312232818.26304-3-linus.walleij@linaro.org>
References: <20170312232818.26304-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:32793 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935487AbdCLX2g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Mar 2017 19:28:36 -0400
Received: by mail-lf0-f53.google.com with SMTP id a6so57550564lfa.0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2017 16:28:35 -0700 (PDT)
In-Reply-To: <20170312232818.26304-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

The Moxa ART GPIO is a Faraday FTGPIO010. Augment the DTS node
to indicate both compatible values for the SoC and the IP part.
Also increase the register range to 0x100, it has at least 0x48
bytes of registers, and a few extra will not hurt.

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/moxart.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/moxart.dtsi b/arch/arm/boot/dts/moxart.dtsi
index 1fd27ed65a01..10a8184e0ce9 100644
--- a/arch/arm/boot/dts/moxart.dtsi
+++ b/arch/arm/boot/dts/moxart.dtsi
@@ -66,8 +66,8 @@
 		gpio: gpio@98700000 {
 			gpio-controller;
 			#gpio-cells = <2>;
-			compatible = "moxa,moxart-gpio";
-			reg = <0x98700000 0xC>;
+			compatible = "moxa,moxart-gpio", "faraday,ftgpio010";
+			reg = <0x98700000 0x100>;
 		};
 
 		rtc: rtc {
-- 
2.9.3

