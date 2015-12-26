From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] gpiolib: fix warning about iterator
Date: Sat, 26 Dec 2015 13:28:39 +0530
Message-ID: <1451116719-19158-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34116 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbbLZH6p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Dec 2015 02:58:45 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

We were getting build warning about "iterator" being used uninitialized.
Use iterator properly to fix the build warning and in the process remove
the variable "pos" which is not required now.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/gpio/gpiolib.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d72ac1f..3619ce4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -189,23 +189,21 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  */
 static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
-	struct list_head *pos;
 	struct gpio_chip *iterator;
 	struct gpio_chip *previous = NULL;
 
 	if (list_empty(&gpio_chips)) {
-		pos = gpio_chips.next;
-		goto found;
+		list_add_tail(&chip->list, &gpio_chips);
+		return 0;
 	}
 
-	list_for_each(pos, &gpio_chips) {
-		iterator = list_entry(pos, struct gpio_chip, list);
+	list_for_each_entry(iterator, &gpio_chips, list) {
 		if (iterator->base >= chip->base + chip->ngpio) {
 			/*
 			 * Iterator is the first GPIO chip so there is no
 			 * previous one
 			 */
-			if (previous == NULL) {
+			if (!previous) {
 				goto found;
 			} else {
 				/*
@@ -230,7 +228,7 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	return -EBUSY;
 
 found:
-	list_add_tail(&chip->list, pos);
+	list_add_tail(&chip->list, &iterator->list);
 	return 0;
 }
 
-- 
1.9.1

