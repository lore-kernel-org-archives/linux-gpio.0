From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 02/36] pinctrl: meson: fix gxbb ao pull register bits
Date: Thu, 22 Nov 2018 14:52:06 -0500
Message-ID: <20181122195240.13123-2-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 4bc51e1e350cd4707ce6e551a93eae26d40b9889 ]

AO pull register definition is inverted between pull (up/down) and
pull enable. Fixing this allows to properly apply bias setting
through pinconf

Fixes: 468c234f9ed7 ("pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4ceb06f8a33c..4edeb4cae72a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -830,7 +830,7 @@ static struct meson_bank meson_gxbb_periphs_banks[] = {
 
 static struct meson_bank meson_gxbb_aobus_banks[] = {
 	/*   name    first      last       irq    pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
-- 
2.17.1
