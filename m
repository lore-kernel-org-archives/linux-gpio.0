From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH v2] gpio-sch: set output level after configuration of direction
Date: Mon,  7 Apr 2014 14:20:32 +0200
Message-ID: <1396873232-19888-1-git-send-email-alexander.stein@systec-electronic.com>
References: <20140327190507.GX3998@book.gsilab.sittig.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:49826 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754826AbaDGMVt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 08:21:49 -0400
In-Reply-To: <20140327190507.GX3998@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Alexander Stein <alexander.stein@systec-electronic.com>

From: Daniel Krueger <daniel.krueger@systec-electronic.com>

According to the datasheet, writing to the level register has no effect
when GPIO is programmed as input. Actually the the level register is
read-only when configured as input. Thus presetting the output level
before switching to output is _NOT_ possible. Any writes are lost!
Hence we set the level after configuring the GPIO as output.
But we cannot prevent a short low pulse if direction is set to high and
an external  pull-up is connected.

Signed-off-by: Daniel Krueger <daniel.krueger@systec-electronic.com>
Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
Changes in v2:
* Adjusted commited message to make clear that writes are lost when GPIO
is configured as input.

 drivers/gpio/gpio-sch.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index 5af6571..a9b1cd1 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -97,8 +97,6 @@ static int sch_gpio_core_direction_out(struct gpio_chip *gc,
 	u8 curr_dirs;
 	unsigned short offset, bit;
 
-	sch_gpio_core_set(gc, gpio_num, val);
-
 	spin_lock(&gpio_lock);
 
 	offset = CGIO + gpio_num / 8;
@@ -109,6 +107,17 @@ static int sch_gpio_core_direction_out(struct gpio_chip *gc,
 		outb(curr_dirs & ~(1 << bit), gpio_ba + offset);
 
 	spin_unlock(&gpio_lock);
+
+	/*
+	 * according to the datasheet, writing to the level register has no
+	 * effect when GPIO is programmed as input.
+	 * Actually the the level register is read-only when configured as input.
+	 * Thus presetting the output level before switching to output is _NOT_ possible.
+	 * Hence we set the level after configuring the GPIO as output.
+	 * But we cannot prevent a short low pulse if direction is set to high
+	 * and an external pull-up is connected.
+	 */
+	sch_gpio_core_set(gc, gpio_num, val);
 	return 0;
 }
 
@@ -178,8 +187,6 @@ static int sch_gpio_resume_direction_out(struct gpio_chip *gc,
 	u8 curr_dirs;
 	unsigned short offset, bit;
 
-	sch_gpio_resume_set(gc, gpio_num, val);
-
 	offset = RGIO + gpio_num / 8;
 	bit = gpio_num % 8;
 
@@ -190,6 +197,17 @@ static int sch_gpio_resume_direction_out(struct gpio_chip *gc,
 		outb(curr_dirs & ~(1 << bit), gpio_ba + offset);
 
 	spin_unlock(&gpio_lock);
+
+	/*
+	* according to the datasheet, writing to the level register has no
+	* effect when GPIO is programmed as input.
+	* Actually the the level register is read-only when configured as input.
+	* Thus presetting the output level before switching to output is _NOT_ possible.
+	* Hence we set the level after configuring the GPIO as output.
+	* But we cannot prevent a short low pulse if direction is set to high
+	* and an external pull-up is connected.
+	*/
+	sch_gpio_resume_set(gc, gpio_num, val);
 	return 0;
 }
 
-- 
1.8.3.2

