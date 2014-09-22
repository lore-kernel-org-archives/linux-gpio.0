From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/9] ARM: dts: vf610: Add system reset controller (SRC)
Date: Mon, 22 Sep 2014 19:09:22 +0200
Message-ID: <2ca1cf3732a00512fa19b6118f9fb30aba014deb.1411404079.git.stefan@agner.ch>
References: <cover.1411404079.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1411404079.git.stefan@agner.ch>
In-Reply-To: <cover.1411404079.git.stefan@agner.ch>
References: <cover.1411404079.git.stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@freescale.com, kernel@pengutronix.de, linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, stefan@agner.ch, linux-gpio@vger.kernel.org, jingchang.lu@freescale.com, b20788@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Add device tree property for system reset controller.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf610.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
index 3a6840c..122a64956 100644
--- a/arch/arm/boot/dts/vf610.dtsi
+++ b/arch/arm/boot/dts/vf610.dtsi
@@ -366,6 +366,13 @@
 				reg = <0x40034800 0x200>;
 				clocks = <&clks VF610_CLK_USBC0>;
 			};
+
+			src: src@4006e000 {
+				compatible = "fsl,vf610-src";
+				reg = <0x4006e000 0x1000>;
+				interrupts = <0 96 IRQ_TYPE_LEVEL_HIGH>;
+				#reset-cells = <0>;
+			};
 		};
 
 		aips1: aips-bus@40080000 {
-- 
2.1.0
