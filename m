From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/3] pinctrl: baytrail: Fix debounce feature
Date: Thu, 26 Jan 2017 19:24:06 +0200
Message-ID: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:6223 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753888AbdAZRYO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 12:24:14 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This series contains two important fixes of debounce feature and one
extension to debug printing.

It seems no one, including me, didn't test it properly. Lesson learned.

Note that fix doesn't make any difference to the existing logic. It
means the last caller will win the trade and debounce value will be
configured accordingly.

The actual logic fix needs to be thought about and it's not as important
as crash fix. That's why the latter goes separately and right now.

Andy Shevchenko (3):
  pinctrl: baytrail: Rectify debounce support (part 2)
  pinctrl: baytrail: Debounce register is one per community
  pinctrl: baytrail: Add debounce to debug output

 drivers/pinctrl/intel/pinctrl-baytrail.c | 71 ++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 9 deletions(-)

-- 
2.11.0

