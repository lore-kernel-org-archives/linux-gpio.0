From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH V2 1/2] gpiolib: improve overlap check of range of gpio
Date: Mon, 16 Nov 2015 13:02:46 +0800
Message-ID: <1447650167-29070-2-git-send-email-bamvor.zhangjian@linaro.org>
References: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:33161 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbbKPFDC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 00:03:02 -0500
Received: by pabfh17 with SMTP id fh17so164606184pab.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2015 21:03:01 -0800 (PST)
In-Reply-To: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
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
 drivers/gpio/gpiolib.c | 59 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6798355..270d60b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -182,7 +182,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
 
 /*
  * Add a new chip to the global chips list, keeping the list of chips sorted
- * by base order.
+ * by range(means [base, base + ngpio - 1]) order.
  *
  * Return -EBUSY if the new chip overlaps with some other chip's integer
  * space.
@@ -190,31 +190,52 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
 static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
 	struct list_head *pos;
-	struct gpio_chip *_chip;
-	int err = 0;
+	struct gpio_chip *iterator;
+	struct gpio_chip *previous = NULL;
+	int ret = 0;
 
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
-			dev_err(chip->dev,
-			       "GPIO integer space overlap, cannot add chip\n");
-			err = -EBUSY;
+	list_for_each(pos, &gpio_chips) {
+		iterator = list_entry(pos, struct gpio_chip, list);
+		if (iterator->base >= chip->base + chip->ngpio) {
+			/*
+			 * Iterator is the first GPIO chip so there is no
+			 * previous one
+			 */
+			if (previous == NULL) {
+				goto found;
+			} else {
+				/*
+				 * We found a valid range(means
+				 * [base, base + ngpio - 1]) between previous
+				 * and iterator chip.
+				 */
+				if (previous->base + previous->ngpio
+						<= chip->base)
+					goto found;
+			}
 		}
+		previous = iterator;
 	}
+	/* We are beyond the last chip in the list */
+	if (iterator->base + iterator->ngpio <= chip->base)
+		goto found;
+
+	dev_err(chip->dev,
+	       "GPIO integer space overlap, cannot add chip\n");
+	goto err;
 
-	if (!err)
-		list_add_tail(&chip->list, pos);
+found:
+	list_add_tail(&chip->list, pos);
+	return ret;
 
-	return err;
+err:
+	ret = -EBUSY;
+	return ret;
 }
 
 /**
-- 
2.1.4

