From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: nand: fix implicit module.h usage in xway_nand.c
Date: Sat, 24 Dec 2016 18:19:44 +0100
Message-ID: <92266a2a-8a64-7c71-842e-26b12ddcf7a0@hauke-m.de>
References: <201612220745.BJjbs3bC%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hauke-m.de ([5.39.93.123]:58658 "EHLO mail.hauke-m.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932538AbcLXRTr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Dec 2016 12:19:47 -0500
In-Reply-To: <201612220745.BJjbs3bC%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kbuild test robot <lkp@intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org



On 12/22/2016 12:27 AM, kbuild test robot wrote:
> Hi Paul,
> 
> [auto build test ERROR on mtd/master]
> [also build test ERROR on v4.9 next-20161221]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Paul-Gortmaker/mtd-nand-fix-implicit-module-h-usage-in-xway_nand-c/20161221-115714
> base:   git://git.infradead.org/linux-mtd.git master
> config: mips-xway_defconfig (attached as .config)
> compiler: mips-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=mips 
> 
> All errors (new ones prefixed by >>):
> 
>    arch/mips/built-in.o: In function `vpe_run':
>>> (.text+0x148f0): undefined reference to `physical_memsize'
>    arch/mips/built-in.o: In function `vpe_run':
>    (.text+0x148f4): undefined reference to `physical_memsize'
Let me look into this, it is probably caused by activating a "bad"
config option and not related to GPIO at all.

Hauke
