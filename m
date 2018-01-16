From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] gpiolib: remove redundant initialization of pointer desc
Date: Tue, 16 Jan 2018 11:56:11 +0000
Message-ID: <20180116115611.24962-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33980 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751449AbeAPL4Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 06:56:16 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The initialized value stored in pointer desc is never read as it
is updated in the first executable statement in the function.
This is therefore redundant and can be removed.

Cleans up clang warning:
drivers/gpio/gpiolib.c:3710:20: warning: Value stored to 'desc'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 39a0144d5be5..b4c833b3d4e0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3707,7 +3707,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 					 enum gpiod_flags dflags,
 					 const char *label)
 {
-	struct gpio_desc *desc = ERR_PTR(-ENODEV);
+	struct gpio_desc *desc;
 	unsigned long lflags = 0;
 	enum of_gpio_flags flags;
 	bool active_low = false;
-- 
2.15.1

