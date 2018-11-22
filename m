From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 05/36] pinctrl: meson: fix meson8b ao pull register bits
Date: Thu, 22 Nov 2018 14:52:09 -0500
Message-ID: <20181122195240.13123-5-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit a1705f02704cd8a24d434bfd0141ee8142ad277a ]

AO pull register definition is inverted between pull (up/down) and
pull enable. Fixing this allows to properly apply bias setting
through pinconf

Fixes: 0fefcb6876d0 ("pinctrl: Add support for Meson8b")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index bb2a30964fc6..647ad15d5c3c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -906,7 +906,7 @@ static struct meson_bank meson8b_cbus_banks[] = {
 
 static struct meson_bank meson8b_aobus_banks[] = {
 	/*   name    first     lastc        irq    pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  16, 0, 0,  0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
-- 
2.17.1
