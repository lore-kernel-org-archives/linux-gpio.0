From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v3 0/1 RESEND] gpio: arizona: add support for WM8998 and WM1814
Date: Tue, 21 Jul 2015 16:47:43 +0100
Message-ID: <1437493664-22812-1-git-send-email-rf@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

IMPORTANT: this patch has a build dependency on a patch from
Lee Jones's mfd tree for-mfd-next branch:

    "mfd: arizona: Add support for WM8998 and WM1814"

Richard Fitzgerald (1):
  gpio: arizona: add support for WM8998 and WM1814

 drivers/gpio/gpio-arizona.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.2.5
