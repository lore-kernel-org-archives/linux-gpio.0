From: Amitesh Singh <singh.amitesh@gmail.com>
Subject: [PATCH] gpio: fix documentation for gpiod_unexport
Date: Thu, 8 Sep 2016 17:11:20 +0530
Message-ID: <20160908114115.GA5471@ami-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:35711 "EHLO
        mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751420AbcIHLl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 07:41:27 -0400
Received: by mail-pa0-f68.google.com with SMTP id pp5so2316412pac.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2016 04:41:27 -0700 (PDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Both gpio_export and gpio_free APIs are obsolete now.

Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>
---
 drivers/gpio/gpiolib-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 932e510..4b44dd9 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -670,10 +670,10 @@ int gpiod_export_link(struct device *dev, const char *name,
 EXPORT_SYMBOL_GPL(gpiod_export_link);
 
 /**
- * gpiod_unexport - reverse effect of gpio_export()
+ * gpiod_unexport - reverse effect of gpiod_export()
  * @gpio: gpio to make unavailable
  *
- * This is implicit on gpio_free().
+ * This is implicit on gpiod_free().
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-- 
2.7.4

 Both gpio_export and gpio_free APIs are obsolete now.
    
    Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>
