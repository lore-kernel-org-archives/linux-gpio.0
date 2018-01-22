From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Fix kernel stack leak to userspace
Date: Mon, 22 Jan 2018 13:21:46 +0100
Message-ID: <20180122122146.25689-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33582 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751057AbeAVMVw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 07:21:52 -0500
Received: by mail-lf0-f68.google.com with SMTP id t139so10336827lff.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 04:21:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>

The GPIO event descriptor was leaking kernel stack to
userspace because we don't zero the variable before
use. Ooops. Fix this.

Cc: stable@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 37e31ba82ca0..754836e4ca0e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -744,6 +744,9 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	struct gpioevent_data ge;
 	int ret, level;
 
+	/* Do not leak kernel stack to userspace */
+	memset(&ge, 0, sizeof(ge));
+
 	ge.timestamp = ktime_get_real_ns();
 	level = gpiod_get_value_cansleep(le->desc);
 
-- 
2.14.3

