From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: [RFD] does abi of sysfs of gpio change?
Date: Wed, 24 Feb 2016 22:35:57 +0800
Message-ID: <CAFy1UST8fzsM6tq4_yAZ1XbPyaMg4a0kBm5-_8r0E8NpgwGYag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:36494 "EHLO
	mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbcBXOf5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 09:35:57 -0500
Received: by mail-io0-f170.google.com with SMTP id l127so42470630iof.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Feb 2016 06:35:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Alexandre Courbot <acourbot@nvidia.com>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, guys

I am working on writing a gpio mockup driver(for test the gpio framework).
I found that in the lastest for-next branch of linux-gpio, the path of gpiochip
in device directory is changed from
`/sys/devices/platform/gpio-mockup/gpio/gpiochip*`
to
`/sys/devices/platform/gpio-mockup/gpiochip*/gpio`.

And secondly, the name of gpiochip in the devices directory is changed from
gpiochipBASE to gpiochipSEQ, e.g. there are two gpiochip([0,31],[32,63]) in my
device. It changed from
`/sys/devices/platform/gpio-mockup/gpio/gpiochip0`
`/sys/devices/platform/gpio-mockup/gpio/gpiochip32`
to
`/sys/devices/platform/gpio-mockup/gpiochip0/gpio`
`/sys/devices/platform/gpio-mockup/gpiochip1/gpio`

IIUC, this change may break the script which depend on it.
Is it intended to do it?

And it could be fix by reverting one line from commit 5031fbdf5365
("gpio: move sysfs mock device to the gpio_device").

Regards

Bamvor

>From be7699ddea0fd0e2b0712cc8f50318595cad553c Mon Sep 17 00:00:00 2001
From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Date: Wed, 24 Feb 2016 22:17:19 +0800
Subject: [PATCH] fix abi changes of sysfs

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
drivers/gpio/gpiolib-sysfs.c | 8 +++++++-
1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c563094..db39464 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -721,6 +721,7 @@ EXPORT_SYMBOL_GPL(gpiod_unexport);
int gpiochip_sysfs_register(struct gpio_device *gdev)
{
   struct device   *dev;
+   struct device   *parent;
   struct gpio_chip *chip = gdev->chip;

   /*
@@ -733,7 +734,12 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
       return 0;

   /* use chip->base for the ID; it's already known to be unique */
-   dev = device_create_with_groups(&gpio_class, &gdev->dev,
+   if (chip->parent)
+       parent = chip->parent;
+   else
+       parent = &gdev->dev;
+
+   dev = device_create_with_groups(&gpio_class, parent,
                   MKDEV(0, 0),
                   chip, gpiochip_groups,
                   "gpiochip%d", chip->base);
--
2.6.2
