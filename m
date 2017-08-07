From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/8] Zynq GPIO driver changes
Date: Mon,  7 Aug 2017 13:01:53 +0200
Message-ID: <cover.1502103715.git.michal.simek@xilinx.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38831 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752935AbdHGLCE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 07:02:04 -0400
Received: by mail-wr0-f195.google.com with SMTP id g32so77577wrd.5
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 04:02:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-gpio@vger.kernel.org, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, linux-arm-kernel@lists.infradead.org

Hi,

the patchset contains several patches which adding new functionality to
the driver (irq wakeup, suspend/resume) and fixing issue with DATA_RO
reg. The rest of changes are fixing kernel-doc and checkpatch warnings.

Thanks,
Michal


Borsodi Petr (1):
  gpio: zynq: Wakeup gpio controller when it is used as IRQ controller

Michal Simek (2):
  gpio: zynq: Fix empty lines in driver
  gpio: zynq: Fix driver function parameters alignment

Nava kishore Manne (3):
  gpio: zynq: Shift zynq_gpio_init() to subsys_initcall level
  gpio: zynq: Fix kernel doc warnings
  gpio: zynq: Fix warnings in the driver

Shubhrajyoti Datta (1):
  gpio: zynq: Add support for suspend resume

Swapna Manupati (1):
  gpio: zynq: Provided workaround for GPIO

 drivers/gpio/gpio-zynq.c | 201 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 176 insertions(+), 25 deletions(-)

-- 
1.9.1

