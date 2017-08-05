From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.13, first take
Date: Sat, 5 Aug 2017 11:40:13 +0200
Message-ID: <CACRpkdYgrcRrhO5xEqxjwmE5E3_1S3hF+fyZaWRi+LDyr_1jsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

I go on vacation and when I come back my mailbox is exploded.
Oh well. I sifted through it and here are the most apparent fixes
for v4.13 that have had some testing in -next the recent week.

Mostly driver fixes but also an important semantic fix from
Bartosz and a single MAINTAINERS entry. I rebased on -rc3 since
I saw you played around with that file recently.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 16f73eb02d7e1765ccab3d2018e0bd98eb93d973=
:

  Linux 4.13-rc3 (2017-07-30 12:40:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.13-2

for you to fetch changes up to 9e9509e38fbe034782339eb09c915f0b5765ff69:

  gpio: tegra: fix unbalanced chained_irq_enter/exit (2017-08-02 10:42:38 +=
0200)

----------------------------------------------------------------
GPIO fixes in the first take after v4.13-rc1:

- LP87565: set the proper output level for direction_output.

- stm32: fix the kernel build by selecting the hierarchical
  irqdomain symbol properly - this happens to be done in the
  pin control framework but whatever, it had dependencies to
  GPIO so we need to apply it here.

- Select the hierarchical IRQ domain also for Xgene.

- Fix wakeups to work on MXC.

- Fix up the device tree binding on Exar that went astray,
  also add the right bindings.

- Fix the unwanted events for edges from the library.

- Fix the unbalanced chanined IRQ on the Tegra.

----------------------------------------------------------------
Axel Lin (1):
      gpio: lp87565: Set proper output level and direction for direction_ou=
tput

Bartosz Golaszewski (1):
      gpiolib: skip unwanted events, don't convert them to opposite edge

Jan Kiszka (1):
      gpio: exar: Use correct property prefix and document bindings

Kuppuswamy Sathyanarayanan (1):
      MAINTAINERS: Add entry for Whiskey Cove PMIC GPIO driver

Masahiro Yamada (2):
      pinctrl: stm32: select IRQ_DOMAIN_HIERARCHY instead of depends on
      gpio: xgene-sb: select IRQ_DOMAIN_HIERARCHY

Micha=C5=82 Miros=C5=82aw (1):
      gpio: tegra: fix unbalanced chained_irq_enter/exit

Philipp Rosenberger (1):
      gpio: gpio-mxc: Fix: higher 16 GPIOs usable as wake source

 .../devicetree/bindings/gpio/gpio-exar.txt         |  5 +++
 MAINTAINERS                                        |  6 +++
 drivers/gpio/Kconfig                               |  1 +
 drivers/gpio/gpio-exar.c                           |  2 +-
 drivers/gpio/gpio-lp87565.c                        | 46 +++++++++++-------=
----
 drivers/gpio/gpio-mxc.c                            |  3 ++
 drivers/gpio/gpio-tegra.c                          |  6 +--
 drivers/gpio/gpiolib.c                             |  9 ++---
 drivers/pinctrl/stm32/Kconfig                      |  9 +++--
 drivers/tty/serial/8250/8250_exar.c                |  4 +-
 10 files changed, 54 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exar.txt
