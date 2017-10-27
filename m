From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 0/2] GPIO support for Socionext Synquacer
Date: Fri, 27 Oct 2017 21:21:46 +0100
Message-ID: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:43223 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751417AbdJ0UWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Oct 2017 16:22:05 -0400
Received: by mail-wm0-f68.google.com with SMTP id m72so3806956wmc.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Oct 2017 13:22:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, daniel.thompson@linaro.org, leif.lindholm@linaro.org, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

The Socionext Synquacer SC2A11, which is used in the arm64 Developer Box,
shares its GPIO IP with a Fujitsu SoC for which we already have support
in the tree. So let's tweak it so that we can reuse it.

Cc: Linus Walleij <linus.walleij@linaro.org>

Ard Biesheuvel (2):
  gpio: mb86s7x: share with other SoCs as module
  gpio: mb86s70: Revert "Return error if requesting an already assigned
    gpio"

 drivers/gpio/Kconfig        |  3 +--
 drivers/gpio/gpio-mb86s7x.c | 17 +++++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.11.0

