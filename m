From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/11] Reform EP93xx GPIO
Date: Wed, 22 Aug 2018 22:41:00 +0200
Message-ID: <20180822204111.9581-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: H Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This series is a spin-off of a patch from Arnd that started to
decouple the EP93xx GPIO driver from the code inside
arch/arm.

The driver needed some modernization and in the end I managed
to convert two of the banks to use GPIOLIB_IRQCHIP and use
a proper irqdomain.

The F bank presents a special problem that I need to think
about, because since there is one IRQ per GPIO line it is
essentially a hierarchical irqdomain.

This was tested on the SIM.ONE where I rigged lines on some
of the GPIOs on a board connector. It's crude but gives
interrupts and behave as expected before and after these
changes, the main visible change being that the hardware
IRQ line on each port appears in /proc/interrupts.

It would be great if some EP93xx users could test this
(especially something using bank F) so I can get it into
shape and merge as a baseline for further refactorings.

Arnd Bergmann (1):
  ARM/gpio: ep93xx: build standalone

Linus Walleij (10):
  gpio: ep93xx: Cut down variable names
  gpio: ep93xx: Switch to SPDX license tag
  gpio: ep93xx: Pass around struct gpio_chip
  gpio: ep93xx: Rename has_debounce to has_irq
  gpio: ep93xx: Properly call the chained IRQ handler
  gpio: ep93xx: Do not pingpong irq numbers
  gpio: ep93xx: Use the hwirq and port
  gpio: ep93xx: Use for_each_set_bit() in IRQ handler
  gpio: ep93xx: Cut gpio_to_irq() usage
  gpio: ep93xx: Switch A and B to use GPIOLIB_IRQCHIP

 arch/arm/mach-ep93xx/core.c |   9 ++
 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-ep93xx.c  | 297 +++++++++++++++++++++---------------
 3 files changed, 181 insertions(+), 126 deletions(-)

-- 
2.17.1
