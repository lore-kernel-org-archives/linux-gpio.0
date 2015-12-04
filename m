From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: Restore indentation of parent device setup
Date: Fri,  4 Dec 2015 15:28:16 +0100
Message-ID: <1449239296-32210-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Fixes: 58383c78425e4ee1 ("gpio: change member .dev to .parent")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-pcf857x.c    | 2 +-
 drivers/gpio/gpio-tz1090-pdc.c | 2 +-
 drivers/gpio/gpio-tz1090.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index c7552106a80cd103..8491937c626e3bf9 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -293,7 +293,7 @@ static int pcf857x_probe(struct i2c_client *client,
 
 	gpio->chip.base			= pdata ? pdata->gpio_base : -1;
 	gpio->chip.can_sleep		= true;
-	gpio->chip.parent			= &client->dev;
+	gpio->chip.parent		= &client->dev;
 	gpio->chip.owner		= THIS_MODULE;
 	gpio->chip.get			= pcf857x_get;
 	gpio->chip.set			= pcf857x_set;
diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pdc.c
index a974397164b247b2..0a01c8736affacee 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -188,7 +188,7 @@ static int tz1090_pdc_gpio_probe(struct platform_device *pdev)
 
 	/* Set up GPIO chip */
 	priv->chip.label		= "tz1090-pdc-gpio";
-	priv->chip.parent			= &pdev->dev;
+	priv->chip.parent		= &pdev->dev;
 	priv->chip.direction_input	= tz1090_pdc_gpio_direction_input;
 	priv->chip.direction_output	= tz1090_pdc_gpio_direction_output;
 	priv->chip.get			= tz1090_pdc_gpio_get;
diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 7858d90202f315b1..79ef6e1ce568b3b8 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -425,7 +425,7 @@ static int tz1090_gpio_bank_probe(struct tz1090_gpio_bank_info *info)
 	snprintf(bank->label, sizeof(bank->label), "tz1090-gpio-%u",
 		 info->index);
 	bank->chip.label		= bank->label;
-	bank->chip.parent			= dev;
+	bank->chip.parent		= dev;
 	bank->chip.direction_input	= tz1090_gpio_direction_input;
 	bank->chip.direction_output	= tz1090_gpio_direction_output;
 	bank->chip.get			= tz1090_gpio_get;
-- 
1.9.1
