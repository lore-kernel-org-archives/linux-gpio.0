From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: make flags mandatory for gpiod_get functions
Date: Sun, 21 Jun 2015 15:51:58 +0900
Message-ID: <CAAVeFuLAWBrEiXkLd1o3kmnR-6eDBbueHvE+=qwYs0UA=KuOxA@mail.gmail.com>
References: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36537 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752149AbbFUGwS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2015 02:52:18 -0400
Received: by obctg8 with SMTP id tg8so96697848obc.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2015 23:52:17 -0700 (PDT)
In-Reply-To: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jun 16, 2015 at 6:36 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Now that all[1] users of the gpiod_get functions are converted to mak=
e
> use of the up to now optional flags parameter, make it mandatory whic=
h
> allows to remove some cpp magic.
>
> [1] all but etraxfs-uart which is broken anyhow and I'm allowed to
>     ignore it by Jesper Nilsson :-)
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> the claim that all drivers are fixed is only true in my tree. I sent
> several patches, some of them are not in next yet.
>
> The gpiod branch in my repo[2] currently contains (in this order):
>  - several patches cherry-picked from next that introduce new users o=
f
>    gpiod_get without flags;
>  - several patches that fix gpiod_get users to make use of flags that
>    are already in next;
>  - several patches that fix gpiod_get users to make use of flags that
>    are not yet in next;
>  - this patch
>
> I loosely agreed to Linus and Alexandre to get this change into next =
as
> soon as 4.2-rc1 arrives. To assert that they have seen it before, I s=
end
> this mail. Also the remaining patches in my tree that don't make it i=
nto
> 4.2-rc1 should probably be taken before. So I plan to rebase my tree =
on
> top of 4.2-rc1 as soon as it arrives and ask Linus to pull it for nex=
t
> in the hope that it became considerably shorter by then. At least the
> first two groups above should disappear.
>
> Some of the patches in the category "not in next yet" didn't get a
> response from a maintainer. I just pinged these.
>
> I wrote a cocci-rule that finds all offending users, so I'm fairly
> confident that I caught all of them as of next-20150615.

Uwe, a big *thank you* for taking care of this and making GPIO safer
for everyone.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
