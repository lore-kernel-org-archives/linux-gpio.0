From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/2] gpio: sch: Interrupt support
Date: Thu, 18 Apr 2019 11:23:47 +0200
Message-ID: <cover.1555579429.git.jan.kiszka@siemens.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

See patches for details.

Two things I'm not 100% sure about:
 - Should we enable interrupts for all sch variants the driver support,
   or only the Quark where I was able to validate it (and where I found
   documentation for)?

 - Is there a better way to hook into the SCI? Yes, GPIO events will
   also set a bit in GPE0_STS, but there is no ACPI description for that
   event on our IOT2000 platform and, thus, also the original Galileo
   Gen2.

Jan

Jan Kiszka (2):
  gpio: sch: Remove write-only core_base
  gpio: sch: Add interrupt support

 drivers/gpio/gpio-sch.c | 147 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 135 insertions(+), 12 deletions(-)

-- 
2.16.4
