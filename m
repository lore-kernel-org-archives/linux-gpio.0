From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v3.19 series
Date: Sun, 18 Jan 2015 11:16:51 +0100
Message-ID: <CACRpkdZXugs-HBjad6_dbAudaMMMMSRavvPjuSRGoq0fM-85jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:45768 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751734AbbARKQw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jan 2015 05:16:52 -0500
Received: by mail-ie0-f172.google.com with SMTP id rd18so178235iec.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2015 02:16:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, "Holmberg, Hans" <hans.holmberg@intel.com>, Aaron Lu <aaron.lu@intel.com>

Hi Linus,

here is a set of fixes that mainly appeared when Johan Hovold
started exercising the removal path of the GPIO library, dealing
with hotplugging of GPIO controllers.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit eaa27f34e91a14cdceed26ed6c6793ec1d186115:

  linux 3.19-rc4 (2015-01-11 12:44:53 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.19-4

for you to fetch changes up to 7b8792bbdffdff3abda704f89c6a45ea97afdc62:

  gpiolib: of: Correct error handling in of_get_named_gpiod_flags
(2015-01-15 18:31:47 +0100)

----------------------------------------------------------------
A slew of fixes dealing with some irritating bugs (non-regressions)
that have been around forever in the GPIO subsystem, most of them
also tagged for stable:

- A large slew of fixes from Johan Hovold who is finally testing and
  reviewing the removal path of the GPIO drivers.

- Fix of_get_named_gpiod_flags() so it works as expected.

- Fix an IRQ handling bug in the crystalcove driver.

----------------------------------------------------------------
Aaron Lu (1):
      gpio: crystalcove: use handle_nested_irq

Hans Holmberg (1):
      gpiolib: of: Correct error handling in of_get_named_gpiod_flags

Johan Hovold (9):
      gpio: fix memory and reference leaks in gpiochip_add error path
      gpio: fix gpio-chip list corruption
      gpio: clean up gpiochip_add error handling
      gpio: fix memory leak and sleep-while-atomic
      gpio: fix sleep-while-atomic in gpiochip_remove
      gpio: unregister gpiochip device before removing it
      gpio: sysfs: fix gpio-chip device-attribute leak
      gpio: sysfs: fix gpio device-attribute leak
      gpio: sysfs: fix gpio attribute-creation race

 drivers/gpio/gpio-crystalcove.c |  2 +-
 drivers/gpio/gpiolib-of.c       | 10 ++++-
 drivers/gpio/gpiolib-sysfs.c    | 92 +++++++++++++++++++++++------------------
 drivers/gpio/gpiolib.c          | 58 +++++++++++++-------------
 drivers/gpio/gpiolib.h          |  1 +
 5 files changed, 92 insertions(+), 71 deletions(-)
