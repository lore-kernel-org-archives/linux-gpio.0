From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v3] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Wed, 19 Dec 2018 08:48:42 +0200
Message-ID: <20181219064842.GG2477@localhost.localdomain>
References: <20181218115931.GA21253@localhost.localdomain>
 <201812182306.X3vcHVlL%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201812182306.X3vcHVlL%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, vladimir_zapolskiy@mentor.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 18, 2018 at 11:36:22PM +0800, kbuild test robot wrote:
> Hi Matti,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on regmap/for-next]
> [also build test ERROR on next-20181218]
> [cannot apply to v4.20-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/regmap-regmap-irq-gpio-max77620-add-level-irq-support/20181218-225844
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
> config: x86_64-randconfig-x006-201850 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/base/regmap/regmap-irq.c: In function 'regmap_add_irq_chip':
> >> drivers/base/regmap/regmap-irq.c:644:24: error: 'const struct regmap_irq' has no member named 'type_reg_offset'; did you mean 'reg_offset'?
>        reg = chip->irqs[i].type_reg_offset / map->reg_stride;
>                            ^~~~~~~~~~~~~~~
>                            reg_offset
> >> drivers/base/regmap/regmap-irq.c:645:41: error: 'const struct regmap_irq' has no member named 'type_rising_mask'
>        d->type_buf_def[reg] |= chip->irqs[i].type_rising_mask |
>                                             ^
> >> drivers/base/regmap/regmap-irq.c:646:19: error: 'const struct regmap_irq' has no member named 'type_falling_mask'
>          chip->irqs[i].type_falling_mask;
---

> > Version 3 of this patch is intended to be functionally identical to v2.
> > This patch is rebased on top of a tree which contains changes:
> > "regmap: irq: handle HW using separate rising/falling edge interrupts"
> > from Bartosz Golaszewski and the change
> > "regmap: regmap-irq: Remove default irq type setting from core"
> > (proposed here):
> > https://lore.kernel.org/lkml/20181218105813.GA6957@localhost.localdomain/
> > 
> > There should not be direct dependency to "regmap: regmap-irq: Remove
> > default irq type setting from core" though. Patch was also tested to
> > apply cleany on regmap-tree.

I forgot that the block of code the commit "regmap: regmap-irq: Remove
default irq type setting from core" removes do use the old type specifiers
whcih this patch changes. So even though this patch applies cleanly on tree
which does not include "regmap: regmap-irq: Remove default irq type setting
from core" - it does not mean there is no dependency. This was my brain fart.
There is dependency. "regmap: regmap-irq: Remove default irq type setting
from core" should be applied prior this patch.

Should I combine these two patches as a series (and resend them) or what is
the correct way to note the dependency?

Br,
	Matti Vaittinen
