From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v10 0/2] gpio: add DT support for memory-mapped GPIOs
Date: Fri, 13 May 2016 23:07:10 +0200
Message-ID: <cover.1463172434.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33155 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753326AbcEMVH1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2016 17:07:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>

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

There was a third patch which moved the gpio-clps711x, gpio-ge,
gpio-moxart and gpio-ts4800 into gpio-mmio.c. But it was dropped
from the series as the compat dt parser code became too dense and
complex.

Thanks!

[0] <https://patchwork.ozlabs.org/patch/422121/>
[1] <https://github.com/chunkeey/MBL-openwrt>
[2] <https://wiki.openwrt.org/doc/hardware/soc/soc.broadcom.bcm63xx>

changelog:

v9 -> v10:
	- split "gpio: mmio: add DT support for memory-mapped GPIOs"
	  into two parts.
		- PATCH 1/2 adds the DT infrastructure
		- PATCH 2/2 adds the "wd,mbl-gpio" driver binding and
		  property parser.
	- removed "move clps711x, moxart, ts4800 and gpio-ge into gpio-mmio"

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
  gpio: mmio: add MyBook Live GPIO support

=C3=81lvaro Fern=C3=A1ndez Rojas (1):
  gpio: mmio: add DT support for memory-mapped GPIOs

 drivers/gpio/gpio-mmio.c | 51 ++++++++++++++++++++++++++++++++++++++++=
++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
