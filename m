From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Thu, 21 Mar 2019 14:03:24 +0200
Message-ID: <20190321120324.GI3622@lahna.fi.intel.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com>
 <2019032119195575582546@cvte.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2019032119195575582546@cvte.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "zhuchangchun@cvte.com" <zhuchangchun@cvte.com>
Cc: "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>, "linus.walleij" <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, hendychu <hendychu@aliyun.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 21, 2019 at 07:20:56PM +0800, zhuchangchun@cvte.com wrote:
>    After you unexport GPIO it can go back to any previous mode it was. If
>    you need to use it as GPIO then why unexport it in the first place?
>    --> because we need use the GPIO for device reset, we want to recover
>    the GPIO value after reset done.If we don't unexport it, then reboot
>    the
>    intel SOC(not power off), the GPIO's value will stay until the GPIO be
>    reinit.
>    I tested the GPIO signal with oscilloscope, if  power off the SOC,
>    then
>    power on, the GPIO value can recover its original value. This will
>    infruence
>    the peripheral device working condition.

If I understand correctly you have some peripheral connected to Intel
based board and one GPIO is used to reset the peripheral.

You say it works fine if you power cycle the board but it does not when
you issue 'reboot' command. Did I understood the problem correctly?
