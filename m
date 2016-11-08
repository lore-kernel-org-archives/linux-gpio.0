From: kbuild test robot <fengguang.wu@intel.com>
Subject: [pinctrl:devel 43/47]
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c:154:9: error: 'struct
 samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean
 'pin_base'?
Date: Tue, 8 Nov 2016 21:18:55 +0800
Message-ID: <201611082149.nKSD6X0H%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:11041 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750745AbcKHNTl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Nov 2016 08:19:41 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   05e51a4da2af5f68c911adcb888f103460a2e5b3
commit: e40fde2c098df8bbaf82b5b80b43aa49eb2cb9af [43/47] pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank
config: arm-samsung (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e40fde2c098df8bbaf82b5b80b43aa49eb2cb9af
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All error/warnings (new ones prefixed by >>):

   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c24xx_eint_set_function':
>> drivers/pinctrl/samsung/pinctrl-s3c24xx.c:154:9: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     reg = d->virt_base + bank->pctl_offset;
            ^~
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c24xx_eint_type':
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:187:9: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     reg = d->virt_base + EINT_REG(index);
            ^~
   In file included from include/linux/io.h:25:0,
                    from include/linux/irq.h:24,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:20:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c2412_eint0_3_ack':
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:265:18: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     writel(bitval, d->virt_base + EINTPEND_REG);
                     ^
   arch/arm/include/asm/io.h:297:71: note: in definition of macro 'writel_relaxed'
    #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                                                                          ^
>> drivers/pinctrl/samsung/pinctrl-s3c24xx.c:265:2: note: in expansion of macro 'writel'
     writel(bitval, d->virt_base + EINTPEND_REG);
     ^~~~~~
   In file included from include/linux/byteorder/little_endian.h:4:0,
                    from arch/arm/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:5,
                    from arch/arm/include/asm/bitops.h:340,
                    from include/linux/bitops.h:36,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:16:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c2412_eint0_3_mask':
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:274:16: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     mask = readl(d->virt_base + EINTMASK_REG);
                   ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   arch/arm/include/asm/io.h:301:32: note: in expansion of macro 'readl_relaxed'
    #define readl(c)  ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
                                   ^~~~~~~~~~~~~
>> drivers/pinctrl/samsung/pinctrl-s3c24xx.c:274:9: note: in expansion of macro 'readl'
     mask = readl(d->virt_base + EINTMASK_REG);
            ^~~~~
   In file included from include/linux/io.h:25:0,
                    from include/linux/irq.h:24,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:20:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:276:16: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     writel(mask, d->virt_base + EINTMASK_REG);
                   ^
   arch/arm/include/asm/io.h:297:71: note: in definition of macro 'writel_relaxed'
    #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                                                                          ^
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:276:2: note: in expansion of macro 'writel'
     writel(mask, d->virt_base + EINTMASK_REG);
     ^~~~~~
   In file included from include/linux/byteorder/little_endian.h:4:0,
                    from arch/arm/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:5,
                    from arch/arm/include/asm/bitops.h:340,
                    from include/linux/bitops.h:36,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:16:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c2412_eint0_3_unmask':
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:285:16: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     mask = readl(d->virt_base + EINTMASK_REG);
                   ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   arch/arm/include/asm/io.h:301:32: note: in expansion of macro 'readl_relaxed'
    #define readl(c)  ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
                                   ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:285:9: note: in expansion of macro 'readl'
     mask = readl(d->virt_base + EINTMASK_REG);
            ^~~~~
   In file included from include/linux/io.h:25:0,
                    from include/linux/irq.h:24,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:20:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:287:16: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     writel(mask, d->virt_base + EINTMASK_REG);
                   ^
   arch/arm/include/asm/io.h:297:71: note: in definition of macro 'writel_relaxed'
    #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                                                                          ^
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:287:2: note: in expansion of macro 'writel'
     writel(mask, d->virt_base + EINTMASK_REG);
     ^~~~~~
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c24xx_eint_ack':
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:325:24: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     writel(1UL << index, d->virt_base + EINTPEND_REG);
                           ^
   arch/arm/include/asm/io.h:297:71: note: in definition of macro 'writel_relaxed'
    #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                                                                          ^
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:325:2: note: in expansion of macro 'writel'
     writel(1UL << index, d->virt_base + EINTPEND_REG);
     ^~~~~~
   In file included from include/linux/byteorder/little_endian.h:4:0,
                    from arch/arm/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:5,
                    from arch/arm/include/asm/bitops.h:340,
                    from include/linux/bitops.h:36,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:16:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c24xx_eint_mask':
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:335:16: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     mask = readl(d->virt_base + EINTMASK_REG);
                   ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   arch/arm/include/asm/io.h:301:32: note: in expansion of macro 'readl_relaxed'
    #define readl(c)  ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
                                   ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:335:9: note: in expansion of macro 'readl'
     mask = readl(d->virt_base + EINTMASK_REG);
            ^~~~~
   In file included from include/linux/io.h:25:0,
                    from include/linux/irq.h:24,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:20:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:337:16: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
     writel(mask, d->virt_base + EINTMASK_REG);
                   ^
   arch/arm/include/asm/io.h:297:71: note: in definition of macro 'writel_relaxed'
    #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                                                                          ^
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:337:2: note: in expansion of macro 'writel'
     writel(mask, d->virt_base + EINTMASK_REG);
     ^~~~~~
   In file included from include/linux/byteorder/little_endian.h:4:0,
                    from arch/arm/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:5,
                    from arch/arm/include/asm/bitops.h:340,
                    from include/linux/bitops.h:36,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,

vim +154 drivers/pinctrl/samsung/pinctrl-s3c24xx.c

af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   14   */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   15  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   16  #include <linux/module.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   17  #include <linux/device.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   18  #include <linux/interrupt.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   19  #include <linux/irqdomain.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  @20  #include <linux/irq.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   21  #include <linux/of_irq.h>
c2c70a79 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-06-19   22  #include <linux/irqchip/chained_irq.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   23  #include <linux/io.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   24  #include <linux/slab.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   25  #include <linux/err.h>
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   26  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   27  #include "pinctrl-samsung.h"
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   28  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   29  #define NUM_EINT	24
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   30  #define NUM_EINT_IRQ	6
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   31  #define EINT_MAX_PER_GROUP	8
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   32  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   33  #define EINTPEND_REG	0xa8
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   34  #define EINTMASK_REG	0xa4
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   35  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   36  #define EINT_GROUP(i)		((int)((i) / EINT_MAX_PER_GROUP))
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   37  #define EINT_REG(i)		((EINT_GROUP(i) * 4) + 0x88)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   38  #define EINT_OFFS(i)		((i) % EINT_MAX_PER_GROUP * 4)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   39  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   40  #define EINT_LEVEL_LOW		0
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   41  #define EINT_LEVEL_HIGH		1
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   42  #define EINT_EDGE_FALLING	2
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   43  #define EINT_EDGE_RISING	4
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   44  #define EINT_EDGE_BOTH		6
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   45  #define EINT_MASK		0xf
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   46  
94ce944b drivers/pinctrl/samsung/pinctrl-s3c24xx.c Tomasz Figa     2014-09-23   47  static const struct samsung_pin_bank_type bank_type_1bit = {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   48  	.fld_width = { 1, 1, },
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   49  	.reg_offset = { 0x00, 0x04, },
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   50  };
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   51  
94ce944b drivers/pinctrl/samsung/pinctrl-s3c24xx.c Tomasz Figa     2014-09-23   52  static const struct samsung_pin_bank_type bank_type_2bit = {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   53  	.fld_width = { 2, 1, 2, },
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   54  	.reg_offset = { 0x00, 0x04, 0x08, },
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   55  };
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   56  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   57  #define PIN_BANK_A(pins, reg, id)		\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   58  	{						\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   59  		.type		= &bank_type_1bit,	\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   60  		.pctl_offset	= reg,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   61  		.nr_pins	= pins,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   62  		.eint_type	= EINT_TYPE_NONE,	\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   63  		.name		= id			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   64  	}
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   65  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   66  #define PIN_BANK_2BIT(pins, reg, id)		\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   67  	{						\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   68  		.type		= &bank_type_2bit,	\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   69  		.pctl_offset	= reg,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   70  		.nr_pins	= pins,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   71  		.eint_type	= EINT_TYPE_NONE,	\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   72  		.name		= id			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   73  	}
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   74  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   75  #define PIN_BANK_2BIT_EINTW(pins, reg, id, eoffs, emask)\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   76  	{						\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   77  		.type		= &bank_type_2bit,	\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   78  		.pctl_offset	= reg,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   79  		.nr_pins	= pins,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   80  		.eint_type	= EINT_TYPE_WKUP,	\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   81  		.eint_func	= 2,			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   82  		.eint_mask	= emask,		\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   83  		.eint_offset	= eoffs,		\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   84  		.name		= id			\
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   85  	}
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   86  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   87  /**
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   88   * struct s3c24xx_eint_data: EINT common data
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   89   * @drvdata: pin controller driver data
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   90   * @domains: IRQ domains of particular EINT interrupts
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   91   * @parents: mapped parent irqs in the main interrupt controller
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   92   */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   93  struct s3c24xx_eint_data {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   94  	struct samsung_pinctrl_drv_data *drvdata;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   95  	struct irq_domain *domains[NUM_EINT];
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   96  	int parents[NUM_EINT_IRQ];
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   97  };
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   98  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21   99  /**
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  100   * struct s3c24xx_eint_domain_data: per irq-domain data
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  101   * @bank: pin bank related to the domain
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  102   * @eint_data: common data
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  103   * eint0_3_parent_only: live eints 0-3 only in the main intc
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  104   */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  105  struct s3c24xx_eint_domain_data {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  106  	struct samsung_pin_bank *bank;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  107  	struct s3c24xx_eint_data *eint_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  108  	bool eint0_3_parent_only;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  109  };
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  110  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  111  static int s3c24xx_eint_get_trigger(unsigned int type)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  112  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  113  	switch (type) {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  114  	case IRQ_TYPE_EDGE_RISING:
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  115  		return EINT_EDGE_RISING;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  116  		break;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  117  	case IRQ_TYPE_EDGE_FALLING:
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  118  		return EINT_EDGE_FALLING;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  119  		break;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  120  	case IRQ_TYPE_EDGE_BOTH:
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  121  		return EINT_EDGE_BOTH;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  122  		break;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  123  	case IRQ_TYPE_LEVEL_HIGH:
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  124  		return EINT_LEVEL_HIGH;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  125  		break;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  126  	case IRQ_TYPE_LEVEL_LOW:
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  127  		return EINT_LEVEL_LOW;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  128  		break;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  129  	default:
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  130  		return -EINVAL;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  131  	}
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  132  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  133  
f66eb498 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Thomas Gleixner 2015-06-23  134  static void s3c24xx_eint_set_handler(struct irq_data *d, unsigned int type)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  135  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  136  	/* Edge- and level-triggered interrupts need different handlers */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  137  	if (type & IRQ_TYPE_EDGE_BOTH)
f66eb498 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Thomas Gleixner 2015-06-23  138  		irq_set_handler_locked(d, handle_edge_irq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  139  	else
f66eb498 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Thomas Gleixner 2015-06-23  140  		irq_set_handler_locked(d, handle_level_irq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  141  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  142  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  143  static void s3c24xx_eint_set_function(struct samsung_pinctrl_drv_data *d,
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  144  					struct samsung_pin_bank *bank, int pin)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  145  {
94ce944b drivers/pinctrl/samsung/pinctrl-s3c24xx.c Tomasz Figa     2014-09-23  146  	const struct samsung_pin_bank_type *bank_type = bank->type;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  147  	unsigned long flags;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  148  	void __iomem *reg;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  149  	u8 shift;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  150  	u32 mask;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  151  	u32 val;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  152  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  153  	/* Make sure that pin is configured as interrupt */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21 @154  	reg = d->virt_base + bank->pctl_offset;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  155  	shift = pin * bank_type->fld_width[PINCFG_TYPE_FUNC];
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  156  	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  157  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  158  	spin_lock_irqsave(&bank->slock, flags);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  159  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  160  	val = readl(reg);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  161  	val &= ~(mask << shift);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  162  	val |= bank->eint_func << shift;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  163  	writel(val, reg);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  164  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  165  	spin_unlock_irqrestore(&bank->slock, flags);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  166  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  167  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  168  static int s3c24xx_eint_type(struct irq_data *data, unsigned int type)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  169  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  170  	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(data);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  171  	struct samsung_pinctrl_drv_data *d = bank->drvdata;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  172  	int index = bank->eint_offset + data->hwirq;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  173  	void __iomem *reg;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  174  	int trigger;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  175  	u8 shift;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  176  	u32 val;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  177  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  178  	trigger = s3c24xx_eint_get_trigger(type);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  179  	if (trigger < 0) {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  180  		dev_err(d->dev, "unsupported external interrupt type\n");
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  181  		return -EINVAL;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  182  	}
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  183  
f66eb498 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Thomas Gleixner 2015-06-23  184  	s3c24xx_eint_set_handler(data, type);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  185  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  186  	/* Set up interrupt trigger */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  187  	reg = d->virt_base + EINT_REG(index);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  188  	shift = EINT_OFFS(index);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  189  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  190  	val = readl(reg);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  191  	val &= ~(EINT_MASK << shift);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  192  	val |= trigger << shift;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  193  	writel(val, reg);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  194  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  195  	s3c24xx_eint_set_function(d, bank, data->hwirq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  196  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  197  	return 0;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  198  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  199  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  200  /* Handling of EINTs 0-3 on all except S3C2412 and S3C2413 */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  201  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  202  static void s3c2410_eint0_3_ack(struct irq_data *data)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  203  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  204  	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(data);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  205  	struct s3c24xx_eint_domain_data *ddata = bank->irq_domain->host_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  206  	struct s3c24xx_eint_data *eint_data = ddata->eint_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  207  	int parent_irq = eint_data->parents[data->hwirq];
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  208  	struct irq_chip *parent_chip = irq_get_chip(parent_irq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  209  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  210  	parent_chip->irq_ack(irq_get_irq_data(parent_irq));
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  211  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  212  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  213  static void s3c2410_eint0_3_mask(struct irq_data *data)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  214  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  215  	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(data);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  216  	struct s3c24xx_eint_domain_data *ddata = bank->irq_domain->host_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  217  	struct s3c24xx_eint_data *eint_data = ddata->eint_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  218  	int parent_irq = eint_data->parents[data->hwirq];
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  219  	struct irq_chip *parent_chip = irq_get_chip(parent_irq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  220  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  221  	parent_chip->irq_mask(irq_get_irq_data(parent_irq));
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  222  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  223  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  224  static void s3c2410_eint0_3_unmask(struct irq_data *data)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  225  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  226  	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(data);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  227  	struct s3c24xx_eint_domain_data *ddata = bank->irq_domain->host_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  228  	struct s3c24xx_eint_data *eint_data = ddata->eint_data;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  229  	int parent_irq = eint_data->parents[data->hwirq];
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  230  	struct irq_chip *parent_chip = irq_get_chip(parent_irq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  231  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  232  	parent_chip->irq_unmask(irq_get_irq_data(parent_irq));
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  233  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  234  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  235  static struct irq_chip s3c2410_eint0_3_chip = {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  236  	.name		= "s3c2410-eint0_3",
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  237  	.irq_ack	= s3c2410_eint0_3_ack,
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  238  	.irq_mask	= s3c2410_eint0_3_mask,
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  239  	.irq_unmask	= s3c2410_eint0_3_unmask,
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  240  	.irq_set_type	= s3c24xx_eint_type,
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  241  };
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  242  
bd0b9ac4 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Thomas Gleixner 2015-09-14  243  static void s3c2410_demux_eint0_3(struct irq_desc *desc)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  244  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  245  	struct irq_data *data = irq_desc_get_irq_data(desc);
5663bb27 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Jiang Liu       2015-06-04  246  	struct s3c24xx_eint_data *eint_data = irq_desc_get_handler_data(desc);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  247  	unsigned int virq;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  248  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  249  	/* the first 4 eints have a simple 1 to 1 mapping */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  250  	virq = irq_linear_revmap(eint_data->domains[data->hwirq], data->hwirq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  251  	/* Something must be really wrong if an unmapped EINT is unmasked */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  252  	BUG_ON(!virq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  253  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  254  	generic_handle_irq(virq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  255  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  256  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  257  /* Handling of EINTs 0-3 on S3C2412 and S3C2413 */
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  258  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  259  static void s3c2412_eint0_3_ack(struct irq_data *data)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  260  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  261  	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(data);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  262  	struct samsung_pinctrl_drv_data *d = bank->drvdata;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  263  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  264  	unsigned long bitval = 1UL << data->hwirq;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21 @265  	writel(bitval, d->virt_base + EINTPEND_REG);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  266  }
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  267  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  268  static void s3c2412_eint0_3_mask(struct irq_data *data)
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  269  {
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  270  	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(data);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  271  	struct samsung_pinctrl_drv_data *d = bank->drvdata;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  272  	unsigned long mask;
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  273  
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21 @274  	mask = readl(d->virt_base + EINTMASK_REG);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  275  	mask |= (1UL << data->hwirq);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  276  	writel(mask, d->virt_base + EINTMASK_REG);
af99a750 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner  2013-05-21  277  }

:::::: The code at line 154 was first introduced by commit
:::::: af99a7507469d4fa6dd4d8d633e093b1ff7aff6e pinctrl: Add pinctrl-s3c24xx driver

:::::: TO: Heiko Stuebner <heiko@sntech.de>
:::::: CC: Kukjin Kim <kgene.kim@samsung.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--XsQoSWH+UP9D9v3l
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--XsQoSWH+UP9D9v3l--
