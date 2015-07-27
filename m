From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: mpc8xxx: add support for MPC5125
Date: Mon, 27 Jul 2015 13:52:41 +0200
Message-ID: <CACRpkdbuzpX7BRyYVomrQktfYcLJ7MSezS9jRsfj0NMmZi4Ztg@mail.gmail.com>
References: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1437073704-13881-3-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36005 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbbG0Lwl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 07:52:41 -0400
Received: by obnw1 with SMTP id w1so57150568obn.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 04:52:41 -0700 (PDT)
In-Reply-To: <1437073704-13881-3-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Thu, Jul 16, 2015 at 9:08 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The gpio controller on MPC5125 is identical to the MPC5121 register
> wise, the only difference is that the lines 0..3 are input only inste=
ad
> of 28..31 on MPC5121.
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
