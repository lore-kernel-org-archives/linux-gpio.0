From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/18] gpio: mockup: updates for v4.16
Date: Mon, 27 Nov 2017 11:48:36 +0100
Message-ID: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:32966 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752227AbdK0KtJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 05:49:09 -0500
Received: by mail-wr0-f196.google.com with SMTP id 55so9632376wrx.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2017 02:49:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

The following series contains a number of updates for the gpio-mockup
module.

The most significant changes are:
- rework the way we probe the devices: use a separate platform device
  for every mockup chip, pass the chip configuration over platform
  data to probe()
- parse the module params in the init function, not in probe()
- extend the debugfs layout for event generation
- improve the module params sanitization
- implement the set_multiple callback

Others are mostly less significant fixes and minor coding style tweaks.

Bartosz Golaszewski (18):
  gpio: mockup: add missing prefixes
  gpio: mockup: parse the module params in init, not probe
  gpio: mockup: verify the number of GPIO chips requested
  gpio: mockup: rework device probing
  gpio: mockup: implement gpio_mockup_err()
  gpio: mockup: remove a stray tab
  gpio: mockup: merge gpio_mockup_add() into gpio_mockup_probe()
  gpio: mockup: pass the named_lines parameter over platform_data
  gpio: mockup: extend the debugfs layout
  gpio: mockup: change the type of value field in line state struct
  gpio: mockup: group code by logic
  gpio: mockup: fix debugfs handling
  gpio: mockup: verify that ngpio > 0
  gpio: mockup: tweak line breaks
  gpio: mockup: implement gpio_mockup_set_multiple()
  gpio: mockup: modify the return value check for devm_irq_sim_init()
  gpio: mockup: rename gpio_mockup_params_nr to gpio_mockup_num_ranges
  gpio: mockup: add helpers for accessing the gpio ranges

 drivers/gpio/gpio-mockup.c | 288 ++++++++++++++++++++++++++-------------------
 1 file changed, 166 insertions(+), 122 deletions(-)

-- 
2.15.0

