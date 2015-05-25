From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 18/21] pinctrl: Probe pinctrl devices on demand
Date: Mon, 25 May 2015 16:53:22 +0200
Message-ID: <1432565608-26036-19-git-send-email-tomeu.vizoso@collabora.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?St=C3=A9phane=20Marchesin?= <stephane.marchesin@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexander Holler <holler@ahsoftware.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When looking up a pin controller through its DT node, ensure that the
corresponding device has been registered.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/pinctrl/devicetree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 0bbf7d7..17231ea 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -18,6 +18,7 @@
 
 #include <linux/device.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
 
@@ -118,6 +119,7 @@ static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
 
 	/* Find the pin controller containing np_config */
 	np_pctldev = of_node_get(np_config);
+	of_platform_device_ensure(np_pctldev);
 	for (;;) {
 		np_pctldev = of_get_next_parent(np_pctldev);
 		if (!np_pctldev || of_node_is_root(np_pctldev)) {
-- 
2.4.1
