From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: pfuze100: Delete reference to ena_gpio" to the regulator tree
Date: Thu, 24 May 2018 20:14:03 +0100
Message-ID: <E1fLvgZ-0005P8-UE@debutante>
References: <20180212131717.27193-13-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212131717.27193-13-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The patch

   regulator: pfuze100: Delete reference to ena_gpio

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 5389ac0ac7d95cf23a5f4e27430ceb2ed815cd5d Mon Sep 17 00:00:00 2001
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 May 2018 10:06:30 +0200
Subject: [PATCH] regulator: pfuze100: Delete reference to ena_gpio

We now pass a GPIO descriptor to the core instead of a global
GPIO number, if this descriptor is NULL the GPIO line is not
used. Just delete the assignment of an invalid GPIO line.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/pfuze100-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 26a5cd9b4637..8d9dbcc775ea 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -651,7 +651,6 @@ static int pfuze100_regulator_probe(struct i2c_client *client,
 		config.init_data = init_data;
 		config.driver_data = pfuze_chip;
 		config.of_node = match_of_node(i);
-		config.ena_gpio = -EINVAL;
 
 		pfuze_chip->regulators[i] =
 			devm_regulator_register(&client->dev, desc, &config);
-- 
2.17.0
