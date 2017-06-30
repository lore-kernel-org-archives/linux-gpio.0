From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [patch 0/5] genirq: Distangle irq_request/release_resources()
 from irq_desc->lock
Date: Fri, 30 Jun 2017 14:49:37 +0100
Message-ID: <36bdf915-6741-c3a6-cfa3-75ccb3769d93@arm.com>
References: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:42602 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751840AbdF3Ntl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jun 2017 09:49:41 -0400
In-Reply-To: <20170629213334.375848050@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>

On 29/06/17 22:33, Thomas Gleixner wrote:
> The irq_request/release_resources() callbacks are a problem on RT as they
> are called under irq_desc->lock with interrupts disabled.
> 
> Aside of that calling them under irq_desc->lock is conceptually wrong and
> has a (hard to trigger and probably theoretical) issue in free_irq(). See
> patch 4/5 for a detailed explanation.
> 
> The series contains also a fix for the exynos gpio driver, which fiddles
> with the irq masking in the resource callbacks, which is bogus and
> potentially harmful.
> 
> Finally it moves the irq timings deallocation out of the spin locked region.
> 
> Thanks,
> 
> 	tglx
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c |    4 --
>  include/linux/irqdesc.h                  |    3 +
>  kernel/irq/irqdesc.c                     |    1 
>  kernel/irq/manage.c                      |   47 +++++++++++++++++++------------
>  4 files changed, 34 insertions(+), 21 deletions(-)

For the series:

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
