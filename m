From: weiyj_lk@163.com
Subject: [PATCH -next] gpiolib: remove duplicated include from gpiolib.c
Date: Wed,  6 Jul 2016 12:26:52 +0000
Message-ID: <1467808012-32321-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m12-13.163.com ([220.181.12.13]:47439 "EHLO m12-13.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753767AbcGFM1c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 6 Jul 2016 08:27:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpiolib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7c47c46..9f57d1e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -16,7 +16,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/idr.h>
 #include <linux/cdev.h>
 #include <linux/fs.h>
 #include <linux/uaccess.h>


