From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: make of_device_ids const
Date: Tue, 7 Apr 2015 11:09:57 +0200
Message-ID: <CACRpkdbWm3TJc_oHdZccT73qUH7jwpu2Q4BR2gn2gz-tizn0wQ@mail.gmail.com>
References: <1427407231-2253-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:33968 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119AbbDGJJ6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 05:09:58 -0400
Received: by iedfl3 with SMTP id fl3so46846767ied.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 02:09:57 -0700 (PDT)
In-Reply-To: <1427407231-2253-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Fabian Frederick <fabf@skynet.be>
Cc: Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 26, 2015 at 11:00 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> of_device_ids (i.e. compatible strings and the respective data) are n=
ot
> supposed to change at runtime. All functions working with of_device_i=
ds
> provided by <linux/of.h> work with const of_device_ids. This allows t=
o
> mark all struct of_device_id below drivers/pinctrl const, too.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

I already have a patch like this from Fabian Frederick in my
devel branch.

If some instances were missed by that patch please correct these
and send a patch on top of my devel branch.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
