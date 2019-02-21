From: Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH v4 0/1] gpio: add driver for Mellanox BlueField GPIO controller
Date: Thu, 21 Feb 2019 16:32:54 -0500
Message-ID: <cover.1550783880.git.sramani@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Shravan Kumar Ramani <sramani@mellanox.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Changes since v3
 - the naming scheme has been fixed to remove double underscores and use
standard variable names
 - the locking has been updated to protect the entire read/modify
operations.

Regarding the suggested use of the generic MMIO library, I noticed that
bgpio_init only allows for either dirin or dirout to be set, never both.
But since our controller has 2 separate registers, using bgpio_init
might not be possible here.

Shravan Kumar Ramani (1):
  gpio: add driver for Mellanox BlueField GPIO controller

 drivers/gpio/Kconfig      |   6 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-mlxbf.c | 222 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 drivers/gpio/gpio-mlxbf.c

-- 
2.1.2
