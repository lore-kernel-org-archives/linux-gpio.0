From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 3/3] pinctrl: madera: Fix missing space in debugfs output
Date: Tue, 7 Aug 2018 10:32:26 +0100
Message-ID: <20180807093226.5624-3-rf@opensource.cirrus.com>
References: <20180807093226.5624-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807093226.5624-1-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

The SCHMITT tag was being dumped without a separating space.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 4ba56ca5a9be..979df109e187 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -550,7 +550,7 @@ static void __maybe_unused madera_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, " DRV=%umA", madera_pin_unmake_drv_str(priv, conf[1]));
 
 	if (conf[0] & MADERA_GP1_IP_CFG_MASK)
-		seq_puts(s, "SCHMITT");
+		seq_puts(s, " SCHMITT");
 }
 
 
-- 
2.11.0
