From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: discourage passing base to gpio_chip
Date: Wed, 13 May 2015 13:04:55 +0200
Message-ID: <1431515095-29107-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:35299 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbbEMLFA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 07:05:00 -0400
Received: by lbbuc2 with SMTP id uc2so26611879lbb.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2015 04:04:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Passing a fixed base in struct gpio_chip is done for legacy
systems that cannot handle dynamic allocation. Discourage this
behaviour in the kerneldoc.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/driver.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 96a678842cde..cc7ec129b329 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -42,8 +42,12 @@ struct seq_file;
  * @dbg_show: optional routine to show contents in debugfs; default code
  *	will be used when this is omitted, but custom code can show extra
  *	state (such as pullup/pulldown configuration).
- * @base: identifies the first GPIO number handled by this chip; or, if
- *	negative during registration, requests dynamic ID allocation.
+ * @base: identifies the first GPIO number handled by this chip;
+ *	or, if negative during registration, requests dynamic ID allocation.
+ *	DEPRECATION: providing anything non-negative and nailing the base
+ *	base offset of GPIO chips is deprecated. Please pass -1 as base to
+ *	let gpiolib select the chip base in all possible cases. We want to
+ *	get rid of the static GPIO number space in the long run.
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
  *	handled is (base + ngpio - 1).
  * @desc: array of ngpio descriptors. Private.
-- 
1.9.3

