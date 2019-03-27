From: Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH v1] gpio: gpio-mlxbf: Add dependency on 64BIT to Kconfig entry
Date: Wed, 27 Mar 2019 10:15:15 -0400
Message-ID: <bfe609b73c36810457e5ae75b74e1d0fb7f6c5ac.1553696064.git.sramani@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Shravan Kumar Ramani <sramani@mellanox.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Fixes a compile test failure

Signed-off-by: Shravan Kumar Ramani <sramani@mellanox.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0d9ddff..530ee34 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1318,7 +1318,7 @@ config GPIO_MERRIFIELD
 
 config GPIO_MLXBF
 	tristate "Mellanox BlueField SoC GPIO"
-	depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || COMPILE_TEST
+	depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMPILE_TEST)
 	select GPIO_GENERIC
 	help
 	  Say Y here if you want GPIO support on Mellanox BlueField SoC.
-- 
2.1.2
