From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH] gpiolib: keep comment consistent with code
Date: Sat, 14 Nov 2015 16:43:20 +0800
Message-ID: <1447490600-12449-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:35139 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbKNInb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:43:31 -0500
Received: by pacej9 with SMTP id ej9so16769439pac.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:43:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

The commit f881bab038c9 ("gpio: keep the GPIO line names internal")
change the error to warning in gpiochip_set_desc_names. Update the
comment accordingly.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 868ff15..d233d0f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -271,7 +271,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
  * Takes the names from gc->names and checks if they are all unique. If they
  * are, they are assigned to their gpio descriptors.
  *
- * Returns -EEXIST if one of the names is already used for a different GPIO.
+ * Warning if one of the names is already used for a different GPIO.
  */
 static int gpiochip_set_desc_names(struct gpio_chip *gc)
 {
-- 
2.1.4

