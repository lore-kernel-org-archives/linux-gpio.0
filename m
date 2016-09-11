From: Joachim  Eastwood <manabian@gmail.com>
Subject: Re: [PATCH 1/6] gpio: constify gpio_chip structures
Date: Sun, 11 Sep 2016 15:13:17 +0200
Message-ID: <CAGhQ9VwrKZ0wzu=PAUkkpfsnZpYwvvya4kCAFwvV+J3WtSWBaA@mail.gmail.com>
References: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr>
 <1473596082-32690-2-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1473596082-32690-2-git-send-email-Julia.Lawall@lip6.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Support Opensource <support.opensource@diasemi.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Julia,

On 11 September 2016 at 14:14, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> These structures are only used to copy into other structures, so declare
> them as const.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct gpio_chip i@p = { ... };
>
> @ok@
> identifier r.i;
> expression e;
> position p;
> @@
> e = i@p;
>
> @bad@
> position p != {r.p,ok.p};
> identifier r.i;
> struct gpio_chip e;
> @@
> e@i@p
>
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct gpio_chip i = { ... };
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/gpio/gpio-arizona.c  |    2 +-
>  drivers/gpio/gpio-bcm-kona.c |    2 +-
>  drivers/gpio/gpio-da9052.c   |    2 +-
>  drivers/gpio/gpio-da9055.c   |    2 +-
>  drivers/gpio/gpio-it87.c     |    2 +-
>  drivers/gpio/gpio-lp873x.c   |    2 +-
>  drivers/gpio/gpio-lpc18xx.c  |    2 +-
>  drivers/gpio/gpio-pisosr.c   |    2 +-
>  drivers/gpio/gpio-sch.c      |    2 +-
>  drivers/gpio/gpio-stmpe.c    |    2 +-
>  drivers/gpio/gpio-tc3589x.c  |    2 +-
>  drivers/gpio/gpio-tpic2810.c |    2 +-
>  drivers/gpio/gpio-tps65086.c |    2 +-
>  drivers/gpio/gpio-tps65218.c |    2 +-
>  drivers/gpio/gpio-tps65912.c |    2 +-
>  drivers/gpio/gpio-ts4900.c   |    2 +-
>  drivers/gpio/gpio-twl4030.c  |    2 +-
>  drivers/gpio/gpio-wm831x.c   |    2 +-
>  drivers/gpio/gpio-wm8350.c   |    2 +-
>  drivers/gpio/gpio-wm8994.c   |    2 +-
>  20 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
> index 98832c9..f12e02e 100644
> --- a/drivers/gpio/gpio-lpc18xx.c
> +++ b/drivers/gpio/gpio-lpc18xx.c
> @@ -78,7 +78,7 @@ static int lpc18xx_gpio_direction_output(struct gpio_chip *chip,
>         return lpc18xx_gpio_direction(chip, offset, true);
>  }
>
> -static struct gpio_chip lpc18xx_chip = {
> +static const struct gpio_chip lpc18xx_chip = {
>         .label                  = "lpc18xx/43xx-gpio",
>         .request                = gpiochip_generic_request,
>         .free                   = gpiochip_generic_free,

For lpc18xx:
Acked-by: Joachim Eastwood <manabian@gmail.com>


regards,
Joachim Eastwood
