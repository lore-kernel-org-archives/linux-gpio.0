From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/1] pinctrl: nuvoton: modify NPCM7xx pin configuration function
Date: Wed,  7 Nov 2018 15:44:34 +0200
Message-ID: <20181107134434.354795-2-tmaimon77@gmail.com>
References: <20181107134434.354795-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107134434.354795-1-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, yuenn@google.com, venture@google.com, benjaminfair@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au, kunyi@google.com
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Modify GPIO direction setting in pin configuration function by using
generic GPIO functions to set the GPIO direction instead of direct
access to the GPIO direction register.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7ad50d9268aa..b455209382a5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1799,19 +1799,12 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		if (arg) {
-			iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
-			npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
-				      gpio);
-		} else
-			npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
-				      gpio);
+		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
+		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
 		break;
 	case PIN_CONFIG_OUTPUT:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM, gpio);
-		iowrite32(gpio, arg ? bank->base + NPCM7XX_GP_N_DOS :
-			  bank->base + NPCM7XX_GP_N_DOC);
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
+		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
-- 
2.14.1
