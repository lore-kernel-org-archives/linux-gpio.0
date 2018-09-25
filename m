From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: paris: fix check on EINT_NA comparison
Date: Tue, 25 Sep 2018 14:21:30 +0100
Message-ID: <20180925132130.27044-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently, the check on desc->eint.eint_n == EINT_NA is always false
because this is comparing a u16 to -1 which can never be true.  Fix
this by casting EINT_NA to u16.

Fixes: fb5fa8dc151b ("pinctrl: mediatek: extend struct mtk_pin_desc to pinctrl-mtk-common-v2.c")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 4cf0fea30b7d..77d380145dfd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -729,7 +729,7 @@ static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 
-	if (desc->eint.eint_n == EINT_NA)
+	if (desc->eint.eint_n == (u16)EINT_NA)
 		return -ENOTSUPP;
 
 	return mtk_eint_find_irq(hw->eint, desc->eint.eint_n);
@@ -746,7 +746,7 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 	if (!hw->eint ||
 	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-	    desc->eint.eint_n == EINT_NA)
+	    desc->eint.eint_n == (u16)EINT_NA)
 		return -ENOTSUPP;
 
 	debounce = pinconf_to_config_argument(config);
-- 
2.17.1
