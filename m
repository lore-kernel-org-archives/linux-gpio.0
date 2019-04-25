From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] pinctrl: Rework Kconfig dependency for BM1880 pinctrl driver
Date: Thu, 25 Apr 2019 14:02:24 +0530
Message-ID: <20190425083224.9762-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Make the BM1880 SoC pinctrl driver depend on COMPILE_TEST to get compiler
test coverage and also select this driver by default for ARCH_BITMAIN
platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c4ac4bf1e1e4..19d8af9a36a2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -110,7 +110,8 @@ config PINCTRL_AMD
 
 config PINCTRL_BM1880
 	bool "Bitmain BM1880 Pinctrl driver"
-	depends on ARCH_BITMAIN
+	depends on OF && (ARCH_BITMAIN || COMPILE_TEST)
+	default ARCH_BITMAIN
 	select PINMUX
 	help
 	  Pinctrl driver for Bitmain BM1880 SoC.
-- 
2.17.1
