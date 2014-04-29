From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: [PATCH] GPIOD: fix gpiod_direction_output initial value
Date: Tue, 29 Apr 2014 14:27:22 +0200
Message-ID: <1398774442-2407-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smarthost.TechFak.Uni-Bielefeld.DE ([129.70.137.17]:37954 "EHLO
	smarthost.TechFak.Uni-Bielefeld.DE" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933248AbaD2Mgq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Apr 2014 08:36:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Robert ABEL <rabel@cit-ec.uni-bielefeld.de>

gpiod_direction_output initial value was used as raw value instead of
logical value. Convert value from logical to raw.

Signed-off-by: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
---
 drivers/gpio/gpiolib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f48817d..2309322 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2032,6 +2032,10 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 		return -EIO;
 	}
 
+	/* convert logical value to raw value */
+	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+		value = !value;
+
 	/* Open drain pin should not be driven to 1 */
 	if (value && test_bit(FLAG_OPEN_DRAIN,  &desc->flags))
 		return gpiod_direction_input(desc);
-- 
1.9.2

