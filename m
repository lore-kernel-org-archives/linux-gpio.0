From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 01/12] gpio: 74x174: Include proper headers
Date: Fri, 19 Jan 2018 07:40:32 +0100
Message-ID: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42403 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751282AbeASGm5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:42:57 -0500
Received: by mail-lf0-f66.google.com with SMTP id q17so804318lfa.9
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:42:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h> or
<linux/of_gpio.h>. Cut them and include <linux/gpio/driver.h>
and <linux/gpio/consumer.h> which is it they really needs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-74x164.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 6b535ec858cc..3c25f504a784 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -9,12 +9,11 @@
  *  published by the Free Software Foundation.
  */
 
-#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/spi/spi.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 
-- 
2.14.3

