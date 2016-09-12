From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/8] gpio: sx150x: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:25 -0400
Message-ID: <20160912221631.15812-3-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This file is currently getting module.h from a global gpio header
and it will faii to build once we remove module.h from that.

However, the driver is controlled with the following Kconfig:

drivers/gpio/Kconfig:config GPIO_SX150X
drivers/gpio/Kconfig:   bool "Semtech SX150x I2C GPIO expander"

and hence the two lines of MODULE_DEVICE_TABLE are no-ops that
can simply be deleted.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-sx150x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index a177ebd921d5..af95de89db01 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -236,7 +236,6 @@ static const struct i2c_device_id sx150x_id[] = {
 	{"sx1502q", 3},
 	{}
 };
-MODULE_DEVICE_TABLE(i2c, sx150x_id);
 
 static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1508q" },
@@ -245,7 +244,6 @@ static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1502q" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
 static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
 {
-- 
2.8.4
