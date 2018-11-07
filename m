From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/4] arm64: dts: mediatek: x20: Add pinmux support for UART1
Date: Wed,  7 Nov 2018 23:18:43 +0530
Message-ID: <20181107174844.5381-4-manivannan.sadhasivam@linaro.org>
References: <20181107174844.5381-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107174844.5381-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Add pinmux support for UART1 on MediatekX20 Development board based
on Mediatek MT6797 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts | 2 ++
 arch/arm64/boot/dts/mediatek/mt6797.dtsi        | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts b/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
index 742938a1a548..13939d55b85b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
@@ -30,4 +30,6 @@
 
 &uart1 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins_a>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 231230d32d09..a64bb84bdec3 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -141,6 +141,13 @@
 			    "iocfgr", "iocfgt";
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		uart1_pins_a: uart1 {
+			pins1 {
+				pinmux = <MT6797_GPIO232__FUNC_URXD1>,
+					 <MT6797_GPIO233__FUNC_UTXD1>;
+			};
+		};
 	};
 
 	scpsys: scpsys@10006000 {
-- 
2.17.1
