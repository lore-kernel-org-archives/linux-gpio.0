From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Thu, 21 Mar 2019 10:44:20 +0200
Message-ID: <20190321084420.GG3622@lahna.fi.intel.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhuchangchun <zhuchangchun@cvte.com>
Cc: andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, hendychu@aliyun.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 21, 2019 at 10:35:24AM +0800, zhuchangchun wrote:
> When we use the gpio to control some peripheral devices,and try to
> export the gpio first,then unexport the gpio, we test the signal with
> oscilloscope,and find the signal can't meet the requirements,because
> after we unexported the gpio,the gpio's register(tx and rx)value can't
> be recovered,and this will infruence the device work flow.

After you unexport GPIO it can go back to any previous mode it was. If
you need to use it as GPIO then why unexport it in the first place?

> We check the gpio's unexport code work flow, then find the gpio's free
> hook function has not been implemented, After we add pinmux_ops' free
> function to set exported gpio to recover its original value,the problem
> is fixed.

I don't think this is what ->free callback should do (assuming we decide
to implement it since we don't implement ->release either). It is
supposed to reverse effects of ->request which is what it currently does ;-)
