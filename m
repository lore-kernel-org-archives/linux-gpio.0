From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] pinctrl: meson: remove unused pin_base
Date: Fri,  6 Oct 2017 10:54:07 +0200
Message-ID: <20171006085407.27905-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

While removing the need to have pin_base defined in meson pinctrl
drivers, I forgot to remove the corresponding field from the
pinctrl_data structure.

Fixing this now.

Fixes: 70e5ecb1b994 ("pinctrl: meson: get rid of pin_base")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 227b72a60c22..7ed0a80fd9dc 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -103,7 +103,6 @@ struct meson_pinctrl_data {
 	const struct pinctrl_pin_desc *pins;
 	struct meson_pmx_group *groups;
 	struct meson_pmx_func *funcs;
-	unsigned int pin_base;
 	unsigned int num_pins;
 	unsigned int num_groups;
 	unsigned int num_funcs;
-- 
2.13.5
