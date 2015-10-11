From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: add tps65218 gpio driver
Date: Mon, 12 Oct 2015 01:12:20 +0800
Message-ID: <201510120157.r6FjOUkX%fengguang.wu@intel.com>
References: <1444581663-31066-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:25847 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332AbbJKRNj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 13:13:39 -0400
Content-Disposition: inline
In-Reply-To: <1444581663-31066-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: kbuild-all@01.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Nicolas,

[auto build test WARNING on gpio/for-next -- if it's inappropriate base, please ignore]


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-tps65218.c:153:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
