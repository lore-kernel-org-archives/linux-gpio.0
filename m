From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 128/304] pinctrl: nuvoton: check for devm_kasprintf() failure
Date: Mon, 28 Jan 2019 10:40:45 -0500
Message-ID: <20190128154341.47195-128-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Nicholas Mc Guire <hofrat@osadl.org>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Nicholas Mc Guire <hofrat@osadl.org>

[ Upstream commit 4be1eaf322f07bb9694618fd2763a3a1f0a3dd25 ]

devm_kasprintf() may return NULL on failure of internal allocation thus
the assignment to  .label  is not safe if not checked. On error
npcm7xx_gpio_of() returns negative values so -ENOMEM in the
(unlikely) failure case of devm_kasprintf() should be fine here.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7ad50d9268aa..3bda620d18bb 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1932,6 +1932,9 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
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
2.19.1
