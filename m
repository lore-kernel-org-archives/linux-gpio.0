From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 12/28] gpio: pch: allow build on MIPS platforms
Date: Mon, 30 Nov 2015 16:21:37 +0000
Message-ID: <1448900513-20856-13-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Allow the pch_gpio driver to be built for MIPS platforms, in preparation
for use on the MIPS Boston board.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b18bea0..19d7dd7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -952,7 +952,7 @@ config GPIO_ML_IOH
 
 config GPIO_PCH
 	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH(ML7223/ML7831) GPIO"
-	depends on PCI && (X86_32 || COMPILE_TEST)
+	depends on PCI && (X86_32 || MIPS || COMPILE_TEST)
 	select GENERIC_IRQ_CHIP
 	help
 	  This driver is for PCH(Platform controller Hub) GPIO of Intel Topcliff
-- 
2.6.2
