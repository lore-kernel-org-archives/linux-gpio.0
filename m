From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Fri, 22 Mar 2019 12:42:42 +0200
Message-ID: <20190322104242.GV3622@lahna.fi.intel.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com>
 <2019032119195575582546@cvte.com>
 <20190321120324.GI3622@lahna.fi.intel.com>
 <2019032120213955866649@cvte.com>
 <20190321123637.GJ3622@lahna.fi.intel.com>
 <2019032121342663125658@cvte.com>
 <20190321135642.GK3622@lahna.fi.intel.com>
 <2019032211131426883268@cvte.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2019032211131426883268@cvte.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "zhuchangchun@cvte.com" <zhuchangchun@cvte.com>
Cc: "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>, "linus.walleij" <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, hendychu <hendychu@aliyun.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 22, 2019 at 11:14:14AM +0800, zhuchangchun@cvte.com wrote:
>    static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
>       struct pinctrl_gpio_range *range,
>       unsigned pin, bool input)
>    {
>    struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>    void __iomem *padcfg0;
>    unsigned long flags;
>    u32 value;
>    spin_lock_irqsave(&pctrl->lock, flags);
>    padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
>    value = readl(padcfg0);
>    if (input)
>    value |= PADCFG0_GPIOTXDIS;
>    else
>    value &= ~PADCFG0_GPIOTXDIS;
>    writel(value, padcfg0);
>    spin_unlock_irqrestore(&pctrl->lock, flags);
>    return 0;
>    }
> 
>    From above,you can kown when you export a GPIO ,it will do request,
> 
>    and there will set TX and RX register at the time same time.
> 
>    when you try to set direction in and set value, TX register value can
>    roll back
> 
>    the value,but RX register was not set, so who will set RX value back??

I think you are looking at some older code. There is now function
__intel_gpio_set_direction() that is supposed to set both buffers
depending on the direction. It was introduced with commit 17fab473693e
("pinctrl: intel: Set pin direction properly").
