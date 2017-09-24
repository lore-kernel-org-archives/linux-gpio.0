From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 8/8] extcon: gpio: Always check state on resume
Date: Sun, 24 Sep 2017 16:56:22 +0200
Message-ID: <20170924145622.4031-9-linus.walleij@linaro.org>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170924145622.4031-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

It makes most sense to always check the state of the GPIO external
connector at system resume so just do this by default. Add a TODO
if people turn out to desire to parameterize this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index b7353f5018b5..4f0ad5ad2722 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -83,6 +83,15 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	/*
+	 * Always checking connector state on resume makes most sense so do this
+	 * by default.
+	 *
+	 * TODO: if parameterization is needed, augment this to use proper device
+	 * properties or set it up from PM core.
+	 */
+	data->check_on_resume = true;
+
 	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
 	if (IS_ERR(data->gpiod))
 		return PTR_ERR(data->gpiod);
-- 
2.13.5
