From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] pinctrl: bcm2835: reduce GPPUD set-up time
Date: Mon, 31 Oct 2016 13:21:33 +0000
Message-ID: <1477920093-28180-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:56904 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942837AbcJaNWc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2016 09:22:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>

Since the BCM2835 datasheet doesn't exactly specify the set-up time for
the GPIO Pull-up/down Clock Registers there was an assumption of 150 cycles
at a clock rate of 1 MHz. During a discussion [1] in the Raspberry Pi forum
it turns out that clock rate refers to the VPU which has a rate of 250 MHz.
So we can reduce the delay to a sensible value and update the comment above.

I tested this optimization with a Raspberry Pi B and a multimeter.

[1] - https://www.raspberrypi.org/forums/viewtopic.php?f=72&t=163352

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index fa77165..b2dd278 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -917,12 +917,14 @@ static int bcm2835_pinconf_set(struct pinctrl_dev *pctldev,
 
 		bcm2835_gpio_wr(pc, GPPUD, arg & 3);
 		/*
-		 * Docs say to wait 150 cycles, but not of what. We assume a
-		 * 1 MHz clock here, which is pretty slow...
+		 * BCM2835 datasheet say to wait 150 cycles, but not of what.
+		 * But the VideoCore firmware delay for this operation
+		 * based nearly on the same amount of VPU cycles and this clock
+		 * runs at 250 MHz.
 		 */
-		udelay(150);
+		udelay(1);
 		bcm2835_gpio_wr(pc, GPPUDCLK0 + (off * 4), BIT(bit));
-		udelay(150);
+		udelay(1);
 		bcm2835_gpio_wr(pc, GPPUDCLK0 + (off * 4), 0);
 	} /* for each config */
 
-- 
1.7.9.5

