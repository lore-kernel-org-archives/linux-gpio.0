From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/8] extcon: gpio: Localize platform data
Date: Sun, 24 Sep 2017 16:56:16 +0200
Message-ID: <20170924145622.4031-3-linus.walleij@linaro.org>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:44971 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752540AbdIXO6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Sep 2017 10:58:51 -0400
Received: by mail-pg0-f52.google.com with SMTP id j16so2734207pga.1
        for <linux-gpio@vger.kernel.org>; Sun, 24 Sep 2017 07:58:51 -0700 (PDT)
In-Reply-To: <20170924145622.4031-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>

Nothing in the entire kernel #includes <linux/extcon/extcon-gpio.h>
so move the platform data declaration inside of the driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c       | 22 +++++++++++++++++-
 include/linux/extcon/extcon-gpio.h | 47 --------------------------------------
 2 files changed, 21 insertions(+), 48 deletions(-)
 delete mode 100644 include/linux/extcon/extcon-gpio.h

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index ebed22f22d75..6abf5f70fdbf 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -18,7 +18,6 @@
  */
 
 #include <linux/extcon.h>
-#include <linux/extcon/extcon-gpio.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
@@ -29,6 +28,27 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
+/**
+ * struct gpio_extcon_pdata - A simple GPIO-controlled extcon device.
+ * @extcon_id:		The unique id of specific external connector.
+ * @gpio:		Corresponding GPIO.
+ * @gpio_active_low:	Boolean describing whether gpio active state is 1 or 0
+ *			If true, low state of gpio means active.
+ *			If false, high state of gpio means active.
+ * @debounce:		Debounce time for GPIO IRQ in ms.
+ * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
+ * @check_on_resume:	Boolean describing whether to check the state of gpio
+ *			while resuming from sleep.
+ */
+struct gpio_extcon_pdata {
+	unsigned int extcon_id;
+	unsigned gpio;
+	bool gpio_active_low;
+	unsigned long debounce;
+	unsigned long irq_flags;
+	bool check_on_resume;
+};
+
 struct gpio_extcon_data {
 	struct extcon_dev *edev;
 	int irq;
diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
deleted file mode 100644
index 7cacafb78b09..000000000000
--- a/include/linux/extcon/extcon-gpio.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- * Single-state GPIO extcon driver based on extcon class
- *
- * Copyright (C) 2012 Samsung Electronics
- * Author: MyungJoo Ham <myungjoo.ham@samsung.com>
- *
- * based on switch class driver
- * Copyright (C) 2008 Google, Inc.
- * Author: Mike Lockwood <lockwood@android.com>
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-#ifndef __EXTCON_GPIO_H__
-#define __EXTCON_GPIO_H__ __FILE__
-
-#include <linux/extcon.h>
-
-/**
- * struct gpio_extcon_pdata - A simple GPIO-controlled extcon device.
- * @extcon_id:		The unique id of specific external connector.
- * @gpio:		Corresponding GPIO.
- * @gpio_active_low:	Boolean describing whether gpio active state is 1 or 0
- *			If true, low state of gpio means active.
- *			If false, high state of gpio means active.
- * @debounce:		Debounce time for GPIO IRQ in ms.
- * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
- * @check_on_resume:	Boolean describing whether to check the state of gpio
- *			while resuming from sleep.
- */
-struct gpio_extcon_pdata {
-	unsigned int extcon_id;
-	unsigned gpio;
-	bool gpio_active_low;
-	unsigned long debounce;
-	unsigned long irq_flags;
-
-	bool check_on_resume;
-};
-
-#endif /* __EXTCON_GPIO_H__ */
-- 
2.13.5

