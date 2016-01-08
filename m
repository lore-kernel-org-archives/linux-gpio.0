From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH] gpiolib: rewrite gpiochip_add_to_list
Date: Fri,  8 Jan 2016 14:37:15 +0800
Message-ID: <1452235035-828-2-git-send-email-bamvor.zhangjian@linaro.org>
References: <1452235035-828-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:36499 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074AbcAHGh7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2016 01:37:59 -0500
Received: by mail-pf0-f177.google.com with SMTP id n128so5336451pfn.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 22:37:59 -0800 (PST)
In-Reply-To: <1452235035-828-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, julien.grossholtz@savoirfairelinux.com, arnd@arndb.de, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

The original code of gpiochip_add_to_list is not very clear which
lead to bugs or compiling warning, reference the following patches:
Bugs:
1.  Commit ef7c7553039b ("gpiolib: improve overlap check of range of
    gpio").
2.  "[PATCH] gpiolib: fix chip order in gpio list" [1]

Warning:
1.  Commit e28ecca6eac4 ("gpio: fix warning about iterator").
of gpio").

There is a off-list discussion about how to improve it consequently.
This commit try to follow this by rewriting the whole functions.

Tested pass with my gpio mockup driver and test scripts[2].

[1] http://www.spinics.net/lists/kernel/msg2156917.html
[2] http://www.spinics.net/lists/linux-gpio/msg09598.html

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 65 ++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3db34e7..b9cc01f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -189,55 +189,46 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  */
 static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
-	struct gpio_chip *iterator;
-	struct gpio_chip *previous = NULL;
+	struct gpio_chip *prev, *next;
 
 	if (list_empty(&gpio_chips)) {
-		list_add_tail(&chip->list, &gpio_chips);
+		/* initial entry in list */
+		list_add(&chip->list, &gpio_chips);
 		return 0;
 	}
 
-	list_for_each_entry(iterator, &gpio_chips, list) {
-		if (iterator->base >= chip->base + chip->ngpio) {
-			/*
-			 * Iterator is the first GPIO chip so there is no
-			 * previous one
-			 */
-			if (!previous) {
-				goto found;
-			} else {
-				/*
-				 * We found a valid range(means
-				 * [base, base + ngpio - 1]) between previous
-				 * and iterator chip.
-				 */
-				if (previous->base + previous->ngpio
-						<= chip->base)
-					goto found;
-			}
-		}
-		previous = iterator;
+	next = list_entry(gpio_chips.next, struct gpio_chip, list);
+	if (chip->base + chip->ngpio <= next->base) {
+		/* add before first entry */
+		list_add(&chip->list, &gpio_chips);
+		return 0;
 	}
 
-	/*
-	 * We are beyond the last chip in the list and iterator now
-	 * points to the head.
-	 * Let iterator point to the last chip in the list.
-	 */
+	prev = list_entry(gpio_chips.prev, struct gpio_chip, list);
+	if (prev->base + prev->ngpio <= chip->base) {
+		/* add behind last entry */
+		list_add_tail(&chip->list, &gpio_chips);
+		return 0;
+	}
 
-	iterator = list_last_entry(&gpio_chips, struct gpio_chip, list);
-	if (iterator->base + iterator->ngpio <= chip->base)
-		goto found;
+	list_for_each_entry_safe(prev, next, &gpio_chips, list)
+		if (chip->base > prev->base)
+			break;
 
-	dev_err(chip->parent,
-	       "GPIO integer space overlap, cannot add chip\n");
-	return -EBUSY;
+	if (&prev->list != &gpio_chips &&
+	    &next->list != &gpio_chips &&
+	    prev->base + prev->ngpio <= chip->base &&
+	    chip->base + chip->ngpio <= next->base) {
+		/* add between prev and next */
+		list_add(&chip->list, &prev->list);
+		return 0;
+	}
 
-found:
-	list_add_tail(&chip->list, &iterator->list);
-	return 0;
+	dev_err(chip->parent, "GPIO integer space overlap, cannot add chip\n");
+	return -EBUSY;
 }
 
+
 /**
  * Convert a GPIO name to its descriptor
  */
-- 
2.1.4

