From: Eric Anholt <eric@anholt.net>
Subject: [PATCH] pinctrl-bcm2835: Fix cut-and-paste error in "pull" parsing
Date: Mon, 29 Feb 2016 17:30:08 -0800
Message-ID: <1456795808-1449-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.org>

The DT bindings for pinctrl-bcm2835 allow both the function and pull
to contain either one entry or one per pin. However, an error in the
DT parsing can cause failures if the number of pulls differs from the
number of functions.

Signed-off-by: Eric Anholt <eric@anholt.net>
Cc: stable@vger.kernel.org
---

Yes, the s-o-b differs from the author of the commit, but this falls
under part b) of the process.

Phil, any chance you could start putting Signed-off-by lines on your
kernel commits?

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 0f5997c..08b1d93 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -779,7 +779,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		}
 		if (num_pulls) {
 			err = of_property_read_u32_index(np, "brcm,pull",
-					(num_funcs > 1) ? i : 0, &pull);
+					(num_pulls > 1) ? i : 0, &pull);
 			if (err)
 				goto out;
 			err = bcm2835_pctl_dt_node_to_map_pull(pc, np, pin,
-- 
2.7.0
