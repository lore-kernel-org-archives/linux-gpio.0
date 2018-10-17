From: Kun Yi <kunyi@google.com>
Subject: [PATCH 2/2] pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG
Date: Wed, 17 Oct 2018 14:30:12 -0700
Message-ID: <20181017213012.233957-3-kunyi@google.com>
References: <20181017213012.233957-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017213012.233957-1-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, tmaimon77@gmail.com
Cc: linux-kernel@vger.kernel.org, avifishman70@gmail.com, openbmc@lists.ozlabs.org, Kun Yi <kunyi@google.com>
List-Id: linux-gpio@vger.kernel.org

Indicate that the pins are both controlled by the pinctrl driver and the
generic GPIO driver, thus GPIO driver should read the register value
before updating, instead of using the stored shadow register values.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7ad50d9268aa..ac7b69d53aff 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1904,7 +1904,8 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 					 NULL,
 					 pctrl->gpio_bank[id].base +
 					 NPCM7XX_GP_N_IEM,
-					 BGPIOF_READ_OUTPUT_REG_SET);
+					 BGPIOF_READ_OUTPUT_REG_SET |
+					 BGPIOF_VOLATILE_REG);
 			if (ret) {
 				dev_err(pctrl->dev, "bgpio_init() failed\n");
 				return ret;
-- 
2.19.1.331.ge82ca0e54c-goog
