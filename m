From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH] gpiolib: don't compare an unsigned for >= 0
Date: Tue, 18 Aug 2015 18:02:32 +0200
Message-ID: <1439913752-26634-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:36073 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752438AbbHRQCi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2015 12:02:38 -0400
Received: by wicja10 with SMTP id ja10so98748849wic.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2015 09:02:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Dirk Behme <dirk.behme@gmail.com>

The parameter offset is an unsigned, so it makes no sense to compare
it for >= 0. Fix the compiler warning regarding this by removing this
comparison.

As the macro GPIO_OFFSET_VALID is only used at this single place, simplify
the code by dropping the macro completely and dropping the invert, too.

No functional change.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 drivers/gpio/gpiolib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d..9841b05 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -47,8 +47,6 @@
  */
 DEFINE_SPINLOCK(gpio_lock);
 
-#define GPIO_OFFSET_VALID(chip, offset) (offset >= 0 && offset < chip->ngpio)
-
 static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_chips);
@@ -914,7 +912,7 @@ const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_desc *desc;
 
-	if (!GPIO_OFFSET_VALID(chip, offset))
+	if (offset >= chip->ngpio)
 		return NULL;
 
 	desc = &chip->desc[offset];
-- 
2.5.0

