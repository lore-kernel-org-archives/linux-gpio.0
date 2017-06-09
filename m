From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 7/8] gpio: mockup: add myself as author
Date: Fri,  9 Jun 2017 13:41:31 +0200
Message-ID: <1497008492-14907-8-git-send-email-brgl@bgdev.pl>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Just taking credit for the recent changes and new features. :)

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 2f4fe41..536a229 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -3,6 +3,7 @@
  *
  * Copyright (C) 2014  Kamlakant Patel <kamlakant.patel@broadcom.com>
  * Copyright (C) 2015-2016  Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
+ * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
  *
  * This program is free software; you can redistribute  it and/or modify it
  * under  the terms of  the GNU General  Public License as published by the
@@ -432,5 +433,6 @@ module_exit(mock_device_exit);
 
 MODULE_AUTHOR("Kamlakant Patel <kamlakant.patel@broadcom.com>");
 MODULE_AUTHOR("Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>");
+MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
 MODULE_DESCRIPTION("GPIO Testing driver");
 MODULE_LICENSE("GPL v2");
-- 
2.9.3
