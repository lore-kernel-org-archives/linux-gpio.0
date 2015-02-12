From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: [PATCH] gpio: mpc8xxx: Fix section mistmatch(es)
Date: Thu, 12 Feb 2015 15:53:14 -0600
Message-ID: <1423777994-17925-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bn0109.outbound.protection.outlook.com ([157.56.110.109]:36410
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750959AbbBLWcf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 Feb 2015 17:32:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, jacmet@sunsite.dk, ricardo.ribalda@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com
Cc: Emil Medve <Emilian.Medve@Freescale.com>

WARNING: drivers/gpio/built-in.o(.text+0x3962): Section mismatch in reference from the function mpc8xxx_probe() to the variable .init.data:mpc8xxx_gpio_ids
The function mpc8xxx_probe() references
the variable __initdata mpc8xxx_gpio_ids.
This is often because mpc8xxx_probe lacks a __initdata
annotation or the annotation of mpc8xxx_gpio_ids is wrong.

WARNING: drivers/gpio/built-in.o(.text+0x396a): Section mismatch in reference from the function mpc8xxx_probe() to the variable .init.data:mpc8xxx_gpio_ids
The function mpc8xxx_probe() references
the variable __initdata mpc8xxx_gpio_ids.
This is often because mpc8xxx_probe lacks a __initdata
annotation or the annotation of mpc8xxx_gpio_ids is wrong.

WARNING: drivers/gpio/built-in.o(.data+0x48): Section mismatch in reference from the variable mpc8xxx_plat_driver to the variable .init.data:mpc8xxx_gpio_ids
The variable mpc8xxx_plat_driver references
the variable __initdata mpc8xxx_gpio_ids
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Introduced in '98686d9a5 gpio: mpc8xxx: Convert to platform device interface'

Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6952ba3..59c4c11 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -334,7 +334,7 @@ static struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
-static struct of_device_id mpc8xxx_gpio_ids[] __initdata = {
+static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc8349-gpio", },
 	{ .compatible = "fsl,mpc8572-gpio", },
 	{ .compatible = "fsl,mpc8610-gpio", },
-- 
2.3.0

