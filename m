From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 3/6] pinctrl: imx: use seq_puts() instead of seq_printf()
Date: Sat, 28 Apr 2018 03:01:50 +0800
Message-ID: <1524855713-15527-4-git-send-email-aisheng.dong@nxp.com>
References: <1524855713-15527-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524855713-15527-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: aisheng.dong@nxp.com, dongas86@gmail.com, Fabio Estevam <festevam@gmail.com>, linus.walleij@linaro.org, stefan@agner.ch, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

For a constant format without additional arguments, use seq_puts()
instead of seq_printf(). Also, it fixes the following checkpatch
warning.

WARNING: Prefer seq_puts to seq_printf
+		seq_printf(s, "N/A");

WARNING: Prefer seq_puts to seq_printf
+	seq_printf(s, "\n");

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index ff6ca6a4..4e730c3 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -371,7 +371,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	unsigned long config;
 
 	if (!pin_reg || pin_reg->conf_reg == -1) {
-		seq_printf(s, "N/A");
+		seq_puts(s, "N/A");
 		return;
 	}
 
@@ -390,7 +390,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	if (group > pctldev->num_groups)
 		return;
 
-	seq_printf(s, "\n");
+	seq_puts(s, "\n");
 	grp = pinctrl_generic_get_group(pctldev, group);
 	if (!grp)
 		return;
-- 
2.7.4
