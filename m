From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v3.15 rc series
Date: Tue, 22 Apr 2014 08:37:50 +0200
Message-ID: <CACRpkdbWwMBgJ0v1bwo78scaKeGYJataWqy2yiKK8AY7Q9Ms+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:40963 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbaDVGhv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 02:37:51 -0400
Received: by mail-oa0-f46.google.com with SMTP id m1so3308733oag.33
        for <linux-gpio@vger.kernel.org>; Mon, 21 Apr 2014 23:37:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Linus,

here is a small batch of GPIO fixes for the v3.15 series. I expect more
to come in but I'm a bit behind on mail, might as well get these to you
right now.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:

  Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.15-2

for you to fetch changes up to b5539fa2d59d697b7b8e28b4d08da844ff60f7cf:

  gpio / ACPI: Prevent potential wrap of GPIO value on OpRegion read
(2014-04-14 10:22:36 +0200)

----------------------------------------------------------------
A few fixes for the GPIO tree:

- Change a crucial semantic ordering in the GPIO irqchip
  helpers.

- Fix two nasty regressions in the ACPI gpiolib extensions.

----------------------------------------------------------------
Linus Walleij (1):
      gpio: set data first, then chip and handler

Mika Westerberg (2):
      gpio / ACPI: Don't crash on NULL chip->dev
      gpio / ACPI: Prevent potential wrap of GPIO value on OpRegion read

 drivers/gpio/gpiolib-acpi.c | 12 +++++++++---
 drivers/gpio/gpiolib.c      |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)
