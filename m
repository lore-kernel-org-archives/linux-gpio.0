From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 04/36] pinctrl: meson: fix meson8 ao pull register bits
Date: Thu, 22 Nov 2018 14:52:08 -0500
Message-ID: <20181122195240.13123-4-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit e91b162d2868672d06010f34aa83d408db13d3c6 ]

AO pull register definition is inverted between pull (up/down) and
pull enable. Fixing this allows to properly apply bias setting
through pinconf

Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index c6d79315218f..86466173114d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1053,7 +1053,7 @@ static struct meson_bank meson8_cbus_banks[] = {
 
 static struct meson_bank meson8_aobus_banks[] = {
 	/*   name    first     last         irq    pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0, 16,  0,  0,  0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
-- 
2.17.1
