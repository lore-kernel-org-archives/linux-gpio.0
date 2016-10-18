From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/2] gpio: ts4800: Fix module autoload
Date: Tue, 18 Oct 2016 17:44:02 -0300
Message-ID: <1476823442-31104-2-git-send-email-javier@osg.samsung.com>
References: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:43129
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965068AbcJRUoR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 16:44:17 -0400
In-Reply-To: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/gpio/gpio-ts4800.ko | grep alias
$

After this patch:

$ modinfo drivers/gpio/gpio-ts4800.ko | grep alias
alias:          of:N*T*Ctechnologic,ts4800-gpioC*
alias:          of:N*T*Ctechnologic,ts4800-gpio

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/gpio/gpio-ts4800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 99256115bea5..c2a80b4cbf32 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -66,6 +66,7 @@ static const struct of_device_id ts4800_gpio_of_match[] = {
 	{ .compatible = "technologic,ts4800-gpio", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, ts4800_gpio_of_match);
 
 static struct platform_driver ts4800_gpio_driver = {
 	.driver = {
-- 
2.7.4

