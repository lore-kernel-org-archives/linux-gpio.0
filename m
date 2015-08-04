From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 0/6] gpiolib: Add GPIO name support
Date: Tue,  4 Aug 2015 11:23:17 +0200
Message-ID: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:35898 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932399AbbHDJXy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 05:23:54 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

Hi,

Changes in v2:
 - Removed patch 'gpiolib: Fix possible use of wrong name'
 - Removed discussed patch 'gpio: Allow hogged gpios to be requested' from this
   series
 - Fixed show gpio name patch (locks, (null) printing, and getting the descriptor)
 - Merged gpio name patch into gpio_name_to_desc() patch

Description from v1:

This is a proposal to add GPIO names to the kernel based on devicetree
descriptions.

This series adds GPIO name support. Until now it is only possible to use names
for already requested GPIOs (for example what they are used for). It is not
possible to identify GPIOs by a name although most of them have a name for
example in the schematics of the board. This makes it difficult to identify
a specific GPIO from userspace.

As the GPIO name information is a hardware description this series uses the
devicetree bindings introduced by the GPIO hogging mechanism, specifically
'line-name', to identify GPIOs. The sysfs 'export' file is changed to accept
names as fallback. The gpio numbers still have a higher priority to ensure
backwards compatibility.

Exported GPIOs are still using their number as directory name (gpio<ID>). But the
directories now contain a 'name' file which is '' for non-existent names and
the name otherwise.

This series can be used to have an easy name mapping for udev with a quite
simple rule similar to this:
	SUBSYSTEM=="gpio", KERNEL=="gpio*", ATTR{name}!="(null)", ACTION=="add", \
	PROGRAM+="/bin/sh -c 'mkdir -p /dev/gpios; rm -f /dev/gpios/$attr{name}; ln -s /sys%p/ /dev/gpios/$attr{name}"
With this rule udev adds a link for each exported GPIO with a name into
/dev/gpios/. This way it is not necessary to know the number of a GPIO to use
it.

Best Regards,

Markus


Markus Pargmann (6):
  gpiolib-of: Rename gpio_hog functions to be generic
  gpio: Introduce gpio descriptor 'name'
  gpiolib-of: Reuse 'line-name' from DT as gpio descriptor name
  gpiolib-sysfs: Add gpio name parsing for sysfs export
  gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
  gpiolib: Add gpio name information to /sys/kernel/debug/gpio

 drivers/gpio/gpiolib-of.c     | 41 ++++++++++++++++++------------
 drivers/gpio/gpiolib-sysfs.c  | 59 +++++++++++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.c        | 43 ++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  3 +++
 include/linux/gpio/consumer.h |  7 +++++
 5 files changed, 121 insertions(+), 32 deletions(-)

-- 
2.1.4

