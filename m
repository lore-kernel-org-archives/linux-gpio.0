From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.1 series
Date: Fri, 8 May 2015 09:46:55 +0200
Message-ID: <CACRpkdYMu8-Vq7xkAjXCyAy3Tuh5W7vniKkwF=MXZJC1gWuwdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34205 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065AbbEHHqz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 May 2015 03:46:55 -0400
Received: by obfe9 with SMTP id e9so49826880obf.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2015 00:46:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a bunch of GPIO fixes that I collected since -rc1,
nothing controversial, nothing special. Some descriptions
in the signed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.1-2

for you to fetch changes up to d2d05c65c40e067ca5898399069053f095c67d6f:

  gpio: omap: Fix regression for MPUIO interrupts (2015-05-06 15:19:38 +0200)

----------------------------------------------------------------
These are some GPIO fixes for the v4.1 series:

- Fix a memory leak for GPIO hotplug.

- Fix a signedness bug in the ACPI GPIO pin validation.

- Driver fixes: Qualcomm SPMI and OMAP MPUIO IRQ issues.

----------------------------------------------------------------
Ivan T. Ivanov (2):
      pinctrl: qcom-spmi-gpio: Fix output type configuration
      pinctrl: qcom-spmi-gpio: Fix input value report

Johan Hovold (1):
      gpio: sysfs: fix memory leaks and device hotplug

Qipeng Zha (1):
      gpiolib: change gpio pin from unsigned to signed in acpi callback

Tony Lindgren (1):
      gpio: omap: Fix regression for MPUIO interrupts

 drivers/gpio/gpio-omap.c                 | 48 ++++++--------------------------
 drivers/gpio/gpiolib-acpi.c              |  2 +-
 drivers/gpio/gpiolib-sysfs.c             | 19 +++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 13 +++++----
 4 files changed, 36 insertions(+), 46 deletions(-)
