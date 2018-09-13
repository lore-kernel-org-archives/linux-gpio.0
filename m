From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: unexpected side effect of "gpiolib: override irq_enable/disable"
Date: Thu, 13 Sep 2018 10:45:28 +0200
Message-ID: <CACRpkdZ2_Pn5rWuk514g2sK8yZpY=fJeW+YfV6_oYYR-b7BVmw@mail.gmail.com>
References: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
 <f64fcb6a-172f-45e8-af8f-f1e7bae3b4d8@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f64fcb6a-172f-45e8-af8f-f1e7bae3b4d8@xs4all.nl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Hans Verkuil <hans.verkuil@cisco.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 12, 2018 at 5:30 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Can you try this patch first?
>
> Thanks!
>
>         Hans
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index efce534a269b..e09e4e439928 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1859,6 +1859,8 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gpiochip)
>         }
>         if (WARN_ON(gpiochip->irq.irq_enable))
>                 return;
> +       if (irqchip->irq_enable == gpiochip_irq_enable)
> +               return;

This or somthing like it (like keeping some cookie around to see
if we use the same irqchip) makes sense to me.

drivers/pinctrl/nomadik/* also use the same irqchip twice, and
I bet some more.

Looking forward to proper patch.

Yours,
Linus Walleij
