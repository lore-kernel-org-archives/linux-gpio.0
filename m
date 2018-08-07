From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 1/3] pinctrl: madera: Set is_generic
Date: Tue, 7 Aug 2018 10:32:24 +0100
Message-ID: <20180807093226.5624-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

We are using the generic pin configuration interface so
we can set is_generic.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index ece41fb2848f..4f9b7e3b7cf2 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -971,10 +971,10 @@ static int madera_pin_conf_group_set(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops madera_pin_conf_ops = {
+	.is_generic = true,
 	.pin_config_get = madera_pin_conf_get,
 	.pin_config_set = madera_pin_conf_set,
 	.pin_config_group_set = madera_pin_conf_group_set,
-
 };
 
 static struct pinctrl_desc madera_pin_desc = {
-- 
2.11.0
