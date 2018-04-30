From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] pinctrl: actions: fix missing break in PIN_CONFIG_DRIVE_STRENGTH case.
Date: Mon, 30 Apr 2018 14:14:20 +0100
Message-ID: <20180430131420.6155-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a missing break in case PIN_CONFIG_DRIVE_STRENGTH leading to
a fall-through to the PIN_CONFIG_SLEW_RATE case that performs different
checks against *arg. This looks like an unintentional missing break so
add in the break.

Detected by CoverityScan, CID#1468459 ("Missing break in switch")

Fixes: 513d7a2f7e0f ("pinctrl: actions: Add Actions S900 pinctrl driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/actions/pinctrl-owl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 928b40f71a3c..d15abb97821e 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -441,6 +441,7 @@ static int owl_group_pinconf_val2arg(const struct owl_pingroup *g,
 		default:
 			return -EINVAL;
 		}
+		break;
 	case PIN_CONFIG_SLEW_RATE:
 		if (*arg)
 			*arg = 1;
-- 
2.17.0
