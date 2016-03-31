From: Gang Liu <gang.liu@nxp.com>
Subject: RE: [PATCH v2] gpio/ls1043a: Add compatible "fsl,qoriq-gpio" for
 ls1043a gpio nodes
Date: Thu, 31 Mar 2016 03:36:58 +0000
Message-ID: <DB4PR04MB2669775E0D0FDCB30C200A682990@DB4PR04MB266.eurprd04.prod.outlook.com>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
 <1458726442-1851-3-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1458726442-1851-3-git-send-email-Gang.Liu@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gang Liu <gang.liu@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "khilman@linaro.org" <khilman@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Scott Wood <scott.wood@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi, Linus Walleij,

Do you have some comments about this set of patches?
Could you please help to ACK and apply those?

Thanks a lot!
Liu Gang

-----Original Message-----
From: Liu Gang [mailto:Gang.Liu@nxp.com] 
Sent: Wednesday, March 23, 2016 5:47 PM
To: linus.walleij@linaro.org; linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; khilman@linaro.org
Cc: robh+dt@kernel.org; Scott Wood <scott.wood@nxp.com>; Yang-Leo Li <leoyang.li@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Gang Liu <gang.liu@nxp.com>
Subject: [PATCH v2] gpio/ls1043a: Add compatible "fsl,qoriq-gpio" for ls1043a gpio nodes

The compatible "fsl,qoriq-gpio" is used by gpio driver:
drivers/gpio/gpio-mpc8xxx.c to implement general gpio functionalities.

The chip-specific compatible "fsl,ls1043a-gpio" may be used to fix potential gpio IP block errata or other chip-specific gpio issues.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
v2 changes:
	Add chip-specific compatible based on Scott's
	comment.

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index be72bf5..bf70b27 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -284,7 +284,7 @@
 		};
 
 		gpio1: gpio@2300000 {
-			compatible = "fsl,ls1043a-gpio";
+			compatible = "fsl,ls1043a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2300000 0x0 0x10000>;
 			interrupts = <0 66 0x4>;
 			gpio-controller;
@@ -294,7 +294,7 @@
 		};
 
 		gpio2: gpio@2310000 {
-			compatible = "fsl,ls1043a-gpio";
+			compatible = "fsl,ls1043a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2310000 0x0 0x10000>;
 			interrupts = <0 67 0x4>;
 			gpio-controller;
@@ -304,7 +304,7 @@
 		};
 
 		gpio3: gpio@2320000 {
-			compatible = "fsl,ls1043a-gpio";
+			compatible = "fsl,ls1043a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2320000 0x0 0x10000>;
 			interrupts = <0 68 0x4>;
 			gpio-controller;
@@ -314,7 +314,7 @@
 		};
 
 		gpio4: gpio@2330000 {
-			compatible = "fsl,ls1043a-gpio";
+			compatible = "fsl,ls1043a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2330000 0x0 0x10000>;
 			interrupts = <0 134 0x4>;
 			gpio-controller;
--
2.1.0.27.g96db324
