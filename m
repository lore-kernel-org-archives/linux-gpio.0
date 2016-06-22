From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.7, take four
Date: Wed, 22 Jun 2016 18:06:33 +0200
Message-ID: <CACRpkdZO_p3GgKP5vGk=yLh0qdKe5ruMF87P9-yWZJZkpdR-2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

more GPIO fixes. Most prominent the gpiod_to_irq() fix brought to my
attention by Hans de Goede. The hardening patch is a consequence
of the reasoning around that bug.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit 5edb56491d4812c42175980759da53388e5d86f5:

  Linux 4.7-rc3 (2016-06-12 07:20:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.7-4

for you to fetch changes up to bfbbe44daf64d0ccf2de123179817f3557fb9237:

  gpio: make library immune to error pointers (2016-06-17 18:12:19 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.7 cycle:

- It was discovered that too many parts of the kernel does not
  respect gpiod_to_irq() returning zero for an invalid IRQ.
  While this gets fixed, we need to make it return negative
  errorcodes again.

- Harden the library a bit when passed error pointers. It is
  a bug to use these, but let's be helpful and warn the users.

- Fix an uninitialized spinlock in the 104-idi-48 driver.

----------------------------------------------------------------
Axel Lin (1):
      gpio: 104-idi-48: Fix missing spin_lock_init for ack_lock

Linus Walleij (2):
      gpio: make sure gpiod_to_irq() returns negative on NULL desc
      gpio: make library immune to error pointers

 drivers/gpio/gpio-104-idi-48.c |  1 +
 drivers/gpio/gpiolib.c         | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)
