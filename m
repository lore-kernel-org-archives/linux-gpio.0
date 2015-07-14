From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Documentation: gpio: consumer: describe active low property
Date: Tue, 14 Jul 2015 14:06:39 +0900
Message-ID: <CAAVeFu+5WyxaLzxVuta2JW9P5=SUPKnkiuBtu0Y7b-QLpWjBPQ@mail.gmail.com>
References: <1436026748-4452-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35370 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249AbbGNFG7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 01:06:59 -0400
Received: by obbop1 with SMTP id op1so243103309obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2015 22:06:59 -0700 (PDT)
In-Reply-To: <1436026748-4452-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Jul 5, 2015 at 1:19 AM, Dirk Behme <dirk.behme@gmail.com> wrote:
> I've been searching for any documentation of 'the active-low property of a GPIO'
> already mentioned in this documenation. But couldn't find any. Add it.
>
> Sigend-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
>  Documentation/gpio/consumer.txt | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 75542b9..f1a6e20 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -236,6 +236,32 @@ The active-low state of a GPIO can also be queried using the following call:
>  Note that these functions should only be used with great moderation ; a driver
>  should not have to care about the physical line level.
>
> +The active-low property
> +-----------------------
> +
> +As a driver should not have to care about the physical line level, all of the
> +gpiod_set_xxx_value_xxx() functions do take the active-low property into account.
> +This does mean that they check whether the GPIO is configured to be active-low. And
> +if so, they manipulate the passed value before the physical line level is driven.

This would be "all of the gpiod_set_value_xxx() functions, since
gpiod_set_raw_value_xxx() ignores the active-low setting.

I think it would also be worth to explain that the set_raw/get_raw
functions should be avoided as much as possible, especially by drivers
which should not care about the actual physical line level and worry
about the logical value instead.

> +
> +With this, all the gpiod_set_xxx_value_xxx() functions interpret the parameter
> +"value" as "active" ("1") or "inactive" ("0"). The physical line level will be
> +driven accordingly.
> +
> +As an example, if the active-low poperty for a dedicated GPIO is set, and the
> +gpiod_set_xxx_value_xxx() passes "active" ("1"), the physical line level will be
> +driven low.
> +
> +To summarize:
> +
> +Function (example)             active-low proporty  physical line
> +gpiod_set_raw_value(desc, 0);      don't care           low
> +gpiod_set_raw_value(desc, 1);      don't care           high
> +gpiod_set_value(desc, 0);              n/a              low
> +gpiod_set_value(desc, 1);              n/a              high

What is n/a here? Shouldn't it be "active high (default)"?

Once clarified,

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
