From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/8] gpio: mxs: disallow unbinding the driver
Date: Wed,  9 Aug 2017 14:25:01 +0200
Message-ID: <20170809122507.11149-3-brgl@bgdev.pl>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

This driver is non-modular so explicitly disallow a driver unbind.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mxs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 6ae583f36733..159927876577 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -379,6 +379,7 @@ static struct platform_driver mxs_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-mxs",
 		.of_match_table = mxs_gpio_dt_ids,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= mxs_gpio_probe,
 	.id_table	= mxs_gpio_ids,
-- 
2.13.2
