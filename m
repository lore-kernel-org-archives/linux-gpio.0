From: Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: [PATCH] gpiolib: fix crash when gpiochip removed
Date: Sat, 20 Feb 2016 13:13:19 +0800
Message-ID: <1455945199-5068-1-git-send-email-bamv2005@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35407 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756806AbcBTFNo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2016 00:13:44 -0500
Received: by mail-pa0-f41.google.com with SMTP id ho8so62811077pac.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 21:13:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Commit cb464a88e1ed ("gpio: make the gpiochip a real device") call
gpiochip_sysfs_unregister after the gpiochip is empty. It lead to the
following crash:

[  163.503994] Unable to handle kernel NULL pointer dereference at virtual address 0000007c
[...]
[  163.525394] [<ffffffc0003719a0>] gpiochip_sysfs_unregister+0x44/0xa4
[  163.525611] [<ffffffc00036f6a0>] gpiochip_remove+0x24/0x154
[  163.525861] [<ffffffbffc00f0a4>] mockup_gpio_remove+0x38/0x64 [gpio_mockup]
[  163.526101] [<ffffffc00042b4b4>] platform_drv_remove+0x24/0x64
[  163.526313] [<ffffffc000429cc8>] __device_release_driver+0x7c/0xfc
[  163.526525] [<ffffffc000429e54>] driver_detach+0xbc/0xc0
[  163.526700] [<ffffffc000429014>] bus_remove_driver+0x58/0xac
[  163.526883] [<ffffffc00042a4cc>] driver_unregister+0x2c/0x4c
[  163.527067] [<ffffffc00042b5c0>] platform_driver_unregister+0x10/0x18
[  163.527284] [<ffffffbffc00f340>] mock_device_exit+0x10/0x38 [gpio_mockup]
[  163.527593] [<ffffffc00011cefc>] SyS_delete_module+0x1b8/0x1fc
[  163.527799] [<ffffffc000085d8c>] __sys_trace_return+0x0/0x4
[  163.528049] Code: 940d74b4 f9019abf aa1303e0 940d7439 (7940fac0)
[  163.536273] ---[ end trace 3d1329be504af609 ]---

This patch fix this by changing the code back.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59f0045..7181807 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -624,11 +624,10 @@ void gpiochip_remove(struct gpio_chip *chip)
 	unsigned	i;
 	bool		requested = false;
 
-	/* Numb the device, cancelling all outstanding operations */
-	gdev->chip = NULL;
-
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
+	/* Numb the device, cancelling all outstanding operations */
+	gdev->chip = NULL;
 	gpiochip_irqchip_remove(chip);
 	acpi_gpiochip_remove(chip);
 	gpiochip_remove_pin_ranges(chip);
-- 
2.6.2

