From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH -next] gpio: Use kzalloc() to allocate struct gpio_device to fix crash
Date: Tue, 16 Feb 2016 11:22:51 +0100
Message-ID: <1455618171-11719-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:42928 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754551AbcBPKW5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 05:22:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

gpiochip_add_data() allocates the struct gpio_device using kmalloc(),
which doesn't zero the returned memory.

Hence when calling dev_set_name(), it may try to free a bogus old name,
causing a crash:

    Unable to handle kernel NULL pointer dereference at virtual address 00000000
    ...
    Backtrace:
    [<c01c9258>] (kfree) from [<c01a701c>] (kfree_const+0x28/0x34)
     r9:eea77210 r8:ffffffff r7:00000001 r6:eea77008 r5:eea77010 r4:ee13afc0
    [<c01a6ff4>] (kfree_const) from [<c02c47cc>] (kobject_set_name_vargs+0x90/0xa0)
    [<c02c473c>] (kobject_set_name_vargs) from [<c038b374>] (dev_set_name+0x28/0x30)
     r6:eea77008 r5:eea7721c r4:eea77000 r3:00001743
    [<c038b350>] (dev_set_name) from [<c02ed200>] (gpiochip_add_data+0xa8/0x5e4)
     r3:00001743 r2:00000001 r1:c083b195
    [<c02ed158>] (gpiochip_add_data) from [<c02f0890>] (gpio_rcar_probe+0x228/0x344)
     r10:ee922e9c r9:ee922e00 r8:0000001a r7:eea7721c r6:ee90e010 r5:ee922e80
     r4:eea77210
    [<c02f0668>] (gpio_rcar_probe) from [<c0390220>] (platform_drv_probe+0x58/0xa8)

Use kzalloc() instead of kmalloc() to fix this.

See also the comment for device_initialize():

    All fields in @dev must be initialized by the caller to 0, except
    for those explicitly set to some other value.  The simplest
    approach is to use kzalloc() to allocate the structure containing
    @dev.

Fixes: ff2b135922992756 ("gpio: make the gpiochip a real device")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aa4a60e19339b8b5..dc49ba3fe5acf089 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -435,7 +435,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	 * First: allocate and populate the internal stat container, and
 	 * set up the struct device.
 	 */
-	gdev = kmalloc(sizeof(*gdev), GFP_KERNEL);
+	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
 	if (!gdev)
 		return -ENOMEM;
 	gdev->dev.bus = &gpio_bus_type;
-- 
1.9.1

