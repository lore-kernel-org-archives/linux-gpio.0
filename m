From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 0/2] Fix port memory offsets for IDIO series drivers
Date: Wed, 18 Apr 2018 08:52:39 -0400
Message-ID: <cover.1524000042.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The GPIO PCI-IDIO-16 and PCIE-IDIO-24 drivers utilize the ioread8 and
iowrite8 functions to interact with their devices' respective I/O
registers. To simplify the get_multiple/set_multiple callbacks, a local
array 'ports' is used to hold the memory address offsets of the
respective device I/O registers.

Currently the get_multiple callback in the GPIO PCI-IDIO-16 driver, and
the get_multiple/set_multiple callbacks in the GPIO PCIE-IDIO-24 driver,
incorrectly pass the memory address of the local 'ports' array elements
to the respective ioread8/iowrite8 functions when they should instead
pass the necessary device I/O register memory offset. This patch fixes
this error by supplying the correct intended memory addresses to these
functions.

William Breathitt Gray (2):
  gpio: pci-idio-16: Fix port memory offset for get_multiple callback
  gpio: pcie-idio-24: Fix port memory offset for
    get_multiple/set_multiple callbacks

 drivers/gpio/gpio-pci-idio-16.c  |  8 ++++----
 drivers/gpio/gpio-pcie-idio-24.c | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.16.2
