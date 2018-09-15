From: Simon Detheridge <s@sd.ai>
Subject: [PATCH] pinctrl: cannonlake: Fix gpio base for GPP-E
Date: Sat, 15 Sep 2018 22:15:18 +0100
Message-ID: <20180915211518.8155-1-s@sd.ai>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Simon Detheridge <s@sd.ai>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The gpio base for GPP-E was set incorrectly to 258 instead of 256,
preventing the touchpad working on my Tong Fang GK5CN5Z laptop.

Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=200787
Signed-off-by: Simon Detheridge <s@sd.ai>
---
 drivers/pinctrl/intel/pinctrl-cannonlake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index fb1afe55bf53..8d48371caaa2 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -379,7 +379,7 @@ static const struct intel_padgroup cnlh_community1_gpps[] = {
 static const struct intel_padgroup cnlh_community3_gpps[] = {
 	CNL_GPP(0, 155, 178, 192),		/* GPP_K */
 	CNL_GPP(1, 179, 202, 224),		/* GPP_H */
-	CNL_GPP(2, 203, 215, 258),		/* GPP_E */
+	CNL_GPP(2, 203, 215, 256),		/* GPP_E */
 	CNL_GPP(3, 216, 239, 288),		/* GPP_F */
 	CNL_GPP(4, 240, 248, CNL_NO_GPIO),	/* SPI */
 };
-- 
2.16.4
