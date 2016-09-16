From: Amitesh Singh <singh.amitesh@gmail.com>
Subject: [PATCH] gpio: f7188x: use gpiochip_get_data instead of container_of
Date: Fri, 16 Sep 2016 22:28:53 +0530
Message-ID: <1474045133-3892-1-git-send-email-singh.amitesh@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:32787 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754848AbcIPQ7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2016 12:59:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

gpiochip_add_data is already used to add data pointer and chip.
Lets rely on gpiochip_get_data which is getting used in other
gpio_chip functions.

Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>
---
 drivers/gpio/gpio-f7188x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 600be84..e8accde 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -214,8 +214,7 @@ static struct f7188x_gpio_bank f81866_gpio_bank[] = {
 static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
-	struct f7188x_gpio_bank *bank =
-		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
 	u8 dir;
 
-- 
2.7.4

