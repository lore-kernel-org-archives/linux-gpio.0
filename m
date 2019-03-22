From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Fri, 22 Mar 2019 19:35:42 +0100
Message-ID: <d752cd9b-59f2-4524-e989-92bd0dba6b4f@metux.net>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com> <2019032119195575582546@cvte.com>
 <20190321120324.GI3622@lahna.fi.intel.com> <2019032120213955866649@cvte.com>
 <20190321123637.GJ3622@lahna.fi.intel.com> <2019032121342663125658@cvte.com>
 <20190321135642.GK3622@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321135642.GK3622@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "zhuchangchun@cvte.com" <zhuchangchun@cvte.com>
Cc: "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>, "linus.walleij" <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, hendychu <hendychu@aliyun.com>
List-Id: linux-gpio@vger.kernel.org

On 21.03.19 14:56, Mika Westerberg wrote:
> I checked it and you do this:> > +       value |= PADCFG0_GPIORXDIS;> +       value &=
~PADCFG0_GPIOTXDIS;> > which pretty much turns the pin GPIO output
unconditionally. I don't> really think it is good idea. May work in your
case but may cause> problems with others.
Uh, please don't do this. In some cases it could be even dangerous.

In general, I'd question whether such an gpio should be userland-
controlled in the first place. Better write a driver for it, which
also handles the reset properly.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
