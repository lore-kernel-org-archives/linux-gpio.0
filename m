From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 13/81] pinctrl: mcp23s08: spi: Fix regmap allocation for mcp23s18
Date: Thu, 28 Feb 2019 10:07:05 -0500
Message-ID: <20190228150813.10256-13-sashal@kernel.org>
References: <20190228150813.10256-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228150813.10256-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Jason Kridner <jkridner@gmail.com>, Jason Kridner <jdk@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Jason Kridner <jkridner@gmail.com>

[ Upstream commit f165988b77ef849eb0c1aebd94fe778024f88314 ]

Fixes issue created by 9b3e4207661e67f04c72af15e29f74cd944f5964.

It wasn't possible for one_regmap_config to be non-NULL at the point
it was tested for mcp23s18 devices.

Applied the same pattern of allocating one_regmap_config using
devm_kmemdump() and then initializing the local regmap structure
from that.

Signed-off-by: Jason Kridner <jdk@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index b03481ef99a13..98905d4a79ca9 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -832,8 +832,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		break;
 
 	case MCP_TYPE_S18:
+		one_regmap_config =
+			devm_kmemdup(dev, &mcp23x17_regmap,
+				sizeof(struct regmap_config), GFP_KERNEL);
+		if (!one_regmap_config)
+			return -ENOMEM;
 		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
-					       &mcp23x17_regmap);
+					       one_regmap_config);
 		mcp->reg_shift = 1;
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23s18";
-- 
2.19.1
