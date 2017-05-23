From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] pinctrl: meson-gxbb: Add missing GPIODV_18 pin entry
Date: Tue, 23 May 2017 16:09:19 +0200
Message-ID: <1495548559-22261-3-git-send-email-narmstrong@baylibre.com>
References: <1495548559-22261-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495548559-22261-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

GPIODV_18 entry was missing in the original driver push.

Fixes: 468c234f9ed7 ("pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 3ccb0f4f..7d897c5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -85,6 +85,7 @@
 	MESON_PIN(GPIODV_15, EE_OFF),
 	MESON_PIN(GPIODV_16, EE_OFF),
 	MESON_PIN(GPIODV_17, EE_OFF),
+	MESON_PIN(GPIODV_18, EE_OFF),
 	MESON_PIN(GPIODV_19, EE_OFF),
 	MESON_PIN(GPIODV_20, EE_OFF),
 	MESON_PIN(GPIODV_21, EE_OFF),
-- 
1.9.1
