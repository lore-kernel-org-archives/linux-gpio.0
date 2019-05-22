From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 055/167] pinctrl: pistachio: fix leaked of_node references
Date: Wed, 22 May 2019 15:26:50 -0400
Message-ID: <20190522192842.25858-55-sashal@kernel.org>
References: <20190522192842.25858-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190522192842.25858-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Wen Yang <wen.yang99@zte.com.cn>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Sasha Levin <sashal@kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 44a4455ac2c6b0981eace683a2b6eccf47689022 ]

The call to of_get_child_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./drivers/pinctrl/pinctrl-pistachio.c:1422:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1360, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 55375b1b3cc81..b2b7e238bda97 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1368,6 +1368,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 		if (!of_find_property(child, "gpio-controller", NULL)) {
 			dev_err(pctl->dev,
 				"No gpio-controller property for bank %u\n", i);
+			of_node_put(child);
 			ret = -ENODEV;
 			goto err;
 		}
@@ -1375,6 +1376,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 		irq = irq_of_parse_and_map(child, 0);
 		if (irq < 0) {
 			dev_err(pctl->dev, "No IRQ for bank %u: %d\n", i, irq);
+			of_node_put(child);
 			ret = irq;
 			goto err;
 		}
-- 
2.20.1
