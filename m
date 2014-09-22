From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 3/9] ARM: dts: vf610: add on-chip SRAM
Date: Mon, 22 Sep 2014 19:09:24 +0200
Message-ID: <593e881b5050795076426a4071bfa1bff66cb215.1411404079.git.stefan@agner.ch>
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

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf610.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
index 67bb3b7..d2128e5 100644
--- a/arch/arm/boot/dts/vf610.dtsi
+++ b/arch/arm/boot/dts/vf610.dtsi
@@ -69,6 +69,27 @@
 		interrupt-parent = <&intc>;
 		ranges;
 
+		ocram0: sram@3f000000 {
+			compatible = "mmio-sram";
+			reg = <0x3f000000 0x40000>;
+		};
+
+		ocram1: sram@3f040000 {
+			compatible = "mmio-sram";
+			reg = <0x3f040000 0x40000>;
+		};
+
+		gfxram0: sram@3f400000 {
+			compatible = "mmio-sram";
+			reg = <0x3f400000 0x80000>;
+		};
+
+		/* used by L2 cache */
+		gfxram1: sram@3f480000 {
+			compatible = "mmio-sram";
+			reg = <0x3f480000 0x80000>;
+		};
+
 		aips0: aips-bus@40000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
-- 
2.1.0
