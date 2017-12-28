From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] Change ISA_BUS_API dependency to selection
Date: Thu, 28 Dec 2017 11:01:27 -0500
Message-ID: <cover.1514475654.git.vilhelm.gray@gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

The ISA_BUS_API Kconfig option enables the compilation of the ISA bus
driver. The ISA bus driver does not perform any hardware interaction,
and is instead just a thin layer of software abstraction to eliminate
boilerplate code common to ISA-style device drivers. Since ISA_BUS_API
has no dependencies and does not jeopardize the integrity of the system
when enabled, drivers should select it when the ISA bus driver
functionality is needed.

Originally, when the ISA_BUS_API Kconfig option was introduced, it
served a dual-purpose of masking drivers ISA-style devices not commonly
found for desktop systems, such as the PC/104 device drivers. This
secondary semantic was inappropriate for the ISA_BUS_API option, and
proper masking of these device drivers is now accomplished via dedicated
Kconfig options such as CONFIG_PC104.

Linus, please pickup this entire patchset through your GPIO subsystem
tree; a recursive dependency error is present if these patches are
cherry-picked (see https://lkml.org/lkml/2017/12/26/235), so they should
be merged together in the same tree.

Maciej, this patchset resolves the recursive dependency issue you
encountered, so now you should be able to submit your Winbond GPIO
driver with the ISA_BUS_API selection as desired.

William Breathitt Gray (3):
  iio: Change ISA_BUS_API dependency to selection
  watchdog: Change ISA_BUS_API dependency to selection
  gpio: Change ISA_BUS_API dependency to selection

 drivers/gpio/Kconfig        | 14 +++++++++-----
 drivers/iio/adc/Kconfig     |  3 ++-
 drivers/iio/counter/Kconfig |  3 ++-
 drivers/iio/dac/Kconfig     |  3 ++-
 drivers/watchdog/Kconfig    |  3 ++-
 5 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
