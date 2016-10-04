From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/3] pinctrl: sunxi: Fix PIN_CONFIG_BIAS_PULL_{DOWN,UP}
 argument
Date: Tue,  4 Oct 2016 09:51:11 +0800
Message-ID: <20161004015112.20833-3-wens@csie.org>
References: <20161004015112.20833-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBFEWZS7QKGQEIM7MAHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161004015112.20833-1-wens-jdAy2FN1RRM@public.gmane.org>
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
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 609843c9a65c..236272a2339d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -234,7 +234,7 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				pull = PIN_CONFIG_BIAS_PULL_UP;
 			else if (val == 2)
 				pull = PIN_CONFIG_BIAS_PULL_DOWN;
-			pinconfig[j++] = pinconf_to_config_packed(pull, 0);
+			pinconfig[j++] = pinconf_to_config_packed(pull, 1);
 		}
 
 		(*map)[i].data.configs.configs = pinconfig;
-- 
2.9.3
