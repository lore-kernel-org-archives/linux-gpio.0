From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] gpio: gpio-tb10x: remove incorrect __exit markup
Date: Mon, 9 Mar 2015 11:04:09 -0700
Message-ID: <20150309180409.GA24645@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:46381 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433AbbCISEO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 14:04:14 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Even if bus is not hot-pluggable, the devices can be unbound from the
driver via sysfs, so we should not be using __exit annotations on
remove() methods. The only exception is drivers registered with
platform_driver_probe() which specifically disables sysfs bind/unbind
attributes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-tb10x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 62ab9f4..46b8961 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -283,7 +283,7 @@ fail_ioremap:
 	return ret;
 }
 
-static int __exit tb10x_gpio_remove(struct platform_device *pdev)
+static int tb10x_gpio_remove(struct platform_device *pdev)
 {
 	struct tb10x_gpio *tb10x_gpio = platform_get_drvdata(pdev);
 
-- 
2.2.0.rc0.207.ga3a616c


-- 
Dmitry
