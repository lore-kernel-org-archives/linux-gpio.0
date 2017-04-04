From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.11
Date: Tue, 4 Apr 2017 13:54:33 +0200
Message-ID: <CACRpkdahKXtD8oassbpqW-aFsBn3nC9Ubg-xX7m5LaWBmGvkow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:35303 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753660AbdDDLyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2017 07:54:35 -0400
Received: by mail-io0-f173.google.com with SMTP id z13so93711321iof.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2017 04:54:34 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Linus,

Some late coming ACPI fixes for GPIO.

For my untrained eye it seems there was some quarrel between the BIOS
and the kernel about who is supposed to deal with wakeups from
GPIO lines.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit c02ed2e75ef4c74e41e421acb4ef1494671585e8:

  Linux 4.11-rc4 (2017-03-26 14:15:16 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.11-3

for you to fetch changes up to 693bdaa164b40b7aa6018b98af6f7e40dbd52457:

  ACPI / gpio: do not fall back to parsing _CRS when we get a deferral
(2017-03-30 11:08:46 +0200)

----------------------------------------------------------------
Late GPIO fixes for v4.11:

We're dealing with ACPI issues here. The first is related to
wake IRQs on Bay Trail/Cherry Trail CPUs which are common in
laptops. The second is about proper probe deferral when reading
_CRS properties.

----------------------------------------------------------------
Dmitry Torokhov (1):
      ACPI / gpio: do not fall back to parsing _CRS when we get a deferral

Hans de Goede (1):
      gpio: acpi: Call enable_irq_wake for _IAE GpioInts with Wake set

 drivers/gpio/gpiolib-acpi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
