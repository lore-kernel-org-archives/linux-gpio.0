From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 1/3] pinctrl: sunxi: Fix PIN_CONFIG_BIAS_PULL_{DOWN,UP}
 argument
Date: Fri, 11 Nov 2016 10:44:53 +0800
Message-ID: <20161111024455.16883-2-wens@csie.org>
References: <20161111024455.16883-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKPBSTAQKGQED42CDJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161111024455.16883-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

According to pinconf-generic.h, the argument for
PIN_CONFIG_BIAS_PULL_{DOWN,UP} is non-zero if the bias is enabled
with a pull up/down resistor, zero if it is directly connected
to VDD or ground.

Since Allwinner hardware uses a weak pull resistor internally,
the argument should be 1.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index e199d95af8c0..e04edda8629d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -291,12 +291,16 @@ static unsigned long *sunxi_pctrl_build_pin_config(struct device_node *node,
 
 	if (sunxi_pctrl_has_bias_prop(node)) {
 		int pull = sunxi_pctrl_parse_bias_prop(node);
+		int arg = 0;
 		if (pull < 0) {
 			ret = pull;
 			goto err_free;
 		}
 
-		pinconfig[idx++] = pinconf_to_config_packed(pull, 0);
+		if (pull != PIN_CONFIG_BIAS_DISABLE)
+			arg = 1; /* hardware uses weak pull resistors */
+
+		pinconfig[idx++] = pinconf_to_config_packed(pull, arg);
 	}
 
 
-- 
2.10.2
