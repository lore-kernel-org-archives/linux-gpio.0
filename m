From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] pinctrl/amd: use byte access to clear irq/wake status
 bits
Date: Thu, 23 Aug 2018 23:28:50 +0800
Message-ID: <201808232202.duTVF1Ab%fengguang.wu@intel.com>
References: <20180822165754.213402-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180822165754.213402-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Daniel Drake <drake@endlessm.com>, Shyam-sundar.S-k@amd.com, Nehal-bakulchandra.Shah@amd.com, Ken.Xue@amd.com, Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on pinctrl/devel]
[also build test WARNING on v4.18 next-20180822]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Daniel-Kurtz/pinctrl-amd-use-byte-access-to-clear-irq-wake-status-bits/20180823-103347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   drivers/pinctrl/pinctrl-amd.c:546:14: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned int [usertype] *regs @@    got signed int [usertype] *regs @@
   drivers/pinctrl/pinctrl-amd.c:546:14:    expected unsigned int [usertype] *regs
   drivers/pinctrl/pinctrl-amd.c:546:14:    got void [noderef] <asn:2>*base
   drivers/pinctrl/pinctrl-amd.c:554:45: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
   drivers/pinctrl/pinctrl-amd.c:554:45:    expected void const volatile [noderef] <asn:2>*addr
   drivers/pinctrl/pinctrl-amd.c:554:45:    got unsigned int [usertype] *
>> drivers/pinctrl/pinctrl-amd.c:568:65: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
   drivers/pinctrl/pinctrl-amd.c:568:65:    expected void volatile [noderef] <asn:2>*addr
   drivers/pinctrl/pinctrl-amd.c:568:65:    got unsigned char [usertype] *
   include/linux/device.h:678:13: sparse: undefined identifier '__builtin_mul_overflow'
   include/linux/device.h:678:13: sparse: call with no type!

vim +568 drivers/pinctrl/pinctrl-amd.c

   526	
   527	static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
   528	{
   529		struct amd_gpio *gpio_dev = dev_id;
   530		struct gpio_chip *gc = &gpio_dev->gc;
   531		irqreturn_t ret = IRQ_NONE;
   532		unsigned int i, irqnr;
   533		unsigned long flags;
   534		u32 *regs, regval;
   535		u64 status, mask;
   536	
   537		/* Read the wake status */
   538		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
   539		status = readl(gpio_dev->base + WAKE_INT_STATUS_REG1);
   540		status <<= 32;
   541		status |= readl(gpio_dev->base + WAKE_INT_STATUS_REG0);
   542		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
   543	
   544		/* Bit 0-45 contain the relevant status bits */
   545		status &= (1ULL << 46) - 1;
 > 546		regs = gpio_dev->base;
   547		for (mask = 1, irqnr = 0; status; mask <<= 1, regs += 4, irqnr += 4) {
   548			if (!(status & mask))
   549				continue;
   550			status &= ~mask;
   551	
   552			/* Each status bit covers four pins */
   553			for (i = 0; i < 4; i++) {
   554				regval = readl(regs + i);
   555				if (!(regval & PIN_IRQ_PENDING) ||
   556				    !(regval & BIT(INTERRUPT_MASK_OFF)))
   557					continue;
   558				irq = irq_find_mapping(gc->irq.domain, irqnr + i);
   559				generic_handle_irq(irq);
   560	
   561				/*
   562				 * Write 1 to clear the irq/wake status bits in MSByte.
   563				 * All other bits in this byte are read-only.  This
   564				 * avoids modifying the lower 24-bits, in case their
   565				 * value was changed while executing
   566				 * generic_handle_irq() above.
   567				 */
 > 568				writeb((regval >> 24), (u8 *)(regs + i) + 3);
   569				ret = IRQ_HANDLED;
   570			}
   571		}
   572	
   573		/* Signal EOI to the GPIO unit */
   574		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
   575		regval = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
   576		regval |= EOI_MASK;
   577		writel(regval, gpio_dev->base + WAKE_INT_MASTER_REG);
   578		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
   579	
   580		return ret;
   581	}
   582	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
