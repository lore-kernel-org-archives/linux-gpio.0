From: Krzysztof Adamski <k@japko.eu>
Subject: [PATCH v2 1/5] clk: sunxi: Add apb0 gates for H3
Date: Tue,  2 Feb 2016 22:21:49 +0100
Message-ID: <1454448113-18810-2-git-send-email-k@japko.eu>
References: <1454448113-18810-1-git-send-email-k@japko.eu>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDIL57GUWIARBMN4YS2QKGQENZFHP3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454448113-18810-1-git-send-email-k-P4rZei/IPtg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Adamski <k@japko.eu>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

This patch adds support for APB0 in H3. It seems to be compatible with
earlier SOCs. apb0 gates controls R_ block peripherals (R_PIO, R_IR,
etc).

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
 drivers/clk/sunxi/clk-simple-gates.c              | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index e59f57b..6ee6875 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -32,6 +32,7 @@ Required properties:
 	"allwinner,sun8i-h3-ahb2-clk" - for the AHB2 clock on H3
 	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
 	"allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
+	"allwinner,sun8i-h3-abp0-gates-clk" - for the APB0 gates on H3
 	"allwinner,sun9i-a80-ahb0-gates-clk" - for the AHB0 gates on A80
 	"allwinner,sun9i-a80-ahb1-gates-clk" - for the AHB1 gates on A80
 	"allwinner,sun9i-a80-ahb2-gates-clk" - for the AHB2 gates on A80
diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
index f4da52b..8a1fa3e 100644
--- a/drivers/clk/sunxi/clk-simple-gates.c
+++ b/drivers/clk/sunxi/clk-simple-gates.c
@@ -130,6 +130,8 @@ CLK_OF_DECLARE(sun8i_a23_apb2, "allwinner,sun8i-a23-apb2-gates-clk",
 	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun8i_a33_ahb1, "allwinner,sun8i-a33-ahb1-gates-clk",
 	       sunxi_simple_gates_init);
+CLK_OF_DECLARE(sun8i_h3_abp0, "allwinner,sun8i-h3-abp0-gates-clk",
+	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun9i_a80_ahb0, "allwinner,sun9i-a80-ahb0-gates-clk",
 	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun9i_a80_ahb1, "allwinner,sun9i-a80-ahb1-gates-clk",
-- 
2.1.4
