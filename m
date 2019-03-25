From: Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH v5 0/1] gpio: add driver for Mellanox BlueField GPIO
Date: Mon, 25 Mar 2019 14:29:06 -0400
Message-ID: <cover.1553537396.git.sramani@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Shravan Kumar Ramani <sramani@mellanox.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Changes since v4:
Use bgpio_init to make use of the generic MMIO library.
Remove routines made unnecessary by the above change.

Shravan Kumar Ramani (1):
  gpio: add driver for Mellanox BlueField GPIO controller

 drivers/gpio/Kconfig      |   7 +++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-mlxbf.c | 154 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/gpio/gpio-mlxbf.c

-- 
2.1.2
