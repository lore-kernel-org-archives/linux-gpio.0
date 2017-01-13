From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: remove redundant pin < 0 check on unsigned int
Date: Fri, 13 Jan 2017 13:20:39 +0000
Message-ID: <20170113132039.19830-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

pin is an unsigned int and therefore can never be < 0 so
this check is redudant. Remove the check and the associated
dev_err error message.

Fixes CoverityScan CID#1396438 ("Unsigned compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 3b86d3d..a345166 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -665,12 +665,6 @@ static void ti_iodelay_pin_dbg_show(struct pinctrl_dev *pctldev,
 	r = iod->reg_data;
 
 	offset = ti_iodelay_pin_to_offset(iod, pin);
-	if (pin < 0) {
-		dev_err(iod->dev, "invalid pin offset for pin%i\n", pin);
-
-		return;
-	}
-
 	pd = &iod->pa[pin];
 	cfg = pd->drv_data;
 
-- 
2.10.2
