From: Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: [PATCH v2] gpiolib: rewrite gpiodev_add_to_list
Date: Fri, 26 Feb 2016 22:37:14 +0800
Message-ID: <1456497434-11656-1-git-send-email-bamv2005@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:34651 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753853AbcBZOhh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 09:37:37 -0500
Received: by mail-pf0-f173.google.com with SMTP id x65so53130016pfb.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2016 06:37:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, julien.grossholtz@savoirfairelinux.com, arnd@arndb.de, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

The original code of gpiodev_add_to_list is not very clear which
lead to bugs or compiling warning, reference the following patches:
Bugs:
1.  Commit ef7c7553039b ("gpiolib: improve overlap check of range of
    gpio").
2.  Commit 96098df125c0 ("gpiolib: fix chip order in gpio list")

Warning:
1.  Commit e28ecca6eac4 ("gpio: fix warning about iterator").
of gpio").

There is a off-list discussion about how to improve it consequently.
This commit try to follow this by rewriting the whole functions.

Tested pass with my gpio mockup driver and test scripts[1].

[1] http://www.spinics.net/lists/linux-gpio/msg09598.html

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 65 +++++++++++++++++++-------------------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bc788b9..1c10bd8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -206,58 +206,43 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  */
 static int gpiodev_add_to_list(struct gpio_device *gdev)
 {
-	struct gpio_device *iterator;
-	struct gpio_device *previous = NULL;
-
-	if (!gdev->chip)
-		return -EINVAL;
+	struct gpio_device *prev, *next;
 
 	if (list_empty(&gpio_devices)) {
+		/* initial entry in list */
 		list_add_tail(&gdev->list, &gpio_devices);
 		return 0;
 	}
 
-	list_for_each_entry(iterator, &gpio_devices, list) {
-		if (iterator->base >= gdev->base + gdev->ngpio) {
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
-				    <= gdev->base)
-					goto found;
-			}
-		}
-		previous = iterator;
+	next = list_entry(gpio_devices.next, struct gpio_device, list);
+	if (gdev->base + gdev->ngpio <= next->base) {
+		/* add before first entry */
+		list_add(&gdev->list, &gpio_devices);
+		return 0;
 	}
 
-	/*
-	 * We are beyond the last chip in the list and iterator now
-	 * points to the head.
-	 * Let iterator point to the last chip in the list.
-	 */
-
-	iterator = list_last_entry(&gpio_devices, struct gpio_device, list);
-	if (iterator->base + iterator->ngpio <= gdev->base) {
-		list_add(&gdev->list, &iterator->list);
+	prev = list_entry(gpio_devices.prev, struct gpio_device, list);
+	if (prev->base + prev->ngpio <= gdev->base) {
+		/* add behind last entry */
+		list_add_tail(&gdev->list, &gpio_devices);
 		return 0;
 	}
 
-	dev_err(&gdev->dev,
-	       "GPIO integer space overlap, cannot add chip\n");
-	return -EBUSY;
+	list_for_each_entry_safe(prev, next, &gpio_devices, list) {
+		/* at the end of the list */
+		if (&next->list == &gpio_devices)
+			break;
 
-found:
-	list_add_tail(&gdev->list, &iterator->list);
-	return 0;
+		/* add between prev and next */
+		if (prev->base + prev->ngpio <= gdev->base
+				&& gdev->base + gdev->ngpio <= next->base) {
+			list_add(&gdev->list, &prev->list);
+			return 0;
+		}
+	}
+
+	dev_err(&gdev->dev, "GPIO integer space overlap, cannot add chip\n");
+	return -EBUSY;
 }
 
 /**
-- 
2.6.2

