From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] gpio: aspeed: Don't attempt to debounce if disabled
Date: Tue,  2 May 2017 15:38:24 +0930
Message-ID: <20170502060824.6457-1-joel@jms.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34221 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdEBGIl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 May 2017 02:08:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>

We warn the user at driver probe time that debouncing is disabled.
However, if they request debouncing later on we print a confusing error
message:

 gpio_aspeed 1e780000.gpio: Failed to convert 5000us to cycles at 0Hz: -524

Instead bail out when the clock is not present.

Fixes: 5ae4cb94b3133 (gpio: aspeed: Add debounce support)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpio/gpio-aspeed.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index ccea609676ee..4ca436e66bdb 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -646,6 +646,9 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 	int rc;
 	int i;
 
+	if (!gpio->clk)
+		return -EINVAL;
+
 	rc = usecs_to_cycles(gpio, usecs, &requested_cycles);
 	if (rc < 0) {
 		dev_warn(chip->parent, "Failed to convert %luus to cycles at %luHz: %d\n",
-- 
2.11.0

