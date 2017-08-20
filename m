From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] gpio: zevio: make gpio_chip const
Date: Sun, 20 Aug 2017 23:57:46 +0530
Message-ID: <1503253666-29088-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34489 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753176AbdHTS1z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Aug 2017 14:27:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: julia.lawall@lip6.fr, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Make this const as it is only used as a copy operation.
Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/gpio/gpio-zevio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index e23ef7b..3926ce9 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -156,7 +156,7 @@ static int zevio_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 	return -ENXIO;
 }
 
-static struct gpio_chip zevio_gpio_chip = {
+static const struct gpio_chip zevio_gpio_chip = {
 	.direction_input	= zevio_gpio_direction_input,
 	.direction_output	= zevio_gpio_direction_output,
 	.set			= zevio_gpio_set,
-- 
1.9.1

