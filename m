From: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Subject: [PATCH] gpiolib: friendly debug information for consumer
Date: Mon, 22 Jan 2018 21:28:37 -0800
Message-ID: <1516685317-12867-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx01.hxt-semitech.com.96.203.223.in-addr.arpa ([223.203.96.7]:35391
        "EHLO barracuda.hxt-semitech.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750756AbeAWF3I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jan 2018 00:29:08 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: treding@nvidia.com, grygorii.strashko@ti.com, linux-gpio@vger.kernel.org, Wang Dongsheng <dongsheng.wang@hxt-semitech.com>

mdiobus always try to get "reset" consumer, but not all platforms
have this capability. "failed" makes observer confuse when a
consumer can not find.

Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 14532d9..1f98ea6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3630,7 +3630,7 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	}
 
 	if (IS_ERR(desc)) {
-		dev_dbg(dev, "lookup for GPIO %s failed\n", con_id);
+		dev_dbg(dev, "Can not detect GPIO consumer %s\n", con_id);
 		return desc;
 	}
 
-- 
2.7.4

