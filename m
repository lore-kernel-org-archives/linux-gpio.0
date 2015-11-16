From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH V2 2/2] gpiolib: do not allow to insert an empty gpiochip
Date: Mon, 16 Nov 2015 13:02:47 +0800
Message-ID: <1447650167-29070-3-git-send-email-bamvor.zhangjian@linaro.org>
References: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33210 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbbKPFDE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 00:03:04 -0500
Received: by pabfh17 with SMTP id fh17so164607670pab.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2015 21:03:04 -0800 (PST)
In-Reply-To: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

We need to check if number of gpio is positive if there is no
such check in devicetree or acpi or whatever called before
gpiochip_add.

I suppose that devicetree and acpi do not allow insert gpiochip
with zero number but I do not know if it is enough to ignore
this check in gpiochip_add.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 270d60b..150af91 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -329,6 +329,11 @@ int gpiochip_add(struct gpio_chip *chip)
 	if (!descs)
 		return -ENOMEM;
 
+	if (chip->ngpio == 0) {
+		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	if (base < 0) {
-- 
2.1.4

