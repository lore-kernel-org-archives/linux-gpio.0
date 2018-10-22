From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 0/6] Mask read inputs for get_multiple callbacks
Date: Mon, 22 Oct 2018 21:08:07 +0900
Message-ID: <cover.1540209293.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux@rasmusvillemoes.dk, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The implementation for several drivers' get_multiple callbacks return
additional input states that were not requested by the mask passed in.
Although the current caller in the kernel does not care, it would be
prudent to ensure the behavior of the get_multiple implementations is to
return exactly the requested input states and not more. This patchset
ensures such behavior by applying a final mask on the read inputs before
setting the bits array.

William Breathitt Gray (6):
  gpio: 104-dio-48e: Mask read inputs for get_multiple
  gpio: 104-idi-48e: Mask the read inputs for get_multiple
  gpio: gpio-mm: Mask read inputs for get_multiple
  gpio: ws16c48: Mask read inputs for get_multiple
  gpio: pci-idio-16: Mask read inputs for get_multiple
  gpio: pcie-idio-24: Mask read inputs for get_multiple

 drivers/gpio/gpio-104-dio-48e.c  | 2 +-
 drivers/gpio/gpio-104-idi-48.c   | 2 +-
 drivers/gpio/gpio-gpio-mm.c      | 2 +-
 drivers/gpio/gpio-pci-idio-16.c  | 2 +-
 drivers/gpio/gpio-pcie-idio-24.c | 2 +-
 drivers/gpio/gpio-ws16c48.c      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.19.1
