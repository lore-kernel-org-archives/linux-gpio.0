From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH gpio] gpio-amd8111: check ioport_map return value
Date: Wed, 7 Jan 2015 08:51:57 +0530
Message-ID: <CAEUmHyZa9o0njqStdiH_V_=4vzi1tV93b9N==QGmq9zHe-8+1g@mail.gmail.com>
References: <1419842341-22694-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:34081 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751912AbbAGDV7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jan 2015 22:21:59 -0500
Received: by mail-la0-f41.google.com with SMTP id hv19so1217704lab.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2015 19:21:58 -0800 (PST)
In-Reply-To: <1419842341-22694-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Varka Bhadram <varkab@cdac.in>

Ping ..?

On Mon, Dec 29, 2014 at 2:09 PM, Varka Bhadram <varkabhadram@gmail.com> wrote:
> ioport_map() may fail. Its safe to check the return value.
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> ---
>  drivers/gpio/gpio-amd8111.c |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> index 3c09f1a6..a0585c3 100644
> --- a/drivers/gpio/gpio-amd8111.c
> +++ b/drivers/gpio/gpio-amd8111.c
> @@ -213,6 +213,11 @@ found:
>                 goto out;
>         }
>         gp.pm = ioport_map(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
> +       if (!gp.pm) {
> +               dev_err(&pdev->dev, "Couldn't map io port into io memory\n");
> +               err = -ENOMEM;
> +               goto out;
> +       }
>         gp.pdev = pdev;
>         gp.chip.dev = &pdev->dev;
>
> --
> 1.7.9.5
>



-- 
Thanks and Regards,
Varka Bhadram.
