From: Krzysztof Adamski <k@japko.eu>
Subject: [PATCH v5 1/4] clk: sunxi: Add apb0 gates for H3
Date: Mon, 22 Feb 2016 14:03:25 +0100
Message-ID: <1456146208-13890-2-git-send-email-k@japko.eu>
References: <1456146208-13890-1-git-send-email-k@japko.eu>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDIL57GUWIARB6EOVS3AKGQE22PORXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1456146208-13890-1-git-send-email-k-P4rZei/IPtg@public.gmane.org>
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

This patch adds support for APB0 in H3. It seems to be compatible with
earlier SOCs. apb0 gates controls R_ block peripherals (R_PIO, R_IR,
etc).

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 2 ++
 drivers/clk/sunxi/clk-simple-gates.c              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index c09f59b..834436f 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -18,6 +18,7 @@ Required properties:
 	"allwinner,sun4i-a10-cpu-clk" - for the CPU multiplexer clock
 	"allwinner,sun4i-a10-axi-clk" - for the AXI clock
 	"allwinner,sun8i-a23-axi-clk" - for the AXI clock on A23
+	"allwinner,sun4i-a10-gates-clk" - for generic gates on all compatible SoCs
 	"allwinner,sun4i-a10-axi-gates-clk" - for the AXI gates
 	"allwinner,sun4i-a10-ahb-clk" - for the AHB clock
 	"allwinner,sun5i-a13-ahb-clk" - for the AHB clock on A13
@@ -46,6 +47,7 @@ Required properties:
 	"allwinner,sun6i-a31-apb0-gates-clk" - for the APB0 gates on A31
 	"allwinner,sun7i-a20-apb0-gates-clk" - for the APB0 gates on A20
 	"allwinner,sun8i-a23-apb0-gates-clk" - for the APB0 gates on A23
+	"allwinner,sun8i-h3-apb0-gates-clk" - for the APB0 gates on H3
 	"allwinner,sun9i-a80-apb0-gates-clk" - for the APB0 gates on A80
 	"allwinner,sun4i-a10-apb1-clk" - for the APB1 clock
 	"allwinner,sun9i-a80-apb1-clk" - for the APB1 bus clock on A80
diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
index 2cfc5a8..d7ec2dc 100644
--- a/drivers/clk/sunxi/clk-simple-gates.c
+++ b/drivers/clk/sunxi/clk-simple-gates.c
@@ -98,6 +98,8 @@ static void __init sunxi_simple_gates_init(struct device_node *node)
 	sunxi_simple_gates_setup(node, NULL, 0);
 }
 
+CLK_OF_DECLARE(sun4i_a10_gates, "allwinner,sun4i-a10-gates-clk",
+	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun4i_a10_apb0, "allwinner,sun4i-a10-apb0-gates-clk",
 	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun4i_a10_apb1, "allwinner,sun4i-a10-apb1-gates-clk",
@@ -132,6 +134,8 @@ CLK_OF_DECLARE(sun8i_a33_ahb1, "allwinner,sun8i-a33-ahb1-gates-clk",
 	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun8i_a83t_apb0, "allwinner,sun8i-a83t-apb0-gates-clk",
 	       sunxi_simple_gates_init);
+CLK_OF_DECLARE(sun8i_h3_apb0, "allwinner,sun8i-h3-apb0-gates-clk",
+	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun9i_a80_ahb0, "allwinner,sun9i-a80-ahb0-gates-clk",
 	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun9i_a80_ahb1, "allwinner,sun9i-a80-ahb1-gates-clk",
-- 
2.1.4
