From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove self from GPIO maintainers
Date: Fri, 12 May 2017 22:00:22 +0300
Message-ID: <CAHp75Ve7zaN=AYWArxo+_uo=SA4Q1bGbm7ZgCmAx80eu5DTyzQ@mail.gmail.com>
References: <20170512170118.15373-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33605 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758513AbdELTAY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2017 15:00:24 -0400
In-Reply-To: <20170512170118.15373-1-acourbot@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 12, 2017 at 8:01 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
>
> I have not been able to dedicate time to the GPIO subsystem since quite
> some time, and I don't see the situation improving in the near future.
> Update the maintainers list to reflect this unfortunate fact.

JFYI: we have a designated reviewer typo of status.
I'm just wondering if it fits your case.

>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> ---
> Linus,
>
> I apologize for not being able to help you further (and not having done
> anything useful for way too long!). As I need to focus on other areas of
> the kernel (V4L) it is clear that I won't be able to be more active in
> the near future. If things improve I would be very happy to send a reverse
> patch someday though.
>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07a9a5906c59..946fa1a78b5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5670,7 +5670,6 @@ F:        tools/testing/selftests/gpio/
>
>  GPIO SUBSYSTEM
>  M:     Linus Walleij <linus.walleij@linaro.org>
> -M:     Alexandre Courbot <gnurou@gmail.com>
>  L:     linux-gpio@vger.kernel.org
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
>  S:     Maintained
> --
> 2.13.0.rc2.291.g57267f2277-goog
>



-- 
With Best Regards,
Andy Shevchenko
