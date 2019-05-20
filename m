From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is not defined
Date: Mon, 20 May 2019 09:52:15 +0200
Message-ID: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: linux-gpio@vger.kernel.org

When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
not exist:
drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
     pctl->gpio_chip.of_node = np;

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index eba872c..bb64aa0 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -648,7 +648,9 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
 	pctl->gpio_chip.can_sleep = true;
+#ifdef CONFIG_OF_GPIO
 	pctl->gpio_chip.of_node = np;
+#endif
 	pctl->gpio_chip.need_valid_mask = true;
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
-- 
2.7.4
