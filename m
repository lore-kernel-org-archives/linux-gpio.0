From: "Xue, Ken" <Ken.Xue@amd.com>
Subject: RE: pinctrl: add AMD GPIO driver support.
Date: Fri, 20 Mar 2015 01:37:24 +0000
Message-ID: <4AC89B18A26BAB43B540DB1C94E2802C05B1C2E3@scybexdag03.amd.com>
References: <20150319160716.GA28850@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0125.outbound.protection.outlook.com ([65.55.169.125]:14785
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750905AbbCTBhe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2015 21:37:34 -0400
In-Reply-To: <20150319160716.GA28850@mwanda>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Dan,
Thanks.
Can you tell me how to check this kind of warnings by myself, before I send the patches?
I will send V4 patch for fixing warning.

Regards,
Ken

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: Friday, March 20, 2015 12:07 AM
To: Xue, Ken
Cc: linux-gpio@vger.kernel.org
Subject: re: pinctrl: add AMD GPIO driver support.

Hello Ken Xue,

The patch dbad75dd1f25: "pinctrl: add AMD GPIO driver support." from Mar 10, 2015, leads to the following Smatch warning:

    drivers/pinctrl/pinctrl-amd.c:180 amd_gpio_set_debounce()
    warn: inconsistent returns 'spin_lock:&gpio_dev->lock'.
        Locked on:   line 169
        Unlocked on: line 180

drivers/pinctrl/pinctrl-amd.c
   152                  } else if (debounce < 3900) {
   153                          time = debounce / 244;
   154                          pin_reg |= time & DB_TMR_OUT_MASK;
   155                          pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
   156                          pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
   157                  } else if (debounce < 250000) {
   158                          time = debounce / 15600;
   159                          pin_reg |= time & DB_TMR_OUT_MASK;
   160                          pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
   161                          pin_reg |= BIT(DB_TMR_LARGE_OFF);
   162                  } else if (debounce < 1000000) {
   163                          time = debounce / 62500;
   164                          pin_reg |= time & DB_TMR_OUT_MASK;
   165                          pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
   166                          pin_reg |= BIT(DB_TMR_LARGE_OFF);
   167                  } else {
   168                          pin_reg &= ~DB_CNTRl_MASK;
   169                          return -EINVAL;
                                ^^^^^^^^^^^^^^^ Should be:
				ret = -EINVAL;
				goto unlock;

   170                  }
   171          } else {
   172                  pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
   173                  pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
   174                  pin_reg &= ~DB_TMR_OUT_MASK;
   175                  pin_reg &= ~DB_CNTRl_MASK;
   176          }
   177          writel(pin_reg, gpio_dev->base + offset * 4);
   178          spin_unlock_irqrestore(&gpio_dev->lock, flags);
   179  
   180          return 0;
   181  }

    drivers/pinctrl/pinctrl-amd.c:474 amd_gpio_irq_set_type()
    warn: inconsistent returns 'spin_lock:&gpio_dev->lock'.
        Locked on:   line 474
        Unlocked on: line 474

drivers/pinctrl/pinctrl-amd.c
   460          case IRQ_TYPE_NONE:
   461                  break;
   462  
   463          default:
   464                  dev_err(&gpio_dev->pdev->dev, "Invalid type value\n");
   465                  ret = -EINVAL;
   466                  goto exit;

Little bunny hop exit labels are the worst.  :(  Either they do nothing or the naming is lazy.  This should be a do-something label called unlock.

   467          }
   468  
   469          pin_reg |= CLR_INTR_STAT << INTERRUPT_STS_OFF;
   470          writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
   471          spin_unlock_irqrestore(&gpio_dev->lock, flags);
   472  
   473  exit:
   474          return ret;
   475  }


    drivers/pinctrl/pinctrl-amd.c:685 amd_pinconf_set()
    warn: inconsistent returns 'spin_lock:&gpio_dev->lock'.
        Locked on:   line 678
        Unlocked on: line 685

drivers/pinctrl/pinctrl-amd.c
   672                                          << DRV_STRENGTH_SEL_OFF;
   673                          break;
   674  
   675                  default:
   676                          dev_err(&gpio_dev->pdev->dev,
   677                                  "Invalid config param %04x\n", param);
   678                          return -ENOTSUPP;
   679                  }
   680  
   681                  writel(pin_reg, gpio_dev->base + pin*4);
   682          }
   683          spin_unlock_irqrestore(&gpio_dev->lock, flags);
   684  
   685          return 0;
   686  }

    drivers/pinctrl/pinctrl-amd.c:765 amd_gpio_probe()
    warn: unsigned 'irq_base' is never less than zero.

drivers/pinctrl/pinctrl-amd.c
   739  static int amd_gpio_probe(struct platform_device *pdev)
   740  {
   741          int ret = 0;
   742          u32 irq_base;
   743          struct resource *res;
   744          struct amd_gpio *gpio_dev;
   745  
   746          gpio_dev = devm_kzalloc(&pdev->dev,
   747                                  sizeof(struct amd_gpio), GFP_KERNEL);
   748          if (!gpio_dev)
   749                  return -ENOMEM;
   750  
   751          spin_lock_init(&gpio_dev->lock);
   752  
   753          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   754          if (!res) {
   755                  dev_err(&pdev->dev, "Failed to get gpio io resource.\n");
   756                  return -EINVAL;
   757          }
   758  
   759          gpio_dev->base = devm_ioremap_nocache(&pdev->dev, res->start,
   760                                                  resource_size(res));
   761          if (IS_ERR(gpio_dev->base))
   762                  return PTR_ERR(gpio_dev->base);
   763  
   764          irq_base = platform_get_irq(pdev, 0);
   765          if (irq_base < 0) {
                    ^^^^^^^^
Should just be an int.

   766                  dev_err(&pdev->dev, "Failed to get gpio IRQ.\n");
   767                  return -EINVAL;
   768          }


regards,
dan carpenter
