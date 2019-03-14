From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 3/6] pinctrl: sunxi: Fix variable assignment syntax
Date: Thu, 14 Mar 2019 20:32:52 +0100
Message-ID: <d2307f2648901d1950a1516ad5ffd70f6d595898.1552591798.git-series.maxime.ripard@bootlin.com>
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

Lines are usually ended with a semi-column in C, yet this was copied from a
structure declaration to the init variant while keeping the comma at the
end. Make sure we have a normal syntax, instead of multiple assignments.

Fixes: d83c82ce7ccd ("pinctrl: sunxi: support multiple pin controller")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 78a30f713180..96490dee62be 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1450,16 +1450,16 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 
 	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
 	pctl->chip->owner = THIS_MODULE;
-	pctl->chip->request = gpiochip_generic_request,
-	pctl->chip->free = gpiochip_generic_free,
-	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input,
-	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output,
-	pctl->chip->get = sunxi_pinctrl_gpio_get,
-	pctl->chip->set = sunxi_pinctrl_gpio_set,
-	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate,
-	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq,
-	pctl->chip->of_gpio_n_cells = 3,
-	pctl->chip->can_sleep = false,
+	pctl->chip->request = gpiochip_generic_request;
+	pctl->chip->free = gpiochip_generic_free;
+	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
+	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
+	pctl->chip->get = sunxi_pinctrl_gpio_get;
+	pctl->chip->set = sunxi_pinctrl_gpio_set;
+	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
+	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq;
+	pctl->chip->of_gpio_n_cells = 3;
+	pctl->chip->can_sleep = false;
 	pctl->chip->ngpio = round_up(last_pin, PINS_PER_BANK) -
 			    pctl->desc->pin_base;
 	pctl->chip->label = dev_name(&pdev->dev);
-- 
git-series 0.9.1
