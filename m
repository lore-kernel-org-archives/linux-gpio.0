From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 2/6] pinctrl: sunxi: implement pin_config_set
Date: Thu, 14 Mar 2019 20:32:51 +0100
Message-ID: <c04ebab6910f2d4fd7d6bfff3a8957e1a3dbcdde.1552591798.git-series.maxime.ripard@bootlin.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The sunxi pinctrl only implements the pin_config_group_set callback at the
moment, whereas the gpiochip_generic_config function relies on
pin_config_set. Rework the functions a little to support pin_config_set,
and rely on it for pin_config_group_set.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 8dd25caea2cf..78a30f713180 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -530,14 +530,10 @@ static int sunxi_pconf_group_get(struct pinctrl_dev *pctldev,
 	return sunxi_pconf_get(pctldev, g->pin, config);
 }
 
-static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
-				 unsigned group,
-				 unsigned long *configs,
-				 unsigned num_configs)
+static int sunxi_pconf_set(struct pinctrl_dev *pctldev, unsigned pin,
+			   unsigned long *configs, unsigned num_configs)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct sunxi_pinctrl_group *g = &pctl->groups[group];
-	unsigned pin = g->pin - pctl->desc->pin_base;
 	int i;
 
 	for (i = 0; i < num_configs; i++) {
@@ -596,9 +592,20 @@ static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
+				 unsigned long *configs, unsigned num_configs)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct sunxi_pinctrl_group *g = &pctl->groups[group];
+
+	/* We only support 1 pin per group. Chain it to the pin callback */
+	return sunxi_pconf_set(pctldev, g->pin, configs, num_configs);
+}
+
 static const struct pinconf_ops sunxi_pconf_ops = {
 	.is_generic		= true,
 	.pin_config_get		= sunxi_pconf_get,
+	.pin_config_set		= sunxi_pconf_set,
 	.pin_config_group_get	= sunxi_pconf_group_get,
 	.pin_config_group_set	= sunxi_pconf_group_set,
 };
-- 
git-series 0.9.1
