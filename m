From: Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH v6 0/1] gpio: add driver for Mellanox BlueField GPIO
Date: Tue, 26 Mar 2019 10:42:47 -0400
Message-ID: <cover.1553610690.git.sramani@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Shravan Kumar Ramani <sramani@mellanox.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Changes since v5:
Use devm_platform_ioremap_resource().

Shravan Kumar Ramani (1):
  gpio: add driver for Mellanox BlueField GPIO controller

 drivers/gpio/Kconfig      |   7 +++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-mlxbf.c | 153 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/gpio/gpio-mlxbf.c

-- 
2.1.2
