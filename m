From: kbuild test robot <fengguang.wu@intel.com>
Subject: [pinctrl:devel 30/37] drivers/pinctrl/pinconf.c:205:6: sparse:
 symbol 'pinconf_show_config' was not declared. Should it be static?
Date: Fri, 17 Jul 2015 21:37:09 +0800
Message-ID: <201507172143.e7QtgNrM%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: kbuild-all@01.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   16c06171faa4ad430393ca896fc62eb9e2e6dd40
commit: d96310aeddc692cf1f06861cf722c4843e0a3f28 [30/37] pinctrl: pinconf: Fix display of configs
reproduce:
  # apt-get install sparse
  git checkout d96310aeddc692cf1f06861cf722c4843e0a3f28
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/pinctrl/pinconf.c:205:6: sparse: symbol 'pinconf_show_config' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
