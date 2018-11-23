From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] pinctrl: nuvoton: check for devm_kasprintf() failure
Date: Fri, 23 Nov 2018 17:12:58 +0100
Message-ID: <1542989578-21200-1-git-send-email-hofrat@osadl.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
List-Id: linux-gpio@vger.kernel.org

devm_kasprintf() may return NULL on failure of internal allocation thus
the assignment to  .label  is not safe if not checked. On error
npcm7xx_gpio_of() returns negative values so -ENOMEM in the
(unlikely) failure case of devm_kasprintf() should be fine here.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
---

Problem located with experimental coccinelle script

The only call-site is the probe function (npcm7xx_pinctrl_probe()) wich
will bail out on error - it seems like no further cleanup is expected.

Also while the code generally uses the  if (!var)  construct that would
not be very readable in this case so I think the:
     if (pctrl->gpio_bank[id].gc.label == NULL)
is more appropriate here not sure though what the general preference is.

Patch was compile tested with: multi_v7_defconfig + ARCH_NPCM=y,
ARCH_NPCM7XX=y (implies PINCTRL_NPCM7XX=y)
(sparse reports a number of "obsolete array initializer" warnings)

Patch is against 4.20-rc3 (localversion-next is next-20181123)

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index b455209..17f909d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1925,6 +1925,9 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			pctrl->gpio_bank[id].gc.label =
 				devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOF",
 					       np);
+			if (pctrl->gpio_bank[id].gc.label == NULL)
+				return -ENOMEM;
+
 			pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
 			pctrl->gpio_bank[id].direction_input =
 				pctrl->gpio_bank[id].gc.direction_input;
-- 
2.1.4
