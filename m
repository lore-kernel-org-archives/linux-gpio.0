From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH] gpio-sch: set output level after configuration of direction
Date: Tue, 25 Mar 2014 10:33:26 +0100
Message-ID: <1395740006-8554-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:56602 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751074AbaCYJkS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 25 Mar 2014 05:40:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Daniel Krueger <daniel.krueger@systec-electronic.com>, Alexander Stein <alexander.stein@systec-electronic.com>

From: Daniel Krueger <daniel.krueger@systec-electronic.com>

According to the datasheet, writing to the level register has no effect
when GPIO is programmed as input. Hence we set the level after configuring
the GPIO as output. But we cannot prevent a short low pulse if direction is
set to high and an external pull-up is connected.

Signed-off-by: Daniel Krueger <daniel.krueger@systec-electronic.com>
Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-sch.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index 5af6571..e5f3e2e 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -97,8 +97,6 @@ static int sch_gpio_core_direction_out(struct gpio_chip *gc,
 	u8 curr_dirs;
 	unsigned short offset, bit;
 
-	sch_gpio_core_set(gc, gpio_num, val);
-
 	spin_lock(&gpio_lock);
 
 	offset = CGIO + gpio_num / 8;
@@ -109,6 +107,15 @@ static int sch_gpio_core_direction_out(struct gpio_chip *gc,
 		outb(curr_dirs & ~(1 << bit), gpio_ba + offset);
 
 	spin_unlock(&gpio_lock);
+
+	/*
+	 * according to the datasheet, writing to the level register has no
+	 * effect when GPIO is programmed as input.
+	 * Hence we set the level after configuring the GPIO as output.
+	 * But we cannot prevent a short low pulse if direction is set to high
+	 * and an external pull-up is connected.
+	 */
+	sch_gpio_core_set(gc, gpio_num, val);
 	return 0;
 }
 
@@ -178,8 +185,6 @@ static int sch_gpio_resume_direction_out(struct gpio_chip *gc,
 	u8 curr_dirs;
 	unsigned short offset, bit;
 
-	sch_gpio_resume_set(gc, gpio_num, val);
-
 	offset = RGIO + gpio_num / 8;
 	bit = gpio_num % 8;
 
@@ -190,6 +195,15 @@ static int sch_gpio_resume_direction_out(struct gpio_chip *gc,
 		outb(curr_dirs & ~(1 << bit), gpio_ba + offset);
 
 	spin_unlock(&gpio_lock);
+
+	/*
+	 * according to the datasheet, writing to the level register has no
+	 * effect when GPIO is programmed as input.
+	 * Hence we set the level after configuring the GPIO as output.
+	 * But we cannot prevent a short low pulse if direction is set to high
+	 * and an external pull-up is connected.
+	 */
+	sch_gpio_resume_set(gc, gpio_num, val);
 	return 0;
 }
 
-- 
1.8.3.2

