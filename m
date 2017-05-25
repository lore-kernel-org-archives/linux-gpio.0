From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 10/10] gpio: mockup: add myself as author
Date: Thu, 25 May 2017 10:33:47 +0200
Message-ID: <1495701227-28809-11-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:32832 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937785AbdEYIeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:34:07 -0400
Received: by mail-wm0-f45.google.com with SMTP id m7so27713457wmg.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:34:06 -0700 (PDT)
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Just taking credit for the recent changes and new features. :)

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 96a6c6e..d870597 100644
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
@@ -444,5 +445,6 @@ module_exit(mock_device_exit);
 
 MODULE_AUTHOR("Kamlakant Patel <kamlakant.patel@broadcom.com>");
 MODULE_AUTHOR("Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>");
+MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
 MODULE_DESCRIPTION("GPIO Testing driver");
 MODULE_LICENSE("GPL v2");
-- 
2.9.3

