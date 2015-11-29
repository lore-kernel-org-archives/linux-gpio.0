From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 3/4] gpio: pxa: change the interrupt management
Date: Sun, 29 Nov 2015 11:03:38 +0100
Message-ID: <87poyt6s1x.fsf@belgarion.home>
References: <201511290719.aiYQvtmz%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201511290719.aiYQvtmz%fengguang.wu@intel.com> (kbuild test
	robot's message of "Sun, 29 Nov 2015 07:23:56 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

kbuild test robot <lkp@intel.com> writes:

> Hi Robert,
>
> [auto build test ERROR on: gpio/for-next]
> [also build test ERROR on: v4.4-rc2 next-20151127]
>
> url:    https://github.com/0day-ci/linux/commits/Robert-Jarzmik/gpio-pxa-integrate-with-pincontrol/20151129-054738
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> config: arm-pxa910_defconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpio/gpio-pxa.c: In function 'pxa_gpio_probe':
>>> drivers/gpio/gpio-pxa.c:625:12: error: 'pxa_irq_domain_ops' undeclared (first use in this function)
>            0, &pxa_irq_domain_ops, pchip);
>                ^
>    drivers/gpio/gpio-pxa.c:625:12: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/gpio/gpio-pxa.c: At top level:
>    drivers/gpio/gpio-pxa.c:500:24: warning: 'pxa_muxed_gpio_chip' defined but not used [-Wunused-variable]
>     static struct irq_chip pxa_muxed_gpio_chip = {

Ok, that one is a matter of "#ifdef CONFIG_OF" englobbing pxa_irq_domain_ops and
pxa_irq_domain_map().

Didn't see it as the platform_data based test has CONFIG_OF activated in my
kernel. That will be for v2, and tested without the CONFIG_OF to be sure.

Cheers.

--
Robert
