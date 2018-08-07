From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fix for v4.18
Date: Tue, 7 Aug 2018 02:32:11 +0200
Message-ID: <CACRpkdZrG-bVA5LC1FMbdzOTotU0BmZkkb7wZAesN+b7GHzv5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

a single ACPI GPIO thingie that is standing out.

Please pull it in! Description in the commit log.

Yours,
Linus Walleij

The following changes since commit acb1872577b346bd15ab3a3f8dff780d6cca4b70:

  Linux 4.18-rc7 (2018-07-29 14:44:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.18-3

for you to fetch changes up to ca876c7483b697b498868b1f575997191b077885:

  gpiolib-acpi: make sure we trigger edge events at least once on boot
(2018-08-01 11:45:10 +0200)

----------------------------------------------------------------
GPIO fixes for v4.18:

This is a single fix affecting X86 ACPI, and as such pretty important.
It is going to stable as well and have all the high-notch x86 platform
developers agreeing on it.

----------------------------------------------------------------
Benjamin Tissoires (1):
      gpiolib-acpi: make sure we trigger edge events at least once on boot

 drivers/gpio/gpiolib-acpi.c | 56 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)
