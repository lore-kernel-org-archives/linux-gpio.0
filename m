From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [RFC v1 3/9] gpio: davinci: use chained_irq_enter/chained_irq_exit
 API
Date: Sun, 15 Dec 2013 18:55:20 +0530
Message-ID: <52ADADC0.9060906@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com> <1385494815-15740-4-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:50112 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754402Ab3LON02 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2013 08:26:28 -0500
In-Reply-To: <1385494815-15740-4-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org
Cc: prabhakar.csengg@gmail.com, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com

On Wednesday 27 November 2013 01:10 AM, Grygorii Strashko wrote:
> It's unsafe to call IRQ chip callbacks (.irq_mask/irq_unmask/irq_ack)
> from chained IRQ handler directly. Because, Davinci GPIO block is used
> by different SoCs, which, in turn, have different Main IRQ controllers
> (Davinci - aintc, cp-intc; Keystone - arm-gic) which may introduce
> diffrent set of IRQ chip callbacks. As result, call of
> gpio_irq_handler() on Keysone will simply cause crash the system,
> because ARM-GIC implements .irq_eoi() instead of .irq_ack().
> 
> Hence, fix it by using Kernel chained_irq_enter/chained_irq_exit APIs as
> they are intended to handle exact such cases.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Queued with Linus's and Santosh's acks.

Thanks,
Sekhar
