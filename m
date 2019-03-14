From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 4/6] pinctrl: sunxi: Declare set_config on the GPIO chip
Date: Thu, 14 Mar 2019 20:32:53 +0100
Message-ID: <b83a81feebb87c8314581648f8d01fb5f04eb4d6.1552591798.git-series.maxime.ripard@bootlin.com>
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

Our pin controller can configure the pins no matter how they are muxed, so
it makes sense to allow this for GPIOs as well.

Add the generic set_config function so that we can rely on the existing
pinctrl code we have.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 96490dee62be..be04223591d4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1452,6 +1452,7 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 	pctl->chip->owner = THIS_MODULE;
 	pctl->chip->request = gpiochip_generic_request;
 	pctl->chip->free = gpiochip_generic_free;
+	pctl->chip->set_config = gpiochip_generic_config;
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
-- 
git-series 0.9.1
