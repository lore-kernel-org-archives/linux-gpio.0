From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH] pinctrl: update document for pinconf_generic_parse_dt_config
Date: Wed, 25 Nov 2015 20:13:23 +0800
Message-ID: <1448453603-38980-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ludovic.desroches@atmel.com, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

The returned configs from pinconf_generic_parse_dt_config() is
duplicated from original. Make it clear it must be freed when no
longer necessary.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
It seems memleak in pinctrl-mtk-common.c[1] is not alone. After a quick
glance I notice similar issues in drivers/pinctrl/pinctrl-at91-pio4.c and
drivers/pinctrl/nomadik/pinctrl-abx500.c.

I think it make sense to update document to make it clear it should be freed.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2015-November/002967.html
---
 drivers/pinctrl/pinconf-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 099a344..79e6159 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -220,6 +220,7 @@ static void parse_dt_cfg(struct device_node *np,
  * parse the config properties into generic pinconfig values.
  * @np: node containing the pinconfig properties
  * @configs: array with nconfigs entries containing the generic pinconf values
+ *           must be freed when no longer necessary.
  * @nconfigs: umber of configurations
  */
 int pinconf_generic_parse_dt_config(struct device_node *np,
-- 
1.9.1
