From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] pinctrl: meson: fix gpio request disabling other modes
Date: Tue,  6 Dec 2016 15:08:16 +0100
Message-ID: <20161206140817.11708-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, carlo@caione.org, khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The pinctrl_gpio_request is called with the "full" gpio number, already
containing the base, then meson_pmx_request_gpio is then called with the
final pin number.
Remove the base addition when calling meson_pmx_disable_other_groups.

Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
CC: Beniamino Galvani <b.galvani@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index a579126..620c231a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -212,7 +212,7 @@ static int meson_pmx_request_gpio(struct pinctrl_dev *pcdev,
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 
-	meson_pmx_disable_other_groups(pc, range->pin_base + offset, -1);
+	meson_pmx_disable_other_groups(pc, offset, -1);
 
 	return 0;
 }
-- 
2.7.0
