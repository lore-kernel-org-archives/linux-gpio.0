From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] gpiolib: fix warning about iterator
Date: Sun, 27 Dec 2015 19:06:50 +0530
Message-ID: <1451223410-8985-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <CACRpkdZA7m=YzjVmQwzoKNzMu+QiOeA9s3Wu_axZYMw=5j-LnQ@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33098 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786AbbL0Ng5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 08:36:57 -0500
In-Reply-To: <CACRpkdZA7m=YzjVmQwzoKNzMu+QiOeA9s3Wu_axZYMw=5j-LnQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

We were getting build warning about "iterator" being used uninitialized.
Use iterator properly to fix the build warning and in the process remove
the variable "pos" which is not required now.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

v1: at the end of the loop iterator will point to head and we are trying
to check its field.

 drivers/gpio/gpiolib.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d72ac1f..6972b4e 100644
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
@@ -221,7 +219,13 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 		previous = iterator;
 	}
 
-	/* We are beyond the last chip in the list */
+	/*
+	 * We are beyond the last chip in the list and iterator now
+	 * points to the head.
+	 * Let iterator point to the last chip in the list.
+	 */
+
+	iterator = list_last_entry(&gpio_chips, struct gpio_chip, list);
 	if (iterator->base + iterator->ngpio <= chip->base)
 		goto found;
 
@@ -230,7 +234,7 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	return -EBUSY;
 
 found:
-	list_add_tail(&chip->list, pos);
+	list_add_tail(&chip->list, &iterator->list);
 	return 0;
 }
 
-- 
1.9.1

