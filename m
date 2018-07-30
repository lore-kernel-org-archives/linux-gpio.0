From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] gpio: mmio: add get_set inverted direction io support
Date: Mon, 30 Jul 2018 12:34:17 +0300
Message-ID: <20180730093418.124648-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: linux-gpio@vger.kernel.org

When bgpio direction register use dirin and setting  
BGPIOF_READ_OUTPUT_REG_SET flag, the get_set I/O functions reading 
the inverted set register of each direction, it means:

when direction=in the get_set function read set register.
when direction=out the get_set function read dat register.

but is should be inverted.

conversion about it with Linus Walleij:
https://www.spinics.net/lists/devicetree/msg241973.html

to solve it, adding get_set_inv_dir and get_set_multiple_inv_dir
I/O functions to call the data register when the direction is input and
set register when the direction is output.
the functions will linked to the I/O get functions if the user set
BGPIOF_INVERTED_REG_DIR flag in the bgpio initialization.

Tomer Maimon (1):
  gpio: mmio: add inverted direction get_set io support

 drivers/gpio/gpio-mmio.c    | 48 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/gpio/driver.h |  1 +
 2 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.14.1
