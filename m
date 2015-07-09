From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: move CONFIG_PINCTRL to drivers/Makefile
Date: Thu,  9 Jul 2015 10:55:01 +0900
Message-ID: <1436406901-31919-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Pratik Patel <pratikp@codeaurora.org>, Oded Gabbay <oded.gabbay@amd.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Valentin Rothberg <valentinrothberg@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Kbuild should descend into drivers/pinctrl/ only when CONFIG_PINCTRL
is enabled because everything under that directory depends on
CONFIG_PINCTRL.

We can avoid the conditional, ifeq ($(CONFIG_OF),y) ... endif.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/Makefile         | 2 +-
 drivers/pinctrl/Makefile | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index b64b49f..e4b260e 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -11,7 +11,7 @@ obj-y				+= bus/
 obj-$(CONFIG_GENERIC_PHY)	+= phy/
 
 # GPIO must come after pinctrl as gpios may need to mux pins etc
-obj-y				+= pinctrl/
+obj-$(CONFIG_PINCTRL)		+= pinctrl/
 obj-y				+= gpio/
 obj-y				+= pwm/
 obj-$(CONFIG_PCI)		+= pci/
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f6710a8..76ba976 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -2,12 +2,10 @@
 
 subdir-ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG
 
-obj-$(CONFIG_PINCTRL)		+= core.o pinctrl-utils.o
+obj-y				+= core.o pinctrl-utils.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
-ifeq ($(CONFIG_OF),y)
-obj-$(CONFIG_PINCTRL)		+= devicetree.o
-endif
+obj-$(CONFIG_OF)		+= devicetree.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_PINCTRL_ADI2)	+= pinctrl-adi2.o
 obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
-- 
1.9.1
