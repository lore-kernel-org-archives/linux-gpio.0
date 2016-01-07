From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: [PATCH] gpiolib: fix chip order in gpio list
Date: Thu,  7 Jan 2016 16:46:45 -0500
Message-ID: <1452203205-4660-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:40904 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709AbcAGVwg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 16:52:36 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com, bamvor.zhangjian@linaro.org, Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

In some situations the gpio_list order is not correct.
As a consequence gpiochip_find_base returns the same
base number twice. This happens when a first ship is added
with manual base number, then other ships are added using
automatic base number.

To prevent this behaviour, this patch add the new ship after
the last element of the gpio list.

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3db34e7..a180573 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -226,8 +226,10 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
 	 */
 
 	iterator = list_last_entry(&gpio_chips, struct gpio_chip, list);
-	if (iterator->base + iterator->ngpio <= chip->base)
-		goto found;
+	if (iterator->base + iterator->ngpio <= chip->base) {
+		list_add(&chip->list, &iterator->list);
+		return 0;
+	}
 
 	dev_err(chip->parent,
 	       "GPIO integer space overlap, cannot add chip\n");
-- 
2.5.0

