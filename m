From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH trivial 10/16] gpio: Spelling s/than/that/
Date: Tue, 11 Mar 2014 11:23:44 +0100
Message-ID: <1394533430-4746-10-git-send-email-geert@linux-m68k.org>
References: <1394533430-4746-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394533430-4746-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 858681ba0f5b..a994ba9608cd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -648,7 +648,7 @@ config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
 	depends on PCI && VIDEO_BT848=n
 	help
-	  The BT8xx frame grabber chip has 24 GPIO pins than can be abused
+	  The BT8xx frame grabber chip has 24 GPIO pins that can be abused
 	  as a cheap PCI GPIO card.
 
 	  This chip can be found on Miro, Hauppauge and STB TV-cards.
-- 
1.7.9.5
