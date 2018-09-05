From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] gpio: Fix VLA removal fallout
Date: Wed,  5 Sep 2018 11:05:52 +0200
Message-ID: <20180905090555.9888-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laura Abbott <labbott@redhat.com>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series fixes various (mostly harmless) issues introduced by
commit 3027743f83f867d8 ("gpio: Remove VLA from gpiolib").

As per the "one patch should fix one issue"-policy, this series contains 3
patches, although they all have the same Fixes: tag.

W.r.t. propagating errors: while gpiod_set_array_value_complex() and its
callers can now return an error code, this is currently limited to -ENOMEM.
Actual failures setting a GPIO output value cannot be propagated, as
gpio_chip.set() still returns void.  Do you want to change that?
E.g. gen_74x164_set_value() can fail.

Feel free to fold patches if deemed appropriate.

Thanks!

Geert Uytterhoeven (3):
  Documentation: gpio: Fix return type of gpiod_set_raw_array_value*()
  gpio: Propagate errors from gpiod_set_array_value_complex()
  gpio: Restore indentation of continued lines

 Documentation/driver-api/gpio/consumer.rst | 24 +++++++--------
 drivers/gpio/gpiolib.c                     | 34 +++++++++++-----------
 drivers/gpio/gpiolib.h                     |  6 ++--
 include/linux/gpio/consumer.h              | 31 ++++++++++----------
 4 files changed, 48 insertions(+), 47 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
