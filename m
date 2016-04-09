From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.6 series, take two
Date: Sat, 9 Apr 2016 21:25:38 +0200
Message-ID: <CACRpkdaUwt932jq6X9g2J_F=EJip2oV-zd2wTtYSCSE_WLDd=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34736 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754814AbcDITZj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 15:25:39 -0400
Received: by mail-ob0-f180.google.com with SMTP id bg3so90102632obb.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 12:25:39 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Robert Jarzmik <robert.jarzmik@free.fr>, Yong Li <sdliyong@gmail.com>

Hi Linus,

here is a set of four GPIO fixes, the two fixes to the core are
serious as they are regressing minor architectures.

Detailed information in the signed tag as usual.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.6-3

for you to fetch changes up to 9b8e3ec34318663affced3c14d960e78d760dd9a:

  gpio: pca953x: Use correct u16 value for register word write
(2016-04-08 11:49:47 +0200)

----------------------------------------------------------------
GPIO fixes for the V4.6 series:

Core fixes:
- Defer GPIO device setup until after gpiolib is initialized.
  It turns out that a few very tightly integrated GPIO platform
  drivers initialize so early (befor core_initcall()) so that
  the gpiolib isn't even initialized itself. That limits what
  the library can do, and we cannot reference uninitialized
  fields until later. Defer some of the initialization until
  right after the gpiolib is initialized in these (rare) cases.
- As a consequence: do not use devm_* resources when allocating
  the states in the initial set-up of the gpiochip.

Driver fixes:
- In ACPI retrieveal: ignore GpioInt when looking for output
  GPIOs.
- Fix legacy builds on the PXA without a backing pin controller.
- Use correct datatype on pca953x register writes.

----------------------------------------------------------------
Dmitry Torokhov (1):
      gpio / ACPI: ignore GpioInt() GPIOs when requesting GPIO_OUT_*

Guenter Roeck (2):
      gpiolib: Do not use devm functions when registering gpio chip
      gpiolib: Defer gpio device setup until after gpiolib initialization

Robert Jarzmik (1):
      gpio: pxa: fix legacy non pinctrl aware builds

Yong Li (1):
      gpio: pca953x: Use correct u16 value for register word write

 drivers/gpio/gpio-pca953x.c |   3 +-
 drivers/gpio/gpio-pxa.c     |   4 +-
 drivers/gpio/gpiolib.c      | 133 ++++++++++++++++++++++++++++++--------------
 3 files changed, 95 insertions(+), 45 deletions(-)
