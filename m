From: Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] pinctrl: pinctrl-mtk-common: fix a possible NULL pointer deference
Date: Fri, 31 May 2019 15:08:09 +0800
Message-ID: <1559286489-5418-1-git-send-email-92siuyang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@kernel.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Young Xiao <92siuyang@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The function, external interrupt controller, is made as an optional to
pinctrl. But if we don't want pio behaves as an external interrupt
controller, it would lead to pctl->eint not be created properly and then
will cause 'kernel NULL pointer' issue when gpiochip try to call .to_irq
or .set_config. To fix it, check pctl->eint before accessing the member.

See commit 5f591543a937 ("pinctrl: mt7622: fix a kernel panic when pio
don't work as EINT controller") for details.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 0716238..b395f0b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -836,6 +836,9 @@ static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 	const struct mtk_desc_pin *pin;
 	unsigned long eint_n;
 
+	if (!pctl->eint)
+		return -ENOTSUPP;
+
 	pin = pctl->devdata->pins + offset;
 	if (pin->eint.eintnum == NO_EINT_SUPPORT)
 		return -EINVAL;
@@ -853,7 +856,8 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	unsigned long eint_n;
 	u32 debounce;
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+	if (!pctl->eint ||
+	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
 		return -ENOTSUPP;
 
 	pin = pctl->devdata->pins + offset;
-- 
2.7.4
