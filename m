From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 10/18] gpio: mockup: change the type of value field in line state struct
Date: Mon, 27 Nov 2017 11:48:46 +0100
Message-ID: <20171127104854.333-11-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38525 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752234AbdK0KtU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 05:49:20 -0500
Received: by mail-wr0-f195.google.com with SMTP id z75so24573613wrc.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2017 02:49:19 -0800 (PST)
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

GPIO values are universally represented as integers. Change the type
of the variable storing the current line value to int for consistency.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 9a880e15ea0b..8a61328a255d 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -48,7 +48,7 @@ enum {
  */
 struct gpio_mockup_line_status {
 	int dir;
-	bool value;
+	int value;
 };
 
 struct gpio_mockup_chip {
-- 
2.15.0

