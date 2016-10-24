From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.9
Date: Mon, 24 Oct 2016 21:17:03 +0200
Message-ID: <CACRpkdZX2DKxUS5fxhuaPQktGSq66ERE03M=n_Bm6HwicYvDeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a set of patches for the v4.9 series. A bunch of stuff
hardening the GPIO userspace ABI is targeted for stable, and
stands out as especially important.

Apart from that is is just regular first-pull-after mergwindow fixes
with some targeted for stable and some fixing the v4.9 HEAD.

Details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.9-2

for you to fetch changes up to d71cf15b865bdd45925f7b094d169aaabd705145:

  gpio: mpc8xxx: Correct irq handler function (2016-10-24 02:20:40 +0200)

----------------------------------------------------------------
Here is a set of GPIO fixes for the v4.9 kernel series:

- Fix up off-by one and line offset validation, info leak to
  userspace, and reject invalid flags. Those are especially
  valuable hardening patches from Lars-Peter Clausen, all tagged
  for stable.

- Fix module autoload for TS4800 and ATH79.

- Correct the IRQ handler for MPC8xxx to use handle_level_irq()
  as it (A) reacts to edges not levels and (B) even implements
  .irq_ack(). We were missing IRQs here.

- Fix the error path for acpi_dev_gpio_irq_get()

- Fix a memory leak in the MXS driver.

- Fix an annoying typo in the STMPE driver.

- Put a dependency on sysfs to the mockup driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      gpio: mockup: add sysfs dependency

Arvind Yadav (1):
      gpio: mxs: Unmap region obtained by of_iomap

Dan Carpenter (1):
      gpio: stmpe: || vs && typo

David Arcari (1):
      gpio / ACPI: fix returned error from acpi_dev_gpio_irq_get()

Javier Martinez Canillas (2):
      gpio: ts4800: Fix module autoload
      gpio: ath79: Fix module autoload

Lars-Peter Clausen (8):
      gpio: GPIO_GET_CHIPINFO_IOCTL: Fix line offset validation
      gpio: GPIO_GET_CHIPINFO_IOCTL: Fix information leak
      gpio: GPIO_GET_LINEHANDLE_IOCTL: Validate line offset
      gpio: GPIOHANDLE_GET_LINE_VALUES_IOCTL: Fix information leak
      gpio: GPIO_GET_LINEEVENT_IOCTL: Validate line offset
      gpio: GPIOHANDLE_GET_LINE_VALUES_IOCTL: Fix information leak
      gpio: GPIO_GET_LINEHANDLE_IOCTL: Reject invalid line flags
      gpio: GPIO_GET_LINEEVENT_IOCTL: Reject invalid line and event flags

Liu Gang (1):
      gpio: mpc8xxx: Correct irq handler function

Pavel Machek (1):
      gpio/board.txt: point to gpiod_set_value

 Documentation/gpio/board.txt | 11 +++++++----
 drivers/gpio/Kconfig         |  2 +-
 drivers/gpio/gpio-ath79.c    |  1 +
 drivers/gpio/gpio-mpc8xxx.c  |  2 +-
 drivers/gpio/gpio-mxs.c      |  8 ++++++--
 drivers/gpio/gpio-stmpe.c    |  2 +-
 drivers/gpio/gpio-ts4800.c   |  1 +
 drivers/gpio/gpiolib-acpi.c  |  7 +++++--
 drivers/gpio/gpiolib.c       | 42 +++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 64 insertions(+), 12 deletions(-)
