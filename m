From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] pinctrl: devicetree: Fix dt_to_map_one_config handling of hogs
Date: Wed, 28 Feb 2018 15:53:06 +0000
Message-ID: <20180228155306.1006-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

When dt_to_map_one_config() is called with a pinctrl_dev passed
in, it should only be using this if the node being looked up
is a hog. The code was always using the passed pinctrl_dev
without checking whether the dt node referred to it.

A pin controller can have pinctrl-n dependencies on other pin
controllers in these cases:

- the pin controller hardware is external, for example I2C, so
  needs other pin controller(s) to be setup to communicate with
  the hardware device.

- it is a child of a composite MFD so its of_node is shared with
  the parent MFD and other children of that MFD. Any part of that
  MFD could have dependencies on other pin controllers.

Because of this, dt_to_map_one_config() can't assume that if it
has a pinctrl_dev passed in then the node it looks up must be
a hog. It could be a reference to some other pin controller.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/pinctrl/devicetree.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 1ff6c3573493..b601039d6c69 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -122,8 +122,10 @@ static int dt_to_map_one_config(struct pinctrl *p,
 			/* OK let's just assume this will appear later then */
 			return -EPROBE_DEFER;
 		}
-		if (!pctldev)
-			pctldev = get_pinctrl_dev_from_of_node(np_pctldev);
+		/* If we're creating a hog we can use the passed pctldev */
+		if (pctldev && (np_pctldev == p->dev->of_node))
+			break;
+		pctldev = get_pinctrl_dev_from_of_node(np_pctldev);
 		if (pctldev)
 			break;
 		/* Do not defer probing of hogs (circular loop) */
-- 
2.11.0
