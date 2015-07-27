From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: mpc8xxx: handle differences between
 incarnations at a single place
Date: Mon, 27 Jul 2015 12:23:22 +0200
Message-ID: <CACRpkdY2ErUt+cp2MWLw=4OfOTBa3GeLO1G3wQ7t6dTaeA-3mg@mail.gmail.com>
References: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1437073704-13881-2-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35327 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751845AbbG0KXX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 06:23:23 -0400
Received: by obbop1 with SMTP id op1so55988606obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 03:23:22 -0700 (PDT)
In-Reply-To: <1437073704-13881-2-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Thu, Jul 16, 2015 at 9:08 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The gpio controllers that are handled by the mpc8xxx driver differ
> slightly. Up to now some differences were handled by use of
> of_device_is_compatible, others by use of struct of_device_id's data.
>
> To make this consistent and easily extendable handle the differences =
at
> a single place.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
