From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] gpio: xilinx: Drop architecture dependencies
Date: Mon, 19 Oct 2015 10:42:13 -0700
Message-ID: <1445276534-6948-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Moritz Fischer <moritz.fischer@ettus.com>, Lars-Peter Clausen <lars@metafoo.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

The driver does not have any real architecture dependencies. To avoid
listing each architecture that might use this driver on some
FPGA-enabled platform, drop these dependencies.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 63000b1f9da8..45dfeef6018f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -506,7 +506,7 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
-	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
+	depends on OF_GPIO
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
-- 
2.6.2.3.ga463a5b
