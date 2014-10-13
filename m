From: David Cohen <david.a.cohen@linux.intel.com>
Subject: [PATCH] pinctrl: baytrail: show output gpio state correctly on Intel Baytrail
Date: Mon, 13 Oct 2014 11:23:59 -0700
Message-ID: <1413224639-21552-1-git-send-email-david.a.cohen@linux.intel.com>
References: <1412355319-18946-1-git-send-email-david.a.cohen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412355319-18946-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Even if a gpio pin is set to output, we still need to set INPUT_EN bit
to be able to read its value. Without this change, we'll always read low
level state.

Cc: <stable@vger.kernel.org> # v3.14+
Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
---

Hi,

I'm resending same v1 patch but now copying linux stable and linux gpio.
This patch is meant for all linux stable trees >= v3.14.

Br, David
---

 drivers/pinctrl/pinctrl-baytrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-baytrail.c b/drivers/pinctrl/pinctrl-baytrail.c
index e12e5b07f6d7..c23d8ded936d 100644
--- a/drivers/pinctrl/pinctrl-baytrail.c
+++ b/drivers/pinctrl/pinctrl-baytrail.c
@@ -318,7 +318,7 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 		"Potential Error: Setting GPIO with direct_irq_en to output");
 
 	reg_val = readl(reg) | BYT_DIR_MASK;
-	reg_val &= ~BYT_OUTPUT_EN;
+	reg_val &= ~(BYT_OUTPUT_EN | BYT_INPUT_EN);
 
 	if (value)
 		writel(reg_val | BYT_LEVEL, reg);
-- 
2.1.0
