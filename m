From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH] gpio: zynq: properly support runtime PM for GPIO used as interrupts
Date: Mon, 11 Feb 2019 19:06:42 +0530
Message-ID: <CAKfKVtFu0V7GVrZJ_THHAm-gAddp37iKv=JQQaWt_C+xZJEEWw@mail.gmail.com>
References: <20190208104046.21817-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208104046.21817-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Thomas,

Thanks for the patch.

On Fri, Feb 8, 2019 at 4:13 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> The Zynq GPIO driver currently implements runtime PM by:
>
>  - Enabling runtime PM support in ->probe() and letting the runtime PM
>    reference counter drop to zero at the end of ->probe().
>
>  - Increasing the runtime PM reference counter in ->request() and
>    decreasing it in ->free().
>
> However, the latter is not sufficient: when a GPIO is used as an
> interrupt, ->request() and ->free() are not called. Due to this, the
> runtime PM counter remains to zero when the only GPIOs in use are used
> as interrupts, causing them to simply not work.
>
> To address this problem, this commit implement the
> ->irq_request_resources() and ->irq_release_resources() hooks,
> ensuring that the runtime PM counter is properly
> incremented/decremented. Since we override the default hooks, we keep
> the existing behavior by making sure they call gpiochip_reqres_irq() /
> gpiochip_relres_irq() respectively.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
