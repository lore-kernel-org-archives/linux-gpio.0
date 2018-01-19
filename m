From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 12/12] gpio: davinci: Include proper header
Date: Fri, 19 Jan 2018 07:40:43 +0100
Message-ID: <20180119064043.18241-12-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42466 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754104AbeASGnZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:25 -0500
Received: by mail-lf0-f66.google.com with SMTP id q17so805635lfa.9
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:25 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index f75d8443ecaf..34fc0a167b7c 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -9,7 +9,7 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/clk.h>
-- 
2.14.3

