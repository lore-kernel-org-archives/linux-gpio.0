From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpiolib: constify label in gpio_device
Date: Wed, 13 Dec 2017 12:25:19 +0100
Message-ID: <20171213112520.7479-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

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
