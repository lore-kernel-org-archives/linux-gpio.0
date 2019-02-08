From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/3] gpio: drop a few unneeded irq_{request,release}_resources implementations
Date: Fri,  8 Feb 2019 12:51:58 +0100
Message-ID: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

Three GPIO drivers in the tree implement the
irq_{request,release}_resources hooks with what is in fact the default
implementation provided by the GPIO core, making this driver-specific
code redundant.

It is worth mentioning that I do not own any of the affected
platforms, to the three patches have only been built-tested. Each is
Cc'ed to the appropriate maintainer, except gpio-em that has no
platform-specific maintainer.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (3):
  gpio: bcm-kona: drop ->irq_{request,release}_resources hooks
  gpio: dwapb: drop ->irq_{request,release}_resources hooks
  gpio: em: drop ->irq_{request,release}_resources hooks

 drivers/gpio/gpio-bcm-kona.c | 16 ----------------
 drivers/gpio/gpio-dwapb.c    | 27 ---------------------------
 drivers/gpio/gpio-em.c       | 25 -------------------------
 3 files changed, 68 deletions(-)

-- 
2.20.1
