From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] pinctrl: madera: Fix possible NULL pointer with pdata config
Date: Tue, 28 Aug 2018 09:45:37 +0100
Message-ID: <20180828084537.22960-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

If we are being configured via pdata we don't necessarily have
any gpio mappings being configured that way so pdata->gpio_config
could be NULL.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index ece41fb2848f..c4f4d904e4a6 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1040,7 +1040,7 @@ static int madera_pin_probe(struct platform_device *pdev)
 	}
 
 	/* if the configuration is provided through pdata, apply it */
-	if (pdata) {
+	if (pdata && pdata->gpio_configs) {
 		ret = pinctrl_register_mappings(pdata->gpio_configs,
 						pdata->n_gpio_configs);
 		if (ret) {
-- 
2.11.0
