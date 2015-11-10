From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH] gpio: 74xx: fix a possible NULL dereference
Date: Tue, 10 Nov 2015 08:16:11 +0100
Message-ID: <20151110071611.GA21382@Red>
References: <1446738939-22320-1-git-send-email-clabbe.montjoie@gmail.com>
 <CAAVeFuJK9iLOtgdja3RxXzuosQYBGxQKYA+oQ4f2buQh8G-Kbw@mail.gmail.com>
 <CAHp75VdfzUhK1dOjxkkj_0ZCZyWFPRwvyE8CGgsUfdgj6Afe4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:33194 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452AbbKJHQQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2015 02:16:16 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VdfzUhK1dOjxkkj_0ZCZyWFPRwvyE8CGgsUfdgj6Afe4w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 09, 2015 at 04:16:16PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 9, 2015 at 2:21 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> > On Fri, Nov 6, 2015 at 12:55 AM, LABBE Corentin
> > <clabbe.montjoie@gmail.com> wrote:
> >> of_match_device could return NULL, and so cause a NULL pointer
> >> dereference later at line 132:
> >> priv->flags = (uintptr_t) of_id->data;
> >>
> >> Reported-by: coverity (CID 1324141)
> >> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> >> ---
> >>  drivers/gpio/gpio-74xx-mmio.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> >> index 6ed7c0f..4a7be0f 100644
> >> --- a/drivers/gpio/gpio-74xx-mmio.c
> >> +++ b/drivers/gpio/gpio-74xx-mmio.c
> >> @@ -120,6 +120,9 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
> >>         void __iomem *dat;
> >>         int err;
> >>
> >> +       if (!of_id)
> >> +               return -ENODEV;
> >> +
> >
> > Nit: in that case, could you also move the assignment of of_id to its
> > own line right above these added lines? It would keep things in the
> > same place
> 
> I think it's more that just a nit. +1 to move assignment.

Hello

I agree, I will send an updated patch soon.

Regards

LABBE Corentin
