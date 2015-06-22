From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpio: altera: fix return value of altera_gpio_remove()
Date: Mon, 22 Jun 2015 11:25:34 +0900
Message-ID: <CAAVeFuJ1e9thoLwMFig3iRaRgrSg2_xQ6_FGkFWumnpL9CJk0g@mail.gmail.com>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
 <1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
 <CAAVeFuJoeN4O6Cc1Wsm+Ev+K6sT0PqNq1QtX-ZQp1ePGVUbiPA@mail.gmail.com> <1434936985.20199.8.camel@ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434936985.20199.8.camel@ubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 22, 2015 at 10:36 AM, Tien Hock Loh <thloh@altera.com> wrote:
> Sorry I was away from my mail for the past few weeks.
> This isn't intentional, should be a bug I overlook. The fix is correct.

Interestingly that has never been caught by reviewers despite 10
respins of your series!

Thanks for confirming.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

>
> On Sun, 2015-06-21 at 16:25 +0900, Alexandre Courbot wrote:
>> On Wed, Jun 17, 2015 at 8:59 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>> > The remove callback never succeeds, which seems odd.
>> >
>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> > ---
>> >
>> > I wonder why nobody has pointed this out before me.
>> > I am suspecting -EIO might be intentional.
>> > I hope some Altera guys will give me comments.
>> >
>> >
>> >  drivers/gpio/gpio-altera.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
>> > index c653c83..5861550 100644
>> > --- a/drivers/gpio/gpio-altera.c
>> > +++ b/drivers/gpio/gpio-altera.c
>> > @@ -339,7 +339,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
>> >
>> >         of_mm_gpiochip_remove(&altera_gc->mmchip);
>> >
>> > -       return -EIO;
>> > +       return 0;
>>
>> That looks weird indeed. Tien, can you comment on this?
>
