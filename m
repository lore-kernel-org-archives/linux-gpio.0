From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v2 3/3] gpio: Davinci: Add K3 dependencies
Date: Wed, 5 Jun 2019 13:32:59 +0530
Message-ID: <20190605080259.2462-4-j-keerthy@ti.com>
References: <20190605080259.2462-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605080259.2462-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: lokeshvutla@ti.com, linux-gpio@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add K3 dependencies to enable the driver on K3 platforms.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 62f3fe06cd2f..28dba62e2219 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -174,7 +174,7 @@ config GPIO_CLPS711X
 config GPIO_DAVINCI
 	bool "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
-	depends on ARM && (ARCH_DAVINCI || ARCH_KEYSTONE)
+	depends on (ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-- 
2.17.1
