From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] gpio: ath79: Fix module autoload
Date: Tue, 18 Oct 2016 17:44:01 -0300
Message-ID: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:43125
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964886AbcJRUoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 16:44:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-gpio@vger.kernel.org, Alban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/gpio/gpio-ath79.ko | grep alias
$

After this patch:

$ modinfo drivers/gpio/gpio-ath79.ko | grep alias
alias:          of:N*T*Cqca,ar9340-gpioC*
alias:          of:N*T*Cqca,ar9340-gpio
alias:          of:N*T*Cqca,ar7100-gpioC*
alias:          of:N*T*Cqca,ar7100-gpio

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/gpio/gpio-ath79.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 9457e2022bf6..dc37dbe4b46d 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -219,6 +219,7 @@ static const struct of_device_id ath79_gpio_of_match[] = {
 	{ .compatible = "qca,ar9340-gpio" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
-- 
2.7.4

