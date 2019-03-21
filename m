From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Thu, 21 Mar 2019 15:56:42 +0200
Message-ID: <20190321135642.GK3622@lahna.fi.intel.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com>
 <2019032119195575582546@cvte.com>
 <20190321120324.GI3622@lahna.fi.intel.com>
 <2019032120213955866649@cvte.com>
 <20190321123637.GJ3622@lahna.fi.intel.com>
 <2019032121342663125658@cvte.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2019032121342663125658@cvte.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "zhuchangchun@cvte.com" <zhuchangchun@cvte.com>
Cc: "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>, "linus.walleij" <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, hendychu <hendychu@aliyun.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 21, 2019 at 09:35:26PM +0800, zhuchangchun@cvte.com wrote:
>    --> I know your meaning, even though I've did following actions
>    instead of unexport,
> 
>    # echo 0 > /sys/class/gpio/gpioXX/value
>      # echo in > /sys/class/gpio/gpioXX/direction
> 
>    the padcfg0 value still can not roll back,because after export the
>    gpio,the following
> 
>    action as padcfg0 settings was done.
> 
>    Exactly  TX and RX register have been set as below in GPIO request:
> 
>    /* Disable TX buffer and enable RX (this will be input) */
> 
>    value &= ~PADCFG0_GPIORXDIS;
> 
>    value |= PADCFG0_GPIOTXDIS;
> 
>    this will infruence next reboot gpio signal.
> 
>    And could you pls see my ->free function implementation?

I checked it and you do this:

+       value |= PADCFG0_GPIORXDIS;
+       value &= ~PADCFG0_GPIOTXDIS;

which pretty much turns the pin GPIO output unconditionally. I don't
really think it is good idea. May work in your case but may cause
problems with others.

If you want to keep it as output and leave the value 1 (high) before you
issue reboot, I don't think you need to do anything via sysfs (as the
pin is already in that state and issuing reboot command should not
change anything because the driver does not have ->shutdown callback.

In other words, your peripheral expects reset GPIO to be asserted (high)
during reboot so unless the boot firmware resets the pin I don't see why
leaving it as is does not work for you.
