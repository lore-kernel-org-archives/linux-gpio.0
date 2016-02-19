From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] input: gpio_keys_polled: Correct check for invalid gpiod
Date: Fri, 19 Feb 2016 10:58:26 +0100
Message-ID: <1455875906-5048-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:52540 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1427495AbcBSJ6f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 04:58:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

At this point in gpio_keys_polled_probe(), button->gpiod contains either
a pointer to a GPIO descriptor or NULL, because:
  - gpio_keys_polled_get_devtree_pdata() fills in button->gpiod only if
    devm_get_gpiod_from_child() succeeded,
  - gpio_to_desc() returns NULL on failure, not an ERR_PTR(),
  - button->gpiod is untouched if it was NULL, and button->gpio is not
    valid.

Hence check for NULL only, and return -EINVAL on failure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Question: Should it return -ENOENT instead?
---
 drivers/input/keyboard/gpio_keys_polled.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 62bdb1d48c49dbd9..1ef3c66099a50d72 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -330,8 +330,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 			button->gpiod = gpio_to_desc(button->gpio);
 		}
 
-		if (IS_ERR(button->gpiod))
-			return PTR_ERR(button->gpiod);
+		if (!button->gpiod)
+			return -EINVAL;
 
 		bdata->can_sleep = gpiod_cansleep(button->gpiod);
 		bdata->last_state = -1;
-- 
1.9.1

