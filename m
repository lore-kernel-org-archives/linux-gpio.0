From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] pinctrl: aspeed: Wrap -Woverride-init with cc-option
Date: Mon, 10 Dec 2018 17:05:06 -0700
Message-ID: <20181211000506.7559-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Clang does not support this option:

warning: unknown warning option '-Woverride-init'; did you mean
'-Woverride-module'? [-Wunknown-warning-option]
1 warning generated.

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/pinctrl/aspeed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
index 191ed0fc1804..790b406aae19 100644
--- a/drivers/pinctrl/aspeed/Makefile
+++ b/drivers/pinctrl/aspeed/Makefile
@@ -1,6 +1,6 @@
 # Aspeed pinctrl support
 
-ccflags-y += -Woverride-init
+ccflags-y += $(call cc-option,-Woverride-init)
 obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o
 obj-$(CONFIG_PINCTRL_ASPEED_G4)	+= pinctrl-aspeed-g4.o
 obj-$(CONFIG_PINCTRL_ASPEED_G5)	+= pinctrl-aspeed-g5.o
-- 
2.20.0
