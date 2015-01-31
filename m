From: Kevin Hao <haokexin@gmail.com>
Subject: [PATCH 10/15] gpio: kconfig: replace PPC_OF with PPC
Date: Sat, 31 Jan 2015 21:47:40 +0800
Message-ID: <1422712065-9403-11-git-send-email-haokexin@gmail.com>
References: <1422712065-9403-1-git-send-email-haokexin@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f52.google.com ([209.85.213.52]:33486 "EHLO
	mail-yh0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbbAaNsr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jan 2015 08:48:47 -0500
Received: by mail-yh0-f52.google.com with SMTP id f10so12928788yha.11
        for <linux-gpio@vger.kernel.org>; Sat, 31 Jan 2015 05:48:47 -0800 (PST)
In-Reply-To: <1422712065-9403-1-git-send-email-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Kevin Hao <haokexin@gmail.com>

The PPC_OF is a ppc specific option which is used to mean that the
firmware device tree access functions are available. Since all the
ppc platforms have a device tree, it is aways set to 'y' for ppc.
So it makes no sense to keep a such option in the current kernel.
Replace it with PPC.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ae5cb4d517c6..c1e2ca3d9a51 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -383,7 +383,7 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
-	depends on OF_GPIO && (PPC_OF || MICROBLAZE || ARCH_ZYNQ || X86)
+	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
-- 
1.9.3

