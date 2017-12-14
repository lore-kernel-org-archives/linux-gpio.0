From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/2] gpiolib: constify label in gpio_device
Date: Thu, 14 Dec 2017 15:29:19 +0100
Message-ID: <20171214142920.32683-2-brgl@bgdev.pl>
References: <20171214142920.32683-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:42598 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752355AbdLNO32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Dec 2017 09:29:28 -0500
Received: by mail-wr0-f195.google.com with SMTP id s66so5303407wrc.9
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2017 06:29:27 -0800 (PST)
In-Reply-To: <20171214142920.32683-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joe Perches <joe@perches.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

This string is never modified. Make it const.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 5e1f7cc6eeb6..6e9228b94437 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -58,7 +58,7 @@ struct gpio_device {
 	struct gpio_desc	*descs;
 	int			base;
 	u16			ngpio;
-	char			*label;
+	const char		*label;
 	void			*data;
 	struct list_head        list;
 
-- 
2.15.1

