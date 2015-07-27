From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock
Date: Mon, 27 Jul 2015 14:42:54 +0200
Message-ID: <CACRpkdaWmv9o4Yvc_zH_3_r1dg2oq3tNiFKbc3mMNGp4U1wehQ@mail.gmail.com>
References: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34278 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbbG0Mmz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:42:55 -0400
Received: by obre1 with SMTP id e1so58368326obr.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:42:54 -0700 (PDT)
In-Reply-To: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 21, 2015 at 3:54 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> mpc8xxx_gpio_chip.lock needs to be a real spinlock in preempt-rt.
> Especially the interrupt related functions can not be converted to a
> sleeping lock.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Uwe, can you have a look at this patch?

Yours,
Linus Walleij
