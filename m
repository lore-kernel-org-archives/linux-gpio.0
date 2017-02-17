From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH 2/9] pinctrl: sunxi: rename sun7i-a20 driver to sunxi-a20-r40
Date: Sat, 18 Feb 2017 01:37:15 +0800
Message-ID: <20170217173722.6477-3-icenowy@aosc.xyz>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBOXKTTCQKGQELRH4EJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The new R40 SoC come with a largely similar version of the pin
controller in A20.

Rename the driver, in order to extend it with R40 support.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
 drivers/pinctrl/sunxi/Kconfig                                          | 2 +-
 drivers/pinctrl/sunxi/Makefile                                         | 2 +-
 drivers/pinctrl/sunxi/{pinctrl-sun7i-a20.c => pinctrl-sunxi-a20-r40.c} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/pinctrl/sunxi/{pinctrl-sun7i-a20.c => pinctrl-sunxi-a20-r40.c} (100%)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 92d845827577..6552cfd5c057 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -26,7 +26,7 @@ config PINCTRL_SUN6I_A31_R
 	depends on RESET_CONTROLLER
 	select PINCTRL_SUNXI
 
-config PINCTRL_SUN7I_A20
+config PINCTRL_SUNXI_A20_R40
 	def_bool MACH_SUN7I
 	select PINCTRL_SUNXI
 
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index f9a3855c42f1..6ceab91c3834 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_PINCTRL_SUN5I)		+= pinctrl-sun5i.o
 obj-$(CONFIG_PINCTRL_SUN6I_A31)		+= pinctrl-sun6i-a31.o
 obj-$(CONFIG_PINCTRL_SUN6I_A31S)	+= pinctrl-sun6i-a31s.o
 obj-$(CONFIG_PINCTRL_SUN6I_A31_R)	+= pinctrl-sun6i-a31-r.o
-obj-$(CONFIG_PINCTRL_SUN7I_A20)		+= pinctrl-sun7i-a20.o
+obj-$(CONFIG_PINCTRL_SUNXI_A20_R40)	+= pinctrl-sunxi-a20-r40.o
 obj-$(CONFIG_PINCTRL_SUN8I_A23)		+= pinctrl-sun8i-a23.o
 obj-$(CONFIG_PINCTRL_SUN8I_A23_R)	+= pinctrl-sun8i-a23-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A33)		+= pinctrl-sun8i-a33.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-a20-r40.c
similarity index 100%
rename from drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
rename to drivers/pinctrl/sunxi/pinctrl-sunxi-a20-r40.c
-- 
2.11.1
