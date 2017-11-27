From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 08/18] gpio: mockup: pass the named_lines parameter over platform_data
Date: Mon, 27 Nov 2017 11:48:44 +0100
Message-ID: <20171127104854.333-9-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Move the last bits of code dealing with module parameters to the init
function. Add a new variable to platform data, which indicates to the
probe function if it should name the GPIO lines. If we ever want to
make the line naming more fine-grained (e.g. per chip switch) it will
be easier this way.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 2dbaeb69d2d2..9da90ad87030 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -68,6 +68,7 @@ struct gpio_mockup_platform_data {
 	int base;
 	int ngpio;
 	int index;
+	bool named_lines;
 };
 
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
@@ -272,7 +273,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (!chip->lines)
 		return -ENOMEM;
 
-	if (gpio_mockup_named_lines) {
+	if (pdata->named_lines) {
 		rv = gpio_mockup_name_lines(dev, chip);
 		if (rv)
 			return rv;
@@ -344,6 +345,7 @@ static int __init gpio_mockup_init(void)
 		pdata.ngpio = pdata.base < 0
 				? gpio_mockup_ranges[i * 2 + 1]
 				: gpio_mockup_ranges[i * 2 + 1] - pdata.base;
+		pdata.named_lines = gpio_mockup_named_lines;
 
 		pdev = platform_device_register_resndata(NULL,
 							 GPIO_MOCKUP_NAME,
-- 
2.15.0
