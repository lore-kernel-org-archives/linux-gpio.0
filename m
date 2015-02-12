From: Kevin Hao <haokexin@gmail.com>
Subject: [PATCH] gpio: mpc8xxx: remove __initdata annotation for mpc8xxx_gpio_ids[]
Date: Thu, 12 Feb 2015 14:52:49 +0800
Message-ID: <1423723969-26931-1-git-send-email-haokexin@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f44.google.com ([209.85.213.44]:37086 "EHLO
	mail-yh0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbbBLGxQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Feb 2015 01:53:16 -0500
Received: by mail-yh0-f44.google.com with SMTP id f73so3715753yha.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2015 22:53:16 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

Since commit 98686d9a52ee ("gpio: mpc8xxx: Convert to platform device
interface"), we get the following section mismatch warning. Remove the
__initdata annotation to fix it.
  WARNING: vmlinux.o(.data+0xbc28): Section mismatch in reference from the variable mpc8xxx_plat_driver to the variable .init.data:mpc8xxx_gpio_ids
  The variable mpc8xxx_plat_driver references
  the variable __initdata mpc8xxx_gpio_ids
  If the reference is valid then annotate the
  variable with __init* or __refdata (see linux/init.h) or name the variable:
  *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6952ba343a8..a65b75161aa4 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -334,7 +334,7 @@ static struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
-static struct of_device_id mpc8xxx_gpio_ids[] __initdata = {
+static struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc8349-gpio", },
 	{ .compatible = "fsl,mpc8572-gpio", },
 	{ .compatible = "fsl,mpc8610-gpio", },
-- 
1.9.3

