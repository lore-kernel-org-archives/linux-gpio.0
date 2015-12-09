From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 038/182] gpio: mcp: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:01 +0100
Message-ID: <1449667081-31552-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34333 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbbLINSH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:07 -0500
Received: by lffu14 with SMTP id u14so34034331lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:05 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>, Sonic Zhang <sonic.zhang@analog.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mcp23s08.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 13cace0ca6f7..c767879e4dd9 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -269,7 +269,7 @@ static const struct mcp23s08_ops mcp23s17_ops = {
 
 static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct mcp23s08	*mcp = container_of(chip, struct mcp23s08, chip);
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
 	int status;
 
 	mutex_lock(&mcp->lock);
@@ -281,7 +281,7 @@ static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct mcp23s08	*mcp = container_of(chip, struct mcp23s08, chip);
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
 	int status;
 
 	mutex_lock(&mcp->lock);
@@ -312,7 +312,7 @@ static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, int value)
 
 static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct mcp23s08	*mcp = container_of(chip, struct mcp23s08, chip);
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
 	unsigned mask = 1 << offset;
 
 	mutex_lock(&mcp->lock);
@@ -323,7 +323,7 @@ static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
 static int
 mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct mcp23s08	*mcp = container_of(chip, struct mcp23s08, chip);
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
 	unsigned mask = 1 << offset;
 	int status;
 
@@ -377,7 +377,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 
 static int mcp23s08_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct mcp23s08 *mcp = container_of(chip, struct mcp23s08, chip);
+	struct mcp23s08 *mcp = gpiochip_get_data(chip);
 
 	return irq_find_mapping(mcp->irq_domain, offset);
 }
@@ -544,7 +544,7 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int		t;
 	unsigned	mask;
 
-	mcp = container_of(chip, struct mcp23s08, chip);
+	mcp = gpiochip_get_data(chip);
 
 	/* NOTE: we only handle one bank for now ... */
 	bank = '0' + ((mcp->addr >> 1) & 0x7);
@@ -704,7 +704,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	status = gpiochip_add(&mcp->chip);
+	status = gpiochip_add_data(&mcp->chip, mcp);
 	if (status < 0)
 		goto fail;
 
-- 
2.4.3

