From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 03/36] pinctrl: meson: fix gxl ao pull register bits
Date: Thu, 22 Nov 2018 14:52:07 -0500
Message-ID: <20181122195240.13123-3-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit ed3a2b74f3eb34c84c8377353f4730f05acdfd05 ]

AO pull register definition is inverted between pull (up/down) and
pull enable. Fixing this allows to properly apply bias setting
through pinconf

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 7dae1d7bf6b0..158f618f1695 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -807,7 +807,7 @@ static struct meson_bank meson_gxl_periphs_banks[] = {
 
 static struct meson_bank meson_gxl_aobus_banks[] = {
 	/*   name    first      last      irq	pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
-- 
2.17.1
