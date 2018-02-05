From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] drm/rockchip: lvds: Explicitly include pinctrl headers
Date: Mon,  5 Feb 2018 13:47:49 +0100
Message-ID: <20180205124750.19305-2-thierry.reding@gmail.com>
References: <20180205124750.19305-1-thierry.reding@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20180205124750.19305-1-thierry.reding@gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Rockchip LVDS driver fails to build after commit 23c35f48f5fb
("pinctrl: remove include file from <linux/device.h>") because it relies
on the pinctrl/consumer.h and pinctrl/devinfo.h being pulled in by the
device.h header implicitly.

Include these headers explicitly to avoid the build failure.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 84911bdc27d1..cd1e1d1edc1d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -25,6 +25,8 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/devinfo.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-- 
2.15.1
