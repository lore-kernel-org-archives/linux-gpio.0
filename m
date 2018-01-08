From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] gpio: Preperatory work for regulators
Date: Tue,  9 Jan 2018 00:58:40 +0100
Message-ID: <20180108235844.22348-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35904 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758515AbeAIAAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jan 2018 19:00:51 -0500
Received: by mail-lf0-f65.google.com with SMTP id c19so13967169lfg.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jan 2018 16:00:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

I have a patch series of 26 patches to convert fixed and GPIO regulators
to use only GPIO descriptors.

That is fine stuff for the next merge window (v4.17).

But it'd be nice to get the preperatory work into gpiolib already now
so we avoid cross-tree dependencies.

These patches parses the quirky regulators that use nonstandard
GPIO line names an line flags, and exposes a function to get a named
GPIO line from a device tree node that does not have a corresponding
Linux device.

Linus Walleij (4):
  gpio: of: Support regulator nonstandard GPIO properties
  gpio: Break out code to get a descriptor from a DT node
  gpio: Export devm_gpiod_get_from_of_node() for consumers
  gpio: of: Add special quirk to parse regulator flags

 drivers/gpio/devres.c         |  42 +++++++++++++++
 drivers/gpio/gpiolib-of.c     |  78 ++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c        | 118 ++++++++++++++++++++++++++++++------------
 drivers/gpio/gpiolib.h        |   6 +++
 include/linux/gpio/consumer.h |  17 ++++++
 5 files changed, 227 insertions(+), 34 deletions(-)

-- 
2.14.3

