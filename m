From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] gpiolib: Fix return value of gpio_to_desc() stub if !GPIOLIB
Date: Thu, 6 Dec 2018 12:59:20 +0100
Message-ID: <CAJKOXPe9==fqWE5LaofpgRcFJmCx2Wxb=YP3i65eLe2Kr3VEzg@mail.gmail.com>
References: <1544089549-23629-1-git-send-email-krzk@kernel.org> <CACRpkda9UAGxMrP27qYe-ZC=3RehesAPsUAnt71Jx5Dd+rpSqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CACRpkda9UAGxMrP27qYe-ZC=3RehesAPsUAnt71Jx5Dd+rpSqQ@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: dmitry.torokhov@gmail.com, bgolaszewski@baylibre.com, geert+renesas@glider.be, jmkrzyszt@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, 6 Dec 2018 at 12:55, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Dec 6, 2018 at 10:45 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > If CONFIG_GPOILIB is not set, the stub of gpio_to_desc() should return
> > the same type of error as regular version: NULL.  All the callers
> > compare the return value of gpio_to_desc() against NULL, so returned
> > ERR_PTR would be treated as non-error case leading to dereferencing of
> > error value.
> >
> > Fixes: 79a9becda894 ("gpiolib: export descriptor-based GPIO interface")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  include/linux/gpio/consumer.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> > index ed070512b40e..3b01fbcafc94 100644
> > --- a/include/linux/gpio/consumer.h
> > +++ b/include/linux/gpio/consumer.h
> > @@ -505,7 +505,7 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
> >
> >  static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
> >  {
> > -       return ERR_PTR(-EINVAL);
> > +       return NULL;
>
> I suppose this is consistent with comitt:
> 22c403676dbbb7c6f186099527af7f065498ef45
> "gpio: return NULL from gpiod_get_optional when GPIOLIB is disabled"
>
> So in that way it should be fine.
>
> I'm just wondering where you see this problem, because IMO
> a driver that is using GPIO should either
> depends on GPIOLIB or
> select GPIOLIB
> it is extremely uncommon for a GPIO line to actually be optional at
> compile time (as opposed to optional at runtime) so I would very
> much like to look closer at this.

No, I did not hit this error. Maybe I should mention this explicitly
that this case is rather theoretical (feel free to change the commit
msg respectively). What is however important, it misleads developers
which test for ERR_PTR, like before this fix:
2d88a331e48095cf60ad9bdf3177bd401bf99727 ("leds: leds-gpio: Fix return
value check in create_gpio_led()")

Best regards,
Krzysztof
