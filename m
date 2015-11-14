From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH 1/2] gpiolib: improve overlap check of range of gpio
Date: Sat, 14 Nov 2015 16:38:55 +0800
Message-ID: <1447490336-10209-2-git-send-email-bamvor.zhangjian@linaro.org>
References: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33464 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbKNIjM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:39:12 -0500
Received: by pabfh17 with SMTP id fh17so124060157pab.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:39:11 -0800 (PST)
In-Reply-To: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

There are limitations for the current checker:
1.  Could not check the overlap if the new gpiochip is the secondly
    gpiochip.
2.  Could not check the overlap if the new gpiochip is overlap
    with the left of gpiochip. E.g. if we insert [c, d] between
    [a,b] and [e, f], and e >= c + d, it will successful even if
    c < a + b.
3.  Allow overlap of base of different gpiochip.

This patch fix these issues by checking the overlap of both right and
left gpiochip in the same loop statement.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6798355..cc135d9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -191,29 +191,48 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
 	struct list_head *pos;
 	struct gpio_chip *_chip;
+	struct gpio_chip *_chip_prev = NULL;
 	int err = 0;
 
-	/* find where to insert our chip */
-	list_for_each(pos, &gpio_chips) {
-		_chip = list_entry(pos, struct gpio_chip, list);
-		/* shall we insert before _chip? */
-		if (_chip->base >= chip->base + chip->ngpio)
-			break;
+	if (list_empty(&gpio_chips)) {
+		pos = gpio_chips.next;
+		goto found;
 	}
 
-	/* are we stepping on the chip right before? */
-	if (pos != &gpio_chips && pos->prev != &gpio_chips) {
-		_chip = list_entry(pos->prev, struct gpio_chip, list);
-		if (_chip->base + _chip->ngpio > chip->base) {
+	list_for_each(pos, &gpio_chips) {
+		_chip = list_entry(pos, struct gpio_chip, list);
+		if (_chip->base == chip->base) {
 			dev_err(chip->dev,
-			       "GPIO integer space overlap, cannot add chip\n");
+			       "GPIO base overlap<%d>, cannot add chip\n",
+			       chip->base);
 			err = -EBUSY;
+			goto err;
 		}
+		if (_chip->base >= chip->base + chip->ngpio) {
+			/* we are the before the first existence gpio*/
+			if (pos->prev == &gpio_chips) {
+				goto found;
+			} else {
+				if (_chip_prev->base + _chip_prev->ngpio
+						<= chip->base)
+					goto found;
+			}
+		}
+		_chip_prev = _chip;
 	}
+	if (_chip->base + _chip->ngpio <= chip->base)
+		goto found;
 
+	dev_err(chip->dev,
+	       "GPIO integer space overlap, cannot add chip\n");
+	err = -EBUSY;
+	goto err;
+
+found:
 	if (!err)
 		list_add_tail(&chip->list, pos);
 
+err:
 	return err;
 }
 
-- 
2.1.4

