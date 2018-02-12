From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 12/21] regulator: pfuze100: Delete reference to ena_gpio
Date: Mon, 12 Feb 2018 14:17:08 +0100
Message-ID: <20180212131717.27193-13-linus.walleij@linaro.org>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212131717.27193-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

We now pass a GPIO descriptor to the core instead of a global
GPIO number, if this descriptor is NULL the GPIO line is not
used. Just delete the assignment of an invalid GPIO line.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/pfuze100-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 63922a2167e5..f341d9614a77 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -648,7 +648,6 @@ static int pfuze100_regulator_probe(struct i2c_client *client,
 		config.init_data = init_data;
 		config.driver_data = pfuze_chip;
 		config.of_node = match_of_node(i);
-		config.ena_gpio = -EINVAL;
 
 		pfuze_chip->regulators[i] =
 			devm_regulator_register(&client->dev, desc, &config);
-- 
2.14.3
