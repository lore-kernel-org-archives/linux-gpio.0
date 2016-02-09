From: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 5/5] pinctrl: sunxi: Use pin number when
 calling sunxi_pmx_set
Date: Tue,  9 Feb 2016 15:58:49 +0100
Message-ID: <1455029929-18547-6-git-send-email-k@japko.eu>
References: <1455029929-18547-1-git-send-email-k@japko.eu>
Reply-To: krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD7ILP7VSEGBBYH5462QKGQEARXSNBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455029929-18547-1-git-send-email-k-P4rZei/IPtg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Krzysztof Adamski <k@japko.eu>
List-Id: linux-gpio@vger.kernel.org

sunxi_pmx_set accepts pin number and then calculates offset by
subtracting pin_base from it. sunxi_pinctrl_gpio_get, on the other hand,
gets offset so we have to convert it to pin number so we won't get
negative value in sunxi_pmx_set.

This was only used on A10 so far, where there is only one GPIO chip with
pin_base set to 0 so it didn't matter. However H3 also requires this
workaround but have two pinmux sections, triggering problem for PL port.

Signed-off-by: Krzysztof Adamski <k@japko.eu>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 7a2465f..96f64a1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -459,15 +459,16 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	u8 index = sunxi_data_offset(offset);
 	u32 set_mux = pctl->desc->irq_read_needs_mux &&
 			test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
+	u32 pin = offset + chip->base;
 	u32 val;
 
 	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, offset, SUN4I_FUNC_INPUT);
+		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_INPUT);
 
 	val = (readl(pctl->membase + reg) >> index) & DATA_PINS_MASK;
 
 	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, offset, SUN4I_FUNC_IRQ);
+		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_IRQ);
 
 	return !!val;
 }
-- 
2.1.4
