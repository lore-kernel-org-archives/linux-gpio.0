From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: unexport requested gpios on gpiochip removal
Date: Wed, 10 Jun 2015 16:34:21 +0200
Message-ID: <1433946861-22371-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:33403 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964870AbbFJOeC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 10:34:02 -0400
Received: by wgez8 with SMTP id z8so37343665wge.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 07:34:01 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Patrick Titiano <ptitiano@baylibre.com>, Benoit Cousson <bcousson@baylibre.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

When a GPIO expander device is removed - e.g. via i2c-adapter
new_device/delete_device interface - with some GPIOs still requested,
gpiochip_remove() function will emit a warning but remove the chip
anyway.

If we then reinstantiate this device and try to export any of the GPIOs
still requested on gpiochip deletion the following warning will be
emitted:

WARNING: CPU: 0 PID: 90 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x58/0x78()
sysfs: cannot create duplicate filename '/class/gpio/gpio504'
Modules linked in: gpio_pca953x ipv6
CPU: 0 PID: 90 Comm: sh Not tainted 4.0.0 #1
Hardware name: Generic AM33XX (Flattened Device Tree)
[<c0015ba0>] (unwind_backtrace) from [<c00121f4>] (show_stack+0x10/0x14)
[<c00121f4>] (show_stack) from [<c0592fb4>] (dump_stack+0x84/0x9c)
[<c0592fb4>] (dump_stack) from [<c003e6c8>] (warn_slowpath_common+0x7c/0xb8)
[<c003e6c8>] (warn_slowpath_common) from [<c003e734>] (warn_slowpath_fmt+0x30/0x40)
[<c003e734>] (warn_slowpath_fmt) from [<c01b7e48>] (sysfs_warn_dup+0x58/0x78)
[<c01b7e48>] (sysfs_warn_dup) from [<c01b815c>] (sysfs_do_create_link_sd.isra.2+0xb0/0xb8)
[<c01b815c>] (sysfs_do_create_link_sd.isra.2) from [<c03ab030>] (device_add+0x1e4/0x510)
[<c03ab030>] (device_add) from [<c03ab4e0>] (device_create_groups_vargs+0x9c/0xc0)
[<c03ab4e0>] (device_create_groups_vargs) from [<c03ab57c>] (device_create_with_groups+0x24/0x2c)
[<c03ab57c>] (device_create_with_groups) from [<c0353000>] (gpiod_export+0xf8/0x224)
[<c0353000>] (gpiod_export) from [<c035317c>] (export_store+0x50/0xd0)
[<c035317c>] (export_store) from [<c03ae200>] (class_attr_store+0x18/0x24)
[<c03ae200>] (class_attr_store) from [<c01b778c>] (sysfs_kf_write+0x4c/0x50)
[<c01b778c>] (sysfs_kf_write) from [<c01b69d0>] (kernfs_fop_write+0xbc/0x1a4)
[<c01b69d0>] (kernfs_fop_write) from [<c014d6fc>] (vfs_write+0xa4/0x1b0)
[<c014d6fc>] (vfs_write) from [<c014dd64>] (SyS_write+0x40/0x94)
[<c014dd64>] (SyS_write) from [<c000e6e0>] (ret_fast_syscall+0x0/0x4c)

sysfs_do_create_link_sd() fails due to dangling links in /sys/class/gpio
rendering these GPIOs unusable until reboot.

Instead of warning the user, just silently unexport all requested GPIOs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6bc612b..74a5e45 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -342,7 +342,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	spin_lock_irqsave(&gpio_lock, flags);
 	for (id = 0; id < chip->ngpio; id++) {
 		if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags))
-			dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
+			gpiod_unexport(&chip->desc[id]);
 	}
 	for (id = 0; id < chip->ngpio; id++)
 		chip->desc[id].chip = NULL;
-- 
2.1.4

