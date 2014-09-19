From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: Fix potentially NULL handler data passed to chained
 irqchip handler
Date: Fri, 19 Sep 2014 16:39:29 +0900
Message-ID: <CAAVeFuLxXtHwZVYnjjA+c6Whn55CL0Pk4+VY8sbsK_V0N7McDA@mail.gmail.com>
References: <1410873795-31980-1-git-send-email-jarkko.nikula@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1410873795-31980-1-git-send-email-jarkko.nikula@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 16, 2014 at 10:23 PM, Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
> There is possibility with misconfigured pins that interrupt occurs instantly
> after setting irq_set_chained_handler() in gpiochip_set_chained_irqchip().
> Now if handler gets called before irq_set_handler_data() the handler gets
> NULL handler data.
>
> Fix this by moving irq_set_handler_data() call before
> irq_set_chained_handler() in gpiochip_set_chained_irqchip().

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
