From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH] pch_gpio: set value before enabling output direction
Date: Tue, 25 Mar 2014 10:32:47 +0100
Message-ID: <1395739967-8465-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:56601 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751067AbaCYJkS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 25 Mar 2014 05:40:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Daniel Krueger <daniel.krueger@systec-electronic.com>, Alexander Stein <alexander.stein@systec-electronic.com>

From: Daniel Krueger <daniel.krueger@systec-electronic.com>

This ensures that the output signal does not toggle if set to high.

Signed-off-by: Daniel Krueger <daniel.krueger@systec-electronic.com>
Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-pch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 9656c19..83a1563 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -138,9 +138,6 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
-	pm = ioread32(&chip->reg->pm) & ((1 << gpio_pins[chip->ioh]) - 1);
-	pm |= (1 << nr);
-	iowrite32(pm, &chip->reg->pm);
 
 	reg_val = ioread32(&chip->reg->po);
 	if (val)
@@ -148,6 +145,11 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	else
 		reg_val &= ~(1 << nr);
 	iowrite32(reg_val, &chip->reg->po);
+
+	pm = ioread32(&chip->reg->pm) & ((1 << gpio_pins[chip->ioh]) - 1);
+	pm |= (1 << nr);
+	iowrite32(pm, &chip->reg->pm);
+
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 
 	return 0;
-- 
1.8.3.2

