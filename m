From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 01/10] gpio: mockup: fix direction values
Date: Thu, 25 May 2017 10:33:38 +0200
Message-ID: <1495701227-28809-2-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f176.google.com ([209.85.128.176]:33874 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934367AbdEYId5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:33:57 -0400
Received: by mail-wr0-f176.google.com with SMTP id j27so14357039wre.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:33:56 -0700 (PDT)
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

The comment in linux/gpio/driver.h says:

 @get_direction: returns direction for signal "offset", 0=out, 1=in

We got those switched at some point. Fix the values.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c6dadac..c18d011 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -29,8 +29,8 @@
 #define	GPIO_MOCKUP_MAX_GC	10
 
 enum {
-	DIR_IN = 0,
-	DIR_OUT,
+	DIR_OUT = 0,
+	DIR_IN = 1,
 };
 
 /*
-- 
2.9.3

