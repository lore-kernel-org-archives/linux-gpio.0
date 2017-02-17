From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH 7/9] phy: sun4i-usb: add support for R40 USB PHY
Date: Sat, 18 Feb 2017 01:37:20 +0800
Message-ID: <20170217173722.6477-8-icenowy@aosc.xyz>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBT7LTTCQKGQE4ISBPYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170217173722.6477-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Allwinner R40 features a USB PHY like the one in A64, but with 3 ports.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt |  1 +
 drivers/phy/phy-sun4i-usb.c                             | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
index e42334258185..184a1d7af352 100644
--- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
@@ -11,6 +11,7 @@ Required properties:
   * allwinner,sun8i-a33-usb-phy
   * allwinner,sun8i-h3-usb-phy
   * allwinner,sun8i-v3s-usb-phy
+  * allwinner,sun8i-r40-usb-phy
   * allwinner,sun50i-a64-usb-phy
 - reg : a list of offset + length pairs
 - reg-names :
diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index a21b5f24a340..3c6ddd6750dd 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -100,6 +100,7 @@ enum sun4i_usb_phy_type {
 	sun8i_a33_phy,
 	sun8i_h3_phy,
 	sun8i_v3s_phy,
+	sun8i_r40_phy,
 	sun50i_a64_phy,
 };
 
@@ -188,10 +189,8 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
 
 	spin_lock_irqsave(&phy_data->reg_lock, flags);
 
-	if (phy_data->cfg->type == sun8i_a33_phy ||
-	    phy_data->cfg->type == sun50i_a64_phy ||
-	    phy_data->cfg->type == sun8i_v3s_phy) {
-		/* A33 or A64 needs us to set phyctl to 0 explicitly */
+	if (phy_data->cfg->phyctl_offset == REG_PHYCTL_A33) {
+		/* A33-style phyctl register needs to be set to 0 explicitly */
 		writel(0, phyctl);
 	}
 
@@ -845,6 +844,15 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.enable_pmu_unk1 = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
+	.num_phys = 3,
+	.type = sun8i_r40_phy,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.enable_pmu_unk1 = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -854,6 +862,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun8i-a33-usb-phy", .data = &sun8i_a33_cfg },
 	{ .compatible = "allwinner,sun8i-h3-usb-phy", .data = &sun8i_h3_cfg },
 	{ .compatible = "allwinner,sun8i-v3s-usb-phy", .data = &sun8i_v3s_cfg },
+	{ .compatible = "allwinner,sun8i-r40-usb-phy", .data = &sun8i_r40_cfg },
 	{ .compatible = "allwinner,sun50i-a64-usb-phy",
 	  .data = &sun50i_a64_cfg},
 	{ },
-- 
2.11.1
