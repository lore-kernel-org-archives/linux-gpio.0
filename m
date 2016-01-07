From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] gpio: mm-lantiq: Do not use gpiochip_get_data() in ltq_mm_save_regs()
Date: Thu,  7 Jan 2016 08:24:58 -0800
Message-ID: <1452183898-19343-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53811 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256AbcAGQZC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 11:25:02 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, John Crispin <blogic@openwrt.org>

Commit 6aa7dbfa2877 ("gpio: mm-lantiq: use gpiochip data pointer") replaces
the use of container_of() with gpiochip_get_data(). However, the data
pointer is not yet set by the time the save_regs function is called.

Fixes: 6aa7dbfa2877 ("gpio: mm-lantiq: use gpiochip data pointer")
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
It might make sense to merge this patch into the patch causing the problem.

 drivers/gpio/gpio-mm-lantiq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index a2071ed69f79..54e5d8257d34 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -91,7 +91,8 @@ static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
  */
 static void ltq_mm_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct ltq_mm *chip = gpiochip_get_data(&mm_gc->gc);
+	struct ltq_mm *chip =
+		container_of(mm_gc, struct ltq_mm, mmchip);
 
 	/* tell the ebu controller which memory address we will be using */
 	ltq_ebu_w32(CPHYSADDR(chip->mmchip.regs) | 0x1, LTQ_EBU_ADDRSEL1);
-- 
2.1.4

