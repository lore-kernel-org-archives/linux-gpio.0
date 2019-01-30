From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v5.0 series, take two
Date: Wed, 30 Jan 2019 10:08:56 +0100
Message-ID: <CACRpkdZWGrinXV5oF0c5aggi51TKTR5GsL1nO3gA+6RMO7U3bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a bunch of GPIO fixes for the v5.0 series. I was helped out
by Bartosz in collecting these fixes, for which I am very grateful,
the biggest achievement in GPIO right now is work distribution.

There is one serious core fix (timestamping) and a bunch of driver
fixes.

Please pull it in! Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit 49a57857aeea06ca831043acbb0fa5e0f50602fd:

  Linux 5.0-rc3 (2019-01-21 13:14:44 +1300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.0-3

for you to fetch changes up to 7ae710f9f8b2cf95297e7bbfe1c09789a7dc43d4:

  gpio: vf610: Mask all GPIO interrupts (2019-01-28 15:28:43 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.0 series:
- Fix timestamps on nested IRQs
- Handle IRQs properly in multiple instances of PCF857x
- Use the right data register and IRQ type setting in the
  Spreadtrum GPIO driver
- Let the value argument work properly when setting direction
  in the Altera GPIO driver
- Mask interrupts properly in the vf610 driver

----------------------------------------------------------------
Andrew Lunn (1):
      gpio: vf610: Mask all GPIO interrupts

Axel Lin (1):
      gpio: altera-a10sr: Set proper output level for direction_output

Bartosz Golaszewski (1):
      gpiolib: fix line event timestamps for nested irqs

Linus Walleij (1):
      Merge tag 'gpio-5.0-rc4-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

Neo Hou (2):
      gpio: sprd: Fix the incorrect data register
      gpio: sprd: Fix incorrect irq type setting for the async EIC

Roger Quadros (1):
      gpio: pcf857x: Fix interrupts on multiple instances

 drivers/gpio/gpio-altera-a10sr.c |  4 +++-
 drivers/gpio/gpio-eic-sprd.c     | 14 +++++++++++++-
 drivers/gpio/gpio-pcf857x.c      | 26 ++++++++++++--------------
 drivers/gpio/gpio-vf610.c        |  5 +++++
 drivers/gpio/gpiolib.c           |  9 ++++++++-
 5 files changed, 41 insertions(+), 17 deletions(-)
