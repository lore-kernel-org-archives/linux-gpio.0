From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v1 3/9] gpio: davinci: use chained_irq_enter/chained_irq_exit
 API
Date: Fri, 29 Nov 2013 09:39:58 +0100
Message-ID: <CACRpkdZ_hd3eVm6Z6ZtvynxX_OXc5Fn-REjmGwgmGasoQRr=jw@mail.gmail.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
	<1385494815-15740-4-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385494815-15740-4-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 26, 2013 at 8:40 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

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

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
