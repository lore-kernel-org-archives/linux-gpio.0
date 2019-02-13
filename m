From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: properly support runtime PM for GPIO used as interrupts
Date: Wed, 13 Feb 2019 10:37:55 +0100
Message-ID: <CACRpkdaSbcHAV=3NHYRujC7xEvVcbLJpV+k5sHdvFsRpYFsCbg@mail.gmail.com>
References: <20190208104046.21817-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208104046.21817-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 8, 2019 at 11:40 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

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

Patch applied with Shubhrajyoti's review tag.

Yours,
Linus Walleij
