From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] gpio: add a check for the return value of ida_simple_get fails
Date: Fri,  8 Mar 2019 22:07:57 -0600
Message-ID: <20190309040757.924-1-kjlu@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

ida_simple_get may fail and return a negative error number.
The fix checks its return value; if it fails, go to err_destroy.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/gpio/gpio-exar.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 0ecd2369c2ca..a09d2f9ebacc 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -148,6 +148,8 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	mutex_init(&exar_gpio->lock);
 
 	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
+	if (index < 0)
+		goto err_destroy;
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
-- 
2.17.1
