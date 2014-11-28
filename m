From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: remove const modifier from gpiod_get_direction()
Date: Fri, 28 Nov 2014 14:44:42 +0100
Message-ID: <CACRpkdZ9Hzkzk6SfLcrJTiNv5pYAjDZD3X=BSYU1BMiC-RLvHg@mail.gmail.com>
References: <5474391F.6030908@nvidia.com>
	<1416903391-12693-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:53303 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbaK1Non convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 08:44:43 -0500
Received: by mail-ie0-f172.google.com with SMTP id tr6so6051073ieb.31
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 05:44:43 -0800 (PST)
In-Reply-To: <1416903391-12693-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Nov 25, 2014 at 9:16 AM, Alexandre Courbot <acourbot@nvidia.com=
> wrote:

> Although gpiod_get_direction() can be considered side-effect free for
> consumers, its internals involve setting or clearing bits in the
> affected GPIO descriptor, for which we need to force-cast the const
> descriptor variable to non-const. This could lead to incorrect behavi=
or
> if the compiler decides to optimize here, so remove this const
> attribute. The intent is to make gpiod_get_direction() private anyway=
,
> so it does not really matter.
>
> Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v1:
> - Fixed poor grammar in commit log
> - Added Uwe's Ack

Patch applied after crying blood of the quoted-printable encoding
of this mail.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
