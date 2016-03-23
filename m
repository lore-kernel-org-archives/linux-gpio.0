From: Liu Gang <Gang.Liu@nxp.com>
Subject: [PATCH v2] gpio/ls1021a: Add gpio support for ls1021a platform
Date: Wed, 23 Mar 2016 17:47:20 +0800
Message-ID: <1458726442-1851-2-git-send-email-Gang.Liu@nxp.com>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@linaro.org
Cc: Liu Gang <Gang.Liu@nxp.com>, robh+dt@kernel.org, leoyang.li@nxp.com, mingkai.hu@nxp.com, scott.wood@nxp.com
List-Id: linux-gpio@vger.kernel.org

Add gpio nodes for ls1021a platform dts file. The gpio
IP block of the ls1021a can be supported by the code
drivers/gpio/gpio-mpc8xxx.c.

The compatible "fsl,qoriq-gpio" is used by gpio driver:
drivers/gpio/gpio-mpc8xxx.c to implement general gpio
functionalities.

The chip-specific compatible "fsl,ls1021a-gpio" may be
used to fix potential gpio IP block errata or other
chip-specific gpio issues.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
v2 changes:
	Add chip-specific compatible based on Scott's
	comment.

 arch/arm/boot/dts/ls1021a.dtsi | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index ecf12dc..662b336 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -332,6 +332,46 @@
 			status = "disabled";
 		};
 
+		gpio0: gpio@2300000 {
+			compatible = "fsl,ls1021a-gpio", "fsl,qoriq-gpio";
+			reg = <0x0 0x2300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@2310000 {
+			compatible = "fsl,ls1021a-gpio", "fsl,qoriq-gpio";
+			reg = <0x0 0x2310000 0x0 0x10000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@2320000 {
+			compatible = "fsl,ls1021a-gpio", "fsl,qoriq-gpio";
+			reg = <0x0 0x2320000 0x0 0x10000>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@2330000 {
+			compatible = "fsl,ls1021a-gpio", "fsl,qoriq-gpio";
+			reg = <0x0 0x2330000 0x0 0x10000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		lpuart0: serial@2950000 {
 			compatible = "fsl,ls1021a-lpuart";
 			reg = <0x0 0x2950000 0x0 0x1000>;
-- 
2.1.0.27.g96db324
