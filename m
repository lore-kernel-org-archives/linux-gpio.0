From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.15 take three
Date: Sun, 24 Dec 2017 14:12:09 +0100
Message-ID: <CACRpkdZRGcdQMKKbu6pQvRur_Zi7o-x0jY_jE_8Tg1SkpA76dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:37839 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751570AbdLXNMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Dec 2017 08:12:10 -0500
Received: by mail-io0-f195.google.com with SMTP id n14so5583460iob.4
        for <linux-gpio@vger.kernel.org>; Sun, 24 Dec 2017 05:12:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hi Linus,

1) Merry christmas! God Jul!

2) Please pull the two fixes below for v4.15 fixes.

They are both kind of important, so why not send a pull
request on christmas eve.

Yours,
Linus Walleij


The following changes since commit 1291a0d5049dbc06baaaf66a9ff3f53db493b19b:

  Linux 4.15-rc4 (2017-12-17 18:59:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.15-3

for you to fetch changes up to 822703354774ec935169cbbc8d503236bcb54fda:

  gpio: fix "gpio-line-names" property retrieval (2017-12-22 15:24:31 +0100)

----------------------------------------------------------------
GPIO fixes for v4.15 take three:

- Fix a build problem in the gpio single register created by
  refactorings.

- Fix assignment of GPIO line names, something that was
  mangled by another patch.

----------------------------------------------------------------
Christophe Leroy (1):
      gpio: fix "gpio-line-names" property retrieval

Grygorii Strashko (1):
      gpio: gpio-reg: fix build

 drivers/gpio/gpio-reg.c        |  4 ++--
 drivers/gpio/gpiolib-acpi.c    |  2 +-
 drivers/gpio/gpiolib-devprop.c | 17 +++++++----------
 drivers/gpio/gpiolib-of.c      |  3 ++-
 drivers/gpio/gpiolib.h         |  3 ++-
 5 files changed, 14 insertions(+), 15 deletions(-)
