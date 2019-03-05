From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/3] x86: apuv2: remove unused variable
Date: Tue, 5 Mar 2019 15:47:05 +0200
Message-ID: <CAHp75Vf_H8_++QtwPhGAyjnPE1hriU-85_WnmP6PO6D8uM9H5g@mail.gmail.com>
References: <20190304201930.1622839-1-arnd@arndb.de> <25276a71-2d50-0039-226c-3066a3767c0d@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <25276a71-2d50-0039-226c-3066a3767c0d@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Arnd Bergmann <arnd@arndb.de>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 5, 2019 at 2:04 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 04.03.19 21:19, Arnd Bergmann wrote:
>
> > diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> > index dcb084f6b892..c1ca931e1fab 100644
> > --- a/drivers/platform/x86/pcengines-apuv2.c
> > +++ b/drivers/platform/x86/pcengines-apuv2.c
> > @@ -208,7 +208,6 @@ static struct platform_device * __init apu_create_pdev(
> >
> >  static int __init apu_board_init(void)
> >  {
> > -     int rc;
> >       const struct dmi_system_id *id;
> >
> >       id = dmi_first_match(apu_gpio_dmi_table);
> >
>
> ACK.
>
> Reviewed-By: Enrico Weigelt, metux IT consult <info@metux.net>

Patches from here presumably should go to v5.1-rc1 or, if Linus would
do it, through his tree.

Linus, I'm fine with what Randy and Arnd sent for fixing this driver.

>
>
> thx
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287



-- 
With Best Regards,
Andy Shevchenko
