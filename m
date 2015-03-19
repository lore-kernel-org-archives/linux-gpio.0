From: kbuild test robot <fengguang.wu@intel.com>
Subject: [next:master 5727/5749] drivers/gpio/gpio-altera.c:259:5: sparse:
 symbol 'altera_gpio_probe' was not declared. Should it be static?
Date: Thu, 19 Mar 2015 17:40:02 +0800
Message-ID: <201503191721.tDh6DZLK%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@01.org, Tien Hock Loh <thloh@altera.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ce040cc379e3e1e094db5559f393d794fbfd01e4
commit: 7fcb20a239a53831738bb991547ee4a1a0bebc06 [5727/5749] Merge remote-tracking branch 'gpio/for-next'
reproduce:
  # apt-get install sparse
  git checkout 7fcb20a239a53831738bb991547ee4a1a0bebc06
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-altera.c:259:5: sparse: symbol 'altera_gpio_probe' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
