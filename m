From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] gpio-stp-xway: Fix enabling the highest bit of the PHY LEDs
Date: Mon, 25 May 2015 22:39:50 +0200
Message-ID: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:33031 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbbEYUrN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 16:47:13 -0400
Received: by wgez8 with SMTP id z8so80717434wge.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2015 13:47:12 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, John Crispin <blogic@openwrt.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

0x3 only masks two bits, but three bits have to be allowed. This fixes
GPHY0 LED2 (which is the highest bit of phy2) on my board.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/gpio-stp-xway.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 202361e..6d4148f 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -58,7 +58,7 @@
 #define XWAY_STP_ADSL_MASK	0x3
 
 /* 2 groups of 3 bits can be driven by the phys */
-#define XWAY_STP_PHY_MASK	0x3
+#define XWAY_STP_PHY_MASK	0x7
 #define XWAY_STP_PHY1_SHIFT	27
 #define XWAY_STP_PHY2_SHIFT	15
 
-- 
2.4.1

