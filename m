From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Wed, 7 Oct 2015 11:14:13 +0800
Message-ID: <201510071151.hH4lMK2P%fengguang.wu@intel.com>
References: <20151007024018.GA25534@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:8798 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753421AbbJGDPn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 6 Oct 2015 23:15:43 -0400
Content-Disposition: inline
In-Reply-To: <20151007024018.GA25534@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: kbuild-all@01.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Hi William,

[auto build test WARNING on v4.3-rc4 -- if it's inappropriate base, please ignore]


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-104-idio-16.c:151:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
