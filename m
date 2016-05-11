From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v9 0/2] gpio: add DT support for memory-mapped GPIOs
Date: Wed, 11 May 2016 11:34:33 +0200
Message-ID: <cover.1462911225.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33329 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364AbcEKJep (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 05:34:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>

This patch series adds device tree support for generic memory-mapped GP=
IOs.
The GPIO library already allows drivers and architecture support code t=
o
reuse generic code for managing a GPIO chip. Currently, a developer has
to create a platform device "basic-mmio-gpio" and attach a bgpio_pdata
platform data structure to make use of it. However, for architectures
which rely on the device tree to enumerate devices, creating custom
platform devices is another extra step that can be avoided by having
direct support via a device tree binding.

I initially came across this patch [0] from =C3=81lvaro Fern=C3=A1ndez =
Rojas,
while looking for an easy way to add support for the GPIO of my
WD MyBook Live [1] (APM82181). His generic approach patch allowed
me to easily get the GPIO (and the connected LEDs, buttons, gpiohogs)
up and running. Even thought, Mr. Fernandez initially developed it
for his work on the brcm63xx [2].

The third patch (which can be applied at a later time) moves gpio-clps7=
11x,
gpio-ge, gpio-moxart and gpio-ts4800 into gpio-mmio.c. The old driver f=
iles
and makefile entries have been removed. The Kconfig entries for these
drivers are kept for compatibility reasons.

And finally, the most important stat about the series:
	>>> 328 insertions(+), 380 deletions(-) <<<
	It still removes more lines than it adds!
	(This also includes the dt binding)

Thanks!

[0] <https://patchwork.ozlabs.org/patch/422121/>
[1] <https://github.com/chunkeey/MBL-openwrt>
[2] <https://wiki.openwrt.org/doc/hardware/soc/soc.broadcom.bcm63xx>

changelog:

v8 -> v9:
	- made dt match table grep-able
	- reorganized bgpio_dt_parse
	- dropped already applied patch (dt binding) from the series

v7 -> v8:
	- removed ngpio property parser and most flags parsers
	- converted clps711x to switch case for GPIO
	- retained original Kconfig syms which now select GPIO_GENERIC_PLATFOR=
M

v6 -> v7:
	- finally made a PATCH series (based on linux-gpio devel branch)
	- added Rob Herring's ACK to the dt bindings
	- cc'd clps711x, gpio-ge, moxart and ts4800 authors for driver
	  changes.

v5 -> v6:
	- rewrote bindings and driver patch to fit the wd,mbl-gpio
	- unified parser code for gpio-ge, gpio-moxart and gpio-ts4800
	- fixed gpio chip's base being overwritten with bogus "0"
	- fixed compat driver crash when reload gpio-generic.ko module
	- dropped already applied patches from the series
	- rebased code on linus' devel tree
	- moved dt bindings patch to the top of the series

v4 -> v5:
	- reverted rename of gpio-mmio.c back to gpio-generic.c
	- fixed Andy Shevchenko's comments
	- consolidated changes from clps711x, gpio-ge, gpio-moxart and
	  gpio-ts4800 into one patch.

v3 -> v4:
	- renamed gpio-generic.c to gpio-mmio.c
	- changed compat. string to "linux,gpio-mmio"
	- integrated Cirrus clps711x driver
	- integrated GE FGPA gpio-ge driver
	- integrated MOXA ART GPIO driver
	- integrated TS4800 gpio driver
	- reshuffled patches, reworded commits, fixed spelling errors, etc.

Christian Lamparter (1):
  gpio: move clps711x, moxart, ts4800 and gpio-ge into gpio-mmio

=C3=81lvaro Fern=C3=A1ndez Rojas (1):
  gpio: mmio: add DT support for memory-mapped GPIOs

 drivers/gpio/Kconfig         |  16 ++-
 drivers/gpio/Makefile        |   4 -
 drivers/gpio/gpio-clps711x.c |  91 --------------
 drivers/gpio/gpio-ge.c       | 114 ------------------
 drivers/gpio/gpio-mmio.c     | 280 +++++++++++++++++++++++++++++++++++=
+++++++-
 drivers/gpio/gpio-moxart.c   |  84 -------------
 drivers/gpio/gpio-ts4800.c   |  81 -------------
 7 files changed, 290 insertions(+), 380 deletions(-)
 delete mode 100644 drivers/gpio/gpio-clps711x.c
 delete mode 100644 drivers/gpio/gpio-ge.c
 delete mode 100644 drivers/gpio/gpio-moxart.c
 delete mode 100644 drivers/gpio/gpio-ts4800.c

--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
