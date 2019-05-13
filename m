From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH] pinctrl: stmfx: Fix comparison of unsigned expression warnings
Date: Mon, 13 May 2019 09:30:06 +0200
Message-ID: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org, Julia Lawall <julia.lawall@lip6.fr>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: linux-gpio@vger.kernel.org

This patch fixes the following warnings:

drivers/pinctrl/pinctrl-stmfx.c:225:5-8: WARNING: Unsigned expression
compared with zero: dir < 0
drivers/pinctrl/pinctrl-stmfx.c:231:5-9: WARNING: Unsigned expression
compared with zero: pupd < 0
drivers/pinctrl/pinctrl-stmfx.c:228:5-9: WARNING: Unsigned expression
compared with zero: type < 0

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index bcd8126..3bd5d6f 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -213,7 +213,7 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
 	struct stmfx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	u32 param = pinconf_to_config_param(*config);
 	struct pinctrl_gpio_range *range;
-	u32 dir, type, pupd;
+	int dir, type, pupd;
 	u32 arg = 0;
 	int ret;
 
-- 
2.7.4
