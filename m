From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH 1/2] pinctrl: cygnus: fixed typo in the gpio driver
Date: Wed, 13 May 2015 17:06:22 -0700
Message-ID: <1431561983-8543-2-git-send-email-rjui@broadcom.com>
References: <1431561983-8543-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:31599 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934577AbbENAGb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 20:06:31 -0400
In-Reply-To: <1431561983-8543-1-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Jason Uy <jasonuy@broadcom.com>, Ray Jui <rjui@broadcom.com>

Fixed a small typo in the Cygnus GPIO driver

Signed-off-by: Jason Uy <jasonuy@broadcom.com>
Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
index 4ad5c1a..bde45ba 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -38,7 +38,7 @@
 #define CYGNUS_GPIO_DATA_IN_OFFSET   0x00
 #define CYGNUS_GPIO_DATA_OUT_OFFSET  0x04
 #define CYGNUS_GPIO_OUT_EN_OFFSET    0x08
-#define CYGNUS_GPIO_IN_TYPE_OFFSET   0x0c
+#define CYGNUS_GPIO_INT_TYPE_OFFSET  0x0c
 #define CYGNUS_GPIO_INT_DE_OFFSET    0x10
 #define CYGNUS_GPIO_INT_EDGE_OFFSET  0x14
 #define CYGNUS_GPIO_INT_MSK_OFFSET   0x18
@@ -264,7 +264,7 @@ static int cygnus_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	}
 
 	spin_lock_irqsave(&chip->lock, flags);
-	cygnus_set_bit(chip, CYGNUS_GPIO_IN_TYPE_OFFSET, gpio,
+	cygnus_set_bit(chip, CYGNUS_GPIO_INT_TYPE_OFFSET, gpio,
 		       level_triggered);
 	cygnus_set_bit(chip, CYGNUS_GPIO_INT_DE_OFFSET, gpio, dual_edge);
 	cygnus_set_bit(chip, CYGNUS_GPIO_INT_EDGE_OFFSET, gpio,
-- 
1.7.9.5

