From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: sunxi: add a missing function of
 A10/A20 pinctrl driver
Date: Thu,  6 Jul 2017 22:28:21 +0800
Message-ID: <20170706142822.20296-2-icenowy@aosc.io>
References: <20170706142822.20296-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBK4S7HFAKGQEVEGGJUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170706142822.20296-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

The PH16 pin has a function with mux id 0x5, which is the DET pin of the
"sim" (smart card reader) IP block.

This function is missing both in the old A10 and A20 drivers, so it's
not found during the merge of these two drivers.

Add it to the driver. As we now merged A20 pinctrl driver to the A10
one, we need to only fix the A10 driver now.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
index 159580c04b14..47a392bc73c8 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
@@ -918,6 +918,7 @@ static const struct sunxi_desc_pin sun4i_a10_pins[] = {
 		  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXD1 */
 					 PINCTRL_SUN7I_A20),
 		  SUNXI_FUNCTION(0x4, "keypad"),	/* IN6 */
+		  SUNXI_FUNCTION(0x5, "sim"),		/* DET */
 		  SUNXI_FUNCTION_IRQ(0x6, 16),		/* EINT16 */
 		  SUNXI_FUNCTION(0x7, "csi1")),		/* D16 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
-- 
2.13.0
