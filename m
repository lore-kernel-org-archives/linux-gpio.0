From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [gpio:devel 12/12] drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27:
 error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Sun, 15 Oct 2017 16:21:14 +0200
Message-ID: <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:56676 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751245AbdJOOVQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Oct 2017 10:21:16 -0400
Received: by mail-it0-f49.google.com with SMTP id g18so15338442itg.5
        for <linux-gpio@vger.kernel.org>; Sun, 15 Oct 2017 07:21:15 -0700 (PDT)
In-Reply-To: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Grygorii, can you look at this?

Linus

On Sun, Oct 15, 2017 at 3:52 AM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel
> head:   be58c675d634e0b91edc0f721c77303ac2afa809
> commit: be58c675d634e0b91edc0f721c77303ac2afa809 [12/12] gpiolib: drop irq_base field from gpio_chip struct
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout be58c675d634e0b91edc0f721c77303ac2afa809
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/mvebu/pinctrl-armada-37xx.c: In function 'armada_37xx_irq_startup':
>>> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
>      int irq = d->hwirq - chip->irq_base;
>                               ^~
>
> vim +630 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
>
> 2f2276053 Gregory CLEMENT 2017-04-28  626
> a9a1a4833 Gregory CLEMENT 2017-09-07  627  static unsigned int armada_37xx_irq_startup(struct irq_data *d)
> a9a1a4833 Gregory CLEMENT 2017-09-07  628  {
> a9a1a4833 Gregory CLEMENT 2017-09-07  629       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> a9a1a4833 Gregory CLEMENT 2017-09-07 @630       int irq = d->hwirq - chip->irq_base;
> a9a1a4833 Gregory CLEMENT 2017-09-07  631       /*
> a9a1a4833 Gregory CLEMENT 2017-09-07  632        * The mask field is a "precomputed bitmask for accessing the
> a9a1a4833 Gregory CLEMENT 2017-09-07  633        * chip registers" which was introduced for the generic
> a9a1a4833 Gregory CLEMENT 2017-09-07  634        * irqchip framework. As we don't use this framework, we can
> a9a1a4833 Gregory CLEMENT 2017-09-07  635        * reuse this field for our own usage.
> a9a1a4833 Gregory CLEMENT 2017-09-07  636        */
> a9a1a4833 Gregory CLEMENT 2017-09-07  637       d->mask = BIT(irq % GPIO_PER_REG);
> a9a1a4833 Gregory CLEMENT 2017-09-07  638
> a9a1a4833 Gregory CLEMENT 2017-09-07  639       armada_37xx_irq_unmask(d);
> a9a1a4833 Gregory CLEMENT 2017-09-07  640
> a9a1a4833 Gregory CLEMENT 2017-09-07  641       return 0;
> a9a1a4833 Gregory CLEMENT 2017-09-07  642  }
> a9a1a4833 Gregory CLEMENT 2017-09-07  643
>
> :::::: The code at line 630 was first introduced by commit
> :::::: a9a1a4833613b8a2e8dd79f860ea1871f17da02c pinctrl: armada-37xx: Fix gpio interrupt setup
>
> :::::: TO: Gregory CLEMENT <gregory.clement@free-electrons.com>
> :::::: CC: Linus Walleij <linus.walleij@linaro.org>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
