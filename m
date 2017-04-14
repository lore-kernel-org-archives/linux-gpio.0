From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 07/10] pinctrl: imx: Use seq_puts() in imx_pinconf_dbg_show()
Date: Fri, 14 Apr 2017 11:19:17 +0200
Message-ID: <58b499ad-a6c3-5f67-5113-e80cf87aaf24@users.sourceforge.net>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 15:50:58 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 71dbba892e70..c6bfabcd577a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -424,7 +424,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	unsigned long config;
 
 	if (!pin_reg || pin_reg->conf_reg == -1) {
-		seq_printf(s, "N/A");
+		seq_puts(s, "N/A");
 		return;
 	}
 
-- 
2.12.2

