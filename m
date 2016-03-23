From: Liu Gang <Gang.Liu@nxp.com>
Subject: [PATCH] gpio/ls2080a: Add compatible "fsl,
 ls2080a-gpio" for ls2080a gpio nodes
Date: Wed, 23 Mar 2016 17:47:22 +0800
Message-ID: <1458726442-1851-4-git-send-email-Gang.Liu@nxp.com>
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

The compatible "fsl,qoriq-gpio" is used by gpio driver:
drivers/gpio/gpio-mpc8xxx.c to implement general gpio
functionalities.

The chip-specific compatible "fsl,ls2080a-gpio" may be
used to fix potential gpio IP block errata or other
chip-specific gpio issues.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 9d746c6..24b4330 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -342,7 +342,7 @@
 		};
 
 		gpio0: gpio@2300000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2300000 0x0 0x10000>;
 			interrupts = <0 36 0x4>; /* Level high type */
 			gpio-controller;
@@ -353,7 +353,7 @@
 		};
 
 		gpio1: gpio@2310000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2310000 0x0 0x10000>;
 			interrupts = <0 36 0x4>; /* Level high type */
 			gpio-controller;
@@ -364,7 +364,7 @@
 		};
 
 		gpio2: gpio@2320000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2320000 0x0 0x10000>;
 			interrupts = <0 37 0x4>; /* Level high type */
 			gpio-controller;
@@ -375,7 +375,7 @@
 		};
 
 		gpio3: gpio@2330000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2330000 0x0 0x10000>;
 			interrupts = <0 37 0x4>; /* Level high type */
 			gpio-controller;
-- 
2.1.0.27.g96db324
