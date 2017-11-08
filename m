From: kbuild test robot <fengguang.wu@intel.com>
Subject: [pinctrl:devel 152/153] drivers/gpio/gpiolib.c:1943:19: warning:
 'struct lock_dep_class' declared inside parameter list
Date: Wed, 8 Nov 2017 22:38:11 +0800
Message-ID: <201711082209.w9VtmkEu%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:37992 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751839AbdKHOip (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Nov 2017 09:38:45 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   bfcadc85ef134881fce5f8635648e36de1ab4c9d
commit: 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40 [152/153] gpio: Automatically add lockdep keys
config: m68k-m5475evb_defconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 4.9.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40
        # save the attached .config to linux build tree
        make.cross ARCH=m68k 

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:1943:19: warning: 'struct lock_dep_class' declared inside parameter list
               struct lock_dep_class *lock_key)
                      ^
>> drivers/gpio/gpiolib.c:1943:19: warning: its scope is only this definition or declaration, which is probably not what you want
   drivers/gpio/gpiolib.c:1942:19: error: conflicting types for 'gpiochip_add_irqchip'
    static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
                      ^
   drivers/gpio/gpiolib.c:75:12: note: previous declaration of 'gpiochip_add_irqchip' was here
    static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
               ^
   drivers/gpio/gpiolib.c:75:12: warning: 'gpiochip_add_irqchip' used but never defined

vim +1943 drivers/gpio/gpiolib.c

  1941	
  1942	static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
> 1943					       struct lock_dep_class *lock_key)
  1944	{
  1945		return 0;
  1946	}
  1947	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--ZGiS0Q5IWpPtfppv
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ZGiS0Q5IWpPtfppv--
