From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 001/182] gpio: forward-declare enum gpiod_flags
Date: Wed,  9 Dec 2015 14:11:06 +0100
Message-ID: <1449666666-29660-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36465 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINLO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:11:14 -0500
Received: by lfs39 with SMTP id 39so34036485lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:11:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This enum is used in the gpiolib.h header file, yet
<linux/gpio/consumer.h> is not included so plainly including this
file (and some drivers do) will raise compile problems.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2b87cbd68478..0a7c02d76909 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,7 +16,7 @@
 #include <linux/device.h>
 
 enum of_gpio_flags;
-
+enum gpiod_flags;
 struct acpi_device;
 
 /**
-- 
2.4.3

