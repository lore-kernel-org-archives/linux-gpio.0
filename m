From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/gpiolib.c:Fixing style issues in gpiolib.c
Date: Wed, 7 Dec 2016 16:07:43 +0100
Message-ID: <CACRpkdZeytQDraQHjp_EB-Og-9RY7pEdzw+0vi5k_UO9Jw7t=g@mail.gmail.com>
References: <1480938325-4113-1-git-send-email-mukesh.k4@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:33235 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751884AbcLGPHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2016 10:07:44 -0500
Received: by mail-qk0-f171.google.com with SMTP id x190so416296531qkb.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2016 07:07:44 -0800 (PST)
In-Reply-To: <1480938325-4113-1-git-send-email-mukesh.k4@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mukesh Kaushik <mukesh.k4@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, vidushi.koul@samsung.com

On Mon, Dec 5, 2016 at 12:45 PM, Mukesh Kaushik <mukesh.k4@samsung.com> wrote:

> Fixing the following checkpatch.pl error:
>
> ERROR: else should follow close brace '}'
> +       }
> +       else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
>
> ERROR: space prohibited after that open parenthesis '('
> +       if ( !desc->gdev->chip ) { \
>
> ERROR: space prohibited before that close parenthesis ')'
> +       if ( !desc->gdev->chip ) { \
>
> and following warnings :
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
>
> WARNING: else is not generally useful after a break or return
> +                       break;
> +               else
>
> Change-Id: I9164832686efb8db1f6d365f89f278e998104f81

Gerrit? We don't need this.

> Signed-off-by: Mukesh Kaushik <mukesh.k4@samsung.com>

This does not apply to my devel branch.

Please rebase on devel or v4.9 final whatever comes first
and resend.

Yours,
Linus Walleij
