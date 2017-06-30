From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC PATCH] pinctrl: rockchip: add irq_shutdown
Date: Thu, 29 Jun 2017 18:29:31 -0700
Message-ID: <20170630012930.GA99272@google.com>
References: <1498223019-9123-1-git-send-email-jeffy.chen@rock-chips.com>
 <20170629220532.GA54678@google.com>
 <5955A866.20308@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:36822 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751722AbdF3B3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 21:29:34 -0400
Received: by mail-pg0-f51.google.com with SMTP id u62so55864092pgb.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 18:29:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5955A866.20308@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jeffy <jeffy.chen@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, tfiga@chromium.org, heiko@sntech.de, dianders@chromium.org, linux-rockchip@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jun 30, 2017 at 09:24:54AM +0800, Jeffy Chen wrote:
> On 06/30/2017 06:05 AM, Brian Norris wrote:
> >On Fri, Jun 23, 2017 at 09:03:39PM +0800, Jeffy Chen wrote:
> >>Currently the rockchip pinctrl driver would try to enable/disable the
> >>gpio bank clk when enable/disable an irq.
> >>
> >>So when the irq core trying to shutdown an already disabled irq, it
> >>would result in unbalanced clk disable request:
> >>[   35.911955] WARNING: at drivers/clk/clk.c:680
> >>...
> >>[   37.272271] Call trace:
> >>[   37.274729] [<ffffffc0007ac270>] clk_core_disable+0x28/0x194
> >>[   37.280395] [<ffffffc0007ac6a8>] clk_disable+0x34/0x48
> >>[   37.285544] [<ffffffc0004f3bf0>] rockchip_irq_disable+0x30/0x3c
> >>[   37.291472] [<ffffffc00027a7e0>] __irq_disable+0x40/0x64
> >>[   37.296791] [<ffffffc00027a86c>] irq_shutdown+0x68/0x8c
> >>[   37.302023] [<ffffffc0002777fc>] __free_irq+0x110/0x218
> >>[   37.307254] [<ffffffc0002779a8>] free_irq+0x54/0x64
> >>[   37.312138] [<ffffffc00027ba24>] devm_irq_release+0x24/0x30
> >>
> >>Add an irq_shutdown callback, and do a sanity check for irq state to
> >>prevent that.
> >
> >IMO, this patch is completely the wrong approach. Either we:
> >
> >(a) follow the current semantics of the irqchip core handling (which
> >tglx described more or less as "no refcounting; no guarantee that
> >enable/disable are balanced") or
> >
> >(b) fix the irqchip core to provide the above guarantee
> right, since we have:
> bf22ff45 genirq: Avoid unnecessary low level irq function calls
> d829b8f genirq: Set irq masked state when initializing irq_desc
> 
> this issue should be fixed now.

Oh, I didn't notice Thomas applied those. I'll have to take a look.

Brian
