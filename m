From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: pca953x: add PCAL9535 interrupt support for
 Galileo Gen2
Date: Thu, 7 Apr 2016 12:17:39 +0800
Message-ID: <201604071254.vQU9Z1Qg%fengguang.wu@intel.com>
References: <1459995341-15341-1-git-send-email-yong.b.li@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459995341-15341-1-git-send-email-yong.b.li@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, yong.b.li@intel.com, andriy.shevchenko@linux.intel.com, ismo.puustinen@intel.com, preid@electromag.com.au
List-Id: linux-gpio@vger.kernel.org

Hi Yong,

[auto build test WARNING on gpio/for-next]
[also build test WARNING on v4.6-rc2 next-20160406]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Yong-Li/gpio-pca953x-add-PCAL9535-interrupt-support-for-Galileo-Gen2/20160407-102414
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-pca953x.c:522:10-11: WARNING: return of 0/1 in function 'pca953x_irq_pending' with return type bool

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
