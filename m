From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Clarify that <linux/gpio.h> is legacy
Date: Thu, 30 Nov 2017 11:04:53 +0100
Message-ID: <20171130100453.29561-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:43529 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750984AbdK3KE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 05:04:58 -0500
Received: by mail-lf0-f67.google.com with SMTP id 94so7219349lfy.10
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 02:04:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

It should be clear to developers that they should not include
this file in new code.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
While I should certainly try to fix checkpatch.pl to warn
about this, it doesn't hurt to spell it out in the file as well.
---
 include/linux/gpio.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 8ef7fc0ce0f0..91ed23468530 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -1,4 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * <linux/gpio.h>
+ *
+ * This is the LEGACY GPIO bulk include file, including legacy APIs. It is
+ * used for GPIO drivers still referencing the global GPIO numberspace,
+ * and should not be included in new code.
+ *
+ * If you're implementing a GPIO driver, only include <linux/gpio/driver.h>
+ * If you're implementing a GPIO consumer, only include <linux/gpio/consumer.h>
+ */
 #ifndef __LINUX_GPIO_H
 #define __LINUX_GPIO_H
 
-- 
2.14.3

