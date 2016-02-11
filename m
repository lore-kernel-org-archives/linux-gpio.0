From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] gpiolib refactorings after device addition
Date: Thu, 11 Feb 2016 11:26:17 +0100
Message-ID: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:34148 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158AbcBKK0c (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:32 -0500
Received: by mail-wm0-f48.google.com with SMTP id 128so14678552wmz.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

This is a series of refactorings which is basically internalizing
some of the stuff from the gpio_chip managed and owned by each
subdriver over into the gpio_device which is managed and owned by
the gpiolib core.

I will merge them soon-ish unless there are major comments, as it
IMO completes a step in the transition to the new device and
chardev-backed gpiolib.

Linus Walleij (6):
  gpio: remember to finally free gpio_device
  gpio: move sysfs mock device to the gpio_device
  gpio: move descriptors into gpio_device
  gpio: reflect base and ngpio into gpio_device
  gpio: reference count the gpio device for each desc
  gpio: move the pin ranges into gpio_device

 drivers/gpio/gpiolib-sysfs.c |  35 ++---
 drivers/gpio/gpiolib.c       | 317 ++++++++++++++++++++++---------------------
 drivers/gpio/gpiolib.h       |  23 +++-
 include/linux/gpio/driver.h  |   4 -
 4 files changed, 198 insertions(+), 181 deletions(-)

-- 
2.4.3

