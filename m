From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] gpio: Failure path fixes
Date: Thu, 28 Mar 2019 14:13:46 +0100
Message-ID: <20190328131349.18838-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz,

After making a silly mistake in a pin control driver, pinctrl driver
initialization failed, causing an avalanche of GPIO driver failures, and
I was greeted by the following scary messages:

    OF: ERROR: Bad of_node_put() on /soc/gpio@e6050000
    ...
    WARNING: CPU: 0 PID: 1 at lib/refcount.c:156 kobject_get+0x38/0x4c
    ...
    WARNING: CPU: 0 PID: 1 at lib/refcount.c:190 refcount_sub_and_test_checked+0x3c/0xa8

The first two patches fix bugs in related error paths, after which the
messages are gone.
The third patch is a drive-by fix for function comment.

Thanks for your comments!

Geert Uytterhoeven (3):
  gpio: of: Fix of_gpiochip_add() error path
  gpio: Fix gpiochip_add_data_with_key() error path
  gpio: Remove obsolete comment about gpiochip_free_hogs() usage

 drivers/gpio/gpiolib-of.c |  8 +++++++-
 drivers/gpio/gpiolib.c    | 14 ++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
