From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v3 0/1 RESEND] gpio: arizona: add support for WM8998 and WM1814
Date: Thu, 10 Sep 2015 16:59:00 +0100
Message-ID: <1441900741-11302-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
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
