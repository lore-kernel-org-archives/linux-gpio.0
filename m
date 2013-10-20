From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 3/3] gpiolib: make GPIO_DEVRES depend on GPIOLIB
Date: Sun, 20 Oct 2013 15:14:59 -0700
Message-ID: <1382307299-22587-4-git-send-email-acourbot@nvidia.com>
References: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Current Kconfig allows GPIO_DEVRES to be selected and compiled without
GPIOLIB. This does not make sense anymore since GPIOLIB has become the
exclusive way to deal with GPIOs. This patch makes GPIO_DEVRES available
only if GPIOLIB is selected.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 92e258c..62eb9ef 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -30,10 +30,6 @@ config ARCH_REQUIRE_GPIOLIB
 	  Selecting this from the architecture code will cause the gpiolib
 	  code to always get built in.
 
-config GPIO_DEVRES
-	def_bool y
-	depends on HAS_IOMEM
-
 
 menuconfig GPIOLIB
 	bool "GPIO Support"
@@ -47,6 +43,10 @@ menuconfig GPIOLIB
 
 if GPIOLIB
 
+config GPIO_DEVRES
+	def_bool y
+	depends on HAS_IOMEM
+
 config OF_GPIO
 	def_bool y
 	depends on OF
-- 
1.8.4.1
