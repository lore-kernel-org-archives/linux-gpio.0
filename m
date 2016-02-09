From: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/5] dts: sun8i-h3: Add APB0 related clocks
 and resets
Date: Tue,  9 Feb 2016 15:58:46 +0100
Message-ID: <1455029929-18547-3-git-send-email-k@japko.eu>
References: <1455029929-18547-1-git-send-email-k@japko.eu>
Reply-To: krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD7ILP7VSEGBBXP5462QKGQEUHHOB2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

APB0 is bearly mentioned in H3 User Manual and it is only setup in the
Allwinners kernel dump for CIR. I have verified experimentally that the
gate for R_PIO exists and works, though. There are probably other gates
there but I don't know their order right now and I don't have access to
their peripherals on my board to test them.

After some experiments and reviewing how this is organized on other
sunxi SoCs, I couldn't actually find any way to disable clocks for R_PIO
and they are working properly without doing anything so I assume they
are connected straight to the 24Mhz oscillator for now.

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 6f6b4e4..a7b2c53 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -285,6 +285,24 @@
 			clocks = <&osc24M>, <&pll6x2>, <&pll5>;
 			clock-output-names = "mbus";
 		};
+
+		apb0: apb0_clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+			clocks = <&osc24M>;
+			clock-output-names = "apb0";
+		};
+
+		apb0_gates: clk@01f01428 {
+			compatible = "allwinner,sun8i-h3-apb0-gates-clk";
+			reg = <0x01f01428 0x4>;
+			#clock-cells = <1>;
+			clocks = <&apb0>;
+			clock-indices = <0>, <1>;
+			clock-output-names = "apb0_pio", "apb0_ir";
+		};
 	};
 
 	soc {
@@ -502,5 +520,11 @@
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		apb0_reset: reset@01f014b0 {
+			reg = <0x01f014b0 0x4>;
+			compatible = "allwinner,sun6i-a31-clock-reset";
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.1.4
