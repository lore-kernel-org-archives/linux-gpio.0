From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.12 last one
Date: Sat, 1 Jul 2017 14:18:11 +0200
Message-ID: <CACRpkdYmdUi32R1Cv120DvqF1DJO2aWp7gNbt9co4Sb+H+D6CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:36676 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751802AbdGAMSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jul 2017 08:18:13 -0400
Received: by mail-io0-f169.google.com with SMTP id z62so36014576ioi.3
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jul 2017 05:18:13 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

just when I thought everything was setting down nicely last minute
fixes appear. Like sunspots.

Please pull it in, I would have sent earlier this week but the 0day
builder was unresponsive so I wanted it to land in linux-next
first.

(If it's too late, it's too late, I just fold it into the v4.13 window and
tag for stable then, no big deal.)

Yours,
Linus Walleij

The following changes since commit c0bc126f97fb929b3ae02c1c62322645d70eb408:

  Linux 4.12-rc7 (2017-06-25 18:30:05 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.12-4

for you to fetch changes up to c06632ea054c49510efacb42c52aab693c45b7ba:

  gpio: acpi: Skip _AEI entries without a handler rather then aborting
the scan (2017-06-29 14:55:08 +0200)

----------------------------------------------------------------
Last minute fixes for GPIO:

- Fix another ACPI problem with broken BIOSes.

- Filter out the GPIO right events, making a very user-visible bug
  go away.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: fix filtering out unwanted events

Hans de Goede (1):
      gpio: acpi: Skip _AEI entries without a handler rather then
aborting the scan

 drivers/gpio/gpiolib-acpi.c | 2 +-
 drivers/gpio/gpiolib.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
