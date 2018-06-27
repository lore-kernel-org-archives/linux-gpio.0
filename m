From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/5] pinctrl: ingenic: Fix inverted direction for < JZ4770
Date: Wed, 27 Jun 2018 13:49:02 +0200
Message-ID: <20180627114904.10890-4-paul@crapouillou.net>
References: <20180627114904.10890-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627114904.10890-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-gpio@vger.kernel.org

The .gpio_set_direction() callback was setting inverted direction
for SoCs older than the JZ4770, this restores the correct behaviour.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a1d7156d0a43..6a1b6058b991 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -536,7 +536,7 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, input);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, false);
-		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DIR, input);
+		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DIR, !input);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, false);
 	}
 
-- 
2.11.0
