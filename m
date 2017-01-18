From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/6] gpio: davinci: Redesign driver to accommodate
 ngpios in one gpio chip
Date: Thu, 19 Jan 2017 00:22:19 +0100
Message-ID: <CACRpkdaEx-XyMXz4WwzQ08_vhAqhA0R29wY0Cv=u9eXTiHmBvQ@mail.gmail.com>
References: <1484281215-24576-1-git-send-email-j-keerthy@ti.com> <1484281215-24576-4-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484281215-24576-4-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2017 at 5:20 AM, Keerthy <j-keerthy@ti.com> wrote:

> The Davinci GPIO driver is implemented to work with one monolithic
> Davinci GPIO platform device which may have up to Y(144) gpios.
> The Davinci GPIO driver instantiates number of GPIO chips with
> max 32 gpio pins per each during initialization and one IRQ domain.
> So, the current GPIO's  opjects structure is:
>
> <platform device> Davinci GPIO controller
>  |- <gpio0_chip0> ------|
>  ...                    |--- irq_domain (hwirq [0..143])
>  |- <gpio0_chipN> ------|
>
> Current driver creates one chip for every 32 GPIOs in a controller.
> This was a limitation earlier now there is no need for that. Hence
> redesigning the driver to create one gpio chip for all the ngpio
> in the controller.
>
> |- <gpio0_chip0> ------|--- irq_domain (hwirq [0..143]).
>
> The previous discussion on this can be found here:
> https://www.spinics.net/lists/linux-omap/msg132869.html
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied.

Yours,
Linus Walleij
