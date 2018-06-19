From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 5/5] pinctrl: core: Remove broken remove_last group and pinmux functions
Date: Tue, 19 Jun 2018 02:31:26 -0700
Message-ID: <20180619093126.74060-6-tony@atomide.com>
References: <20180619093126.74060-1-tony@atomide.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619093126.74060-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Christ van Willegen <cvwillegen@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

With no users left for these functions let's remove them.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Christ van Willegen <cvwillegen@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/pinctrl/core.h   | 6 ------
 drivers/pinctrl/pinmux.h | 7 -------
 2 files changed, 13 deletions(-)

diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -218,12 +218,6 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
 				 unsigned int group_selector);
 
-static inline int
-pinctrl_generic_remove_last_group(struct pinctrl_dev *pctldev)
-{
-	return pinctrl_generic_remove_group(pctldev, pctldev->num_groups - 1);
-}
-
 #endif	/* CONFIG_GENERIC_PINCTRL_GROUPS */
 
 struct pinctrl_dev *get_pinctrl_dev_from_devname(const char *dev_name);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -150,13 +150,6 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 				   unsigned int selector);
 
-static inline int
-pinmux_generic_remove_last_function(struct pinctrl_dev *pctldev)
-{
-	return pinmux_generic_remove_function(pctldev,
-					      pctldev->num_functions - 1);
-}
-
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
 #else
-- 
2.17.1
