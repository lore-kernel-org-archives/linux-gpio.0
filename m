From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 6/6] gpiolib: Add gpio name information to /sys/kernel/debug/gpio
Date: Tue,  4 Aug 2015 11:23:23 +0200
Message-ID: <1438680203-13432-7-git-send-email-mpa@pengutronix.de>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:53186 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932399AbbHDJXq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 05:23:46 -0400
In-Reply-To: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

Add some information about gpio names to the debugfs gpio file. name and
label of a GPIO are then displayed next to each other. This way it is
easy to see what the real name of GPIO is and what the driver requested
it for.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index edfeb0485112..926a1507431f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2307,14 +2307,19 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int			is_irq;
 
 	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
-		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
+		if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
+			if (gdesc->name) {
+				seq_printf(s, " gpio-%-3d (%-20.20s)\n",
+					   gpio, gdesc->name);
+			}
 			continue;
+		}
 
 		gpiod_get_direction(gdesc);
 		is_out = test_bit(FLAG_IS_OUT, &gdesc->flags);
 		is_irq = test_bit(FLAG_USED_AS_IRQ, &gdesc->flags);
-		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s %s",
-			gpio, gdesc->label,
+		seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s",
+			gpio, gdesc->name ? gdesc->name : "", gdesc->label,
 			is_out ? "out" : "in ",
 			chip->get
 				? (chip->get(chip, i) ? "hi" : "lo")
-- 
2.1.4

