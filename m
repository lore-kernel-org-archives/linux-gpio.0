From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: mockup: use the SPDX identifier and remove license boilerplate
Date: Thu, 26 Apr 2018 22:12:36 +0200
Message-ID: <20180426201236.9380-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Use the SPDX license identifier for GPLv2.0 or later and remove the
license boilerplate.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 76c2fe91a901..d66b7a768ecd 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -1,15 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * GPIO Testing Device Driver
  *
  * Copyright (C) 2014  Kamlakant Patel <kamlakant.patel@broadcom.com>
  * Copyright (C) 2015-2016  Bamvor Jian Zhang <bamv2005@gmail.com>
  * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
  */
 
 #include <linux/init.h>
-- 
2.17.0
