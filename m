From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: split up and comments MC0 pins
Date: Thu, 17 Nov 2016 09:47:03 +0100
Message-ID: <1479372423-4065-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38097 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbcKQIrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2016 03:47:09 -0500
Received: by mail-wm0-f41.google.com with SMTP id f82so130531127wmf.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2016 00:47:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

When debugging it helps to see exactly which pin goes where,
so make it very detailed.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index 8392083514fb..af4814479eb0 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -379,13 +379,24 @@ static const unsigned msp0txrx_a_1_pins[] = { DB8500_PIN_AC4, DB8500_PIN_AC3 };
 static const unsigned msp0tfstck_a_1_pins[] = { DB8500_PIN_AF3, DB8500_PIN_AE3 };
 static const unsigned msp0rfsrck_a_1_pins[] = { DB8500_PIN_AD3, DB8500_PIN_AD4 };
 /* Basic pins of the MMC/SD card 0 interface */
-static const unsigned mc0_a_1_pins[] = { DB8500_PIN_AC2, DB8500_PIN_AC1,
-	DB8500_PIN_AB4, DB8500_PIN_AA3, DB8500_PIN_AA4, DB8500_PIN_AB2,
-	DB8500_PIN_Y4, DB8500_PIN_Y2, DB8500_PIN_AA2, DB8500_PIN_AA1 };
+static const unsigned mc0_a_1_pins[] = { DB8500_PIN_AC2, /* MC0_CMDDIR */
+					 DB8500_PIN_AC1, /* MC0_DAT0DIR */
+					 DB8500_PIN_AB4, /* MC0_DAT2DIR */
+					 DB8500_PIN_AA3, /* MC0_FBCLK */
+					 DB8500_PIN_AA4, /* MC0_CLK */
+					 DB8500_PIN_AB2, /* MC0_CMD */
+					 DB8500_PIN_Y4,  /* MC0_DAT0 */
+					 DB8500_PIN_Y2,  /* MC0_DAT1 */
+					 DB8500_PIN_AA2, /* MC0_DAT2 */
+					 DB8500_PIN_AA1  /* MC0_DAT3 */
+};
 /* Often only 4 bits are used, then these are not needed (only used for MMC) */
-static const unsigned mc0_dat47_a_1_pins[] = { DB8500_PIN_W2, DB8500_PIN_W3,
-	DB8500_PIN_V3, DB8500_PIN_V2};
-static const unsigned mc0dat31dir_a_1_pins[] = { DB8500_PIN_AB3 };
+static const unsigned mc0_dat47_a_1_pins[] = { DB8500_PIN_W2, /* MC0_DAT4 */
+					       DB8500_PIN_W3, /* MC0_DAT5 */
+					       DB8500_PIN_V3, /* MC0_DAT6 */
+					       DB8500_PIN_V2  /* MC0_DAT7 */
+};
+static const unsigned mc0dat31dir_a_1_pins[] = { DB8500_PIN_AB3 }; /* MC0_DAT31DIR */
 /* MSP1 can only be on these pins, but TXD and RXD can be flipped */
 static const unsigned msp1txrx_a_1_pins[] = { DB8500_PIN_AF2, DB8500_PIN_AG2 };
 static const unsigned msp1_a_1_pins[] = { DB8500_PIN_AE1, DB8500_PIN_AE2 };
-- 
2.7.4

