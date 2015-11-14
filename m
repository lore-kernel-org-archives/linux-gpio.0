From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH 2/2] gpiolib: do not allow to insert an empty gpiochip
Date: Sat, 14 Nov 2015 16:38:56 +0800
Message-ID: <1447490336-10209-3-git-send-email-bamvor.zhangjian@linaro.org>
References: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36771 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbKNIjP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:39:15 -0500
Received: by pacdm15 with SMTP id dm15so123311273pac.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:39:14 -0800 (PST)
In-Reply-To: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
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
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cc135d9..868ff15 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -327,6 +327,9 @@ int gpiochip_add(struct gpio_chip *chip)
 	if (!descs)
 		return -ENOMEM;
 
+	if (chip->ngpio == 0)
+		return -EINVAL;
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	if (base < 0) {
-- 
2.1.4

