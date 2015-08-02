From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 00/11] gpio: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun,  2 Aug 2015 11:07:55 +0200
Message-ID: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:43474 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849AbbHBJJP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 05:09:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Evgeniy Polyakov <zbr@ioremap.net>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Johannes Berg <johannes@sipsolutions.net>, Marcel Selhorst <tpmdd@selhorst.net>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Peter Huewe <peterhuewe@gmx.de>, Sebastian Reichel <sre@kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi all,

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.
This patch series relaxes the dependencies on GPIOLIB if COMPILE_TEST is
enabled, where appropriate.

There are a few more drivers that depend on GPIOLIB and that may be
eligible for COMPILE_TEST. These I didn't handle yet, as I couldn't
enable them with m68k/all{mod,yes}config due to other dependencies.

This series is the remaining part of ("[PATCH 00/27] gpio: Allow compile
test of GPIO consumers if !GPIOLIB", https://lkml.org/lkml/2015/5/5/779),
updated for new config symbols up to v4.2-rc4.  It applies to
next-20150731.

Thanks for applying!

Geert Uytterhoeven (11):
  tpm: Allow compile test of GPIO consumers if !GPIOLIB
  input: Allow compile test of GPIO consumers if !GPIOLIB
  misc: ti-st: Allow compile test of GPIO consumers if !GPIOLIB
  net: phy: Allow compile test of GPIO consumers if !GPIOLIB
  power: Allow compile test of GPIO consumers if !GPIOLIB
  staging: android: Allow compile test of GPIO consumers if !GPIOLIB
  staging: fbtft: Allow compile test of GPIO consumers if !GPIOLIB
  serial: Allow compile test of GPIO consumers if !GPIOLIB
  fbdev: Allow compile test of GPIO consumers if !GPIOLIB
  w1: Allow compile test of GPIO consumers if !GPIOLIB
  net: rfkill: Allow compile test of GPIO consumers if !GPIOLIB

 drivers/char/tpm/st33zp24/Kconfig |  2 +-
 drivers/input/keyboard/Kconfig    |  4 ++--
 drivers/input/misc/Kconfig        | 11 ++++++-----
 drivers/input/mouse/Kconfig       |  2 +-
 drivers/input/touchscreen/Kconfig |  8 ++++----
 drivers/misc/ti-st/Kconfig        |  3 ++-
 drivers/net/phy/Kconfig           |  3 ++-
 drivers/power/Kconfig             | 17 +++++++++++------
 drivers/staging/android/Kconfig   |  3 ++-
 drivers/staging/fbtft/Kconfig     |  3 ++-
 drivers/tty/serial/Kconfig        |  3 ++-
 drivers/video/fbdev/Kconfig       |  2 +-
 drivers/w1/masters/Kconfig        |  2 +-
 net/rfkill/Kconfig                |  3 ++-
 14 files changed, 39 insertions(+), 27 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
