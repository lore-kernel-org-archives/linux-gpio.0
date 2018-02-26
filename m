From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: imx: fix unsigned check if nfuncs with less than or equal zero
Date: Mon, 26 Feb 2018 12:04:18 +0000
Message-ID: <20180226120418.3589-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, inus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The unsigned integer nfuncs is being error checked with a value less
or equal to zero; this is always false if of_get_child_count returns
a -ve for an error condition since nfuncs is not signed. Fix this by
making variables nfuncs and i signed integers.

Detected with Coccinelle:
drivers/pinctrl/freescale/pinctrl-imx.c:620:6-12: WARNING: Unsigned
expression compared with zero: nfuncs <= 0

Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 24aaddd760a0..1e8ca83352d0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -605,8 +605,8 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *child;
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	u32 nfuncs = 0;
-	u32 i = 0;
+	int nfuncs = 0;
+	int i = 0;
 	bool flat_funcs;
 
 	if (!np)
-- 
2.15.1
