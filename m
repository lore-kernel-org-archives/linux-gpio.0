From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Query about Open drain flag with active LOW
Date: Tue, 28 Mar 2017 15:08:58 +0200
Message-ID: <CACRpkda5jFraJsd5CtjQkxo_nUYLnhsfSwMfacPnJYenwCP=VA@mail.gmail.com>
References: <58D92DE0.3000907@nvidia.com> <CACRpkdYVdUyueSFsSi5SG6nfRn_s4tqfhHSkK3jhQov+9y2koA@mail.gmail.com>
 <58DA26F2.6040108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:38497 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753973AbdC1NJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 09:09:10 -0400
Received: by mail-it0-f53.google.com with SMTP id y18so17661810itc.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 06:09:09 -0700 (PDT)
In-Reply-To: <58DA26F2.6040108@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 28, 2017 at 11:03 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> I wanted to say that open drain flag should be with ACTIVE_HIGH |
> SINGLE_ENDED which is in inverted as of now.

Oh that seems correct... can you send a patch for this?

>> Else can you try to break down the problem, do you mean there is a bug
>> in inverted handling for open drain lines in gpiolib?
>
> Yes, I am suspecting the bug here with combination of ACTIVE state and
> SINGLE_ENDED flag. The logic to get OPEN DRAIN flag should be in inverted
> form.
> Else we need to decouple the ACTIVE state with SINGLE_ENDED flag to get Open
> drain or open source.
>
> If I want to say logical "1" for the open drain, it is setting pin in
> drive-0 mode. Actually, it should be in input mode so that pin state become
> HIGH.
>
> In function of_find_gpio(), it is as follows:
>
>         if (of_flags & OF_GPIO_SINGLE_ENDED) {
>                 if (of_flags & OF_GPIO_ACTIVE_LOW)
>                         *flags |= GPIO_OPEN_DRAIN;
>                 else
>                         *flags |= GPIO_OPEN_SOURCE;
>         }
>
>
> I think it should be
>         if (of_flags & OF_GPIO_SINGLE_ENDED) {
>                 if (of_flags & OF_GPIO_ACTIVE_LOW)
>                         *flags |= GPIO_OPEN_SOURCE;
>                 else
>                         *flags |= GPIO_OPEN_DRAIN;
>         }
>
>
> Similar change is needed in the dtbinding gpio header also to invert the
> ACTIVE state with open drain/source.

OK I think there are no real users of this feature yet, so it would be great if
you could send a patch, especially if you also have hardware so you can test it.

Yours,
Linus Walleij
