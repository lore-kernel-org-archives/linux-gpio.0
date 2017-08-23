From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.13
Date: Wed, 23 Aug 2017 10:48:19 +0200
Message-ID: <CACRpkdagSGZTBMvQdKhFNORdfJoAV=N8OrNNc_Kn0PTQPo+g5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are the (hopefully) last GPIO fixes for v4.13.

Details in the signed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit ef954844c7ace62f773f4f23e28d2d915adc419f:

  Linux 4.13-rc5 (2017-08-13 16:01:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.13-3

for you to fetch changes up to 3f13b6a24f192da3096389b82202f16eff2c11ee:

  gpio: mvebu: Fix cause computation in irq handler (2017-08-14 15:00:43 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.13 series:

- An important core fix to reject invalid GPIOs *before* trying
  to obtain a GPIO descriptor for it.

- A driver fix for the mvebu driver IRQ handling.

----------------------------------------------------------------
Gregory CLEMENT (1):
      gpio: mvebu: Fix cause computation in irq handler

Masami Hiramatsu (1):
      gpio: reject invalid gpio before getting gpio_desc

 drivers/gpio/gpio-mvebu.c    |  2 +-
 drivers/gpio/gpiolib-sysfs.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)
