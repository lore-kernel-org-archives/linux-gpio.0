From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/12] gpio: da905x: Include proper header
Date: Fri, 19 Jan 2018 07:40:42 +0100
Message-ID: <20180119064043.18241-11-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:45105 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754104AbeASGnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:24 -0500
Received: by mail-lf0-f68.google.com with SMTP id x196so798549lfd.12
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:23 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

These drivers has no business including <linux/gpio.h>, they
are drivers so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-da9052.c | 2 +-
 drivers/gpio/gpio-da9055.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index dd8977cf3e85..b6d3e997eb26 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -15,7 +15,7 @@
 #include <linux/fs.h>
 #include <linux/uaccess.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/syscalls.h>
 #include <linux/seq_file.h>
 
diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 82053b52cba0..2f1b5d23b10c 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -13,7 +13,7 @@
  */
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 #include <linux/mfd/da9055/core.h>
 #include <linux/mfd/da9055/reg.h>
-- 
2.14.3

