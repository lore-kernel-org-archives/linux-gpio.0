From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] drivers/gpio: Port gpio driver to ls1021a-qds platform
Date: Mon, 3 Aug 2015 10:07:06 +0200
Message-ID: <CACRpkdZKhjB_LkJeztnhNSmVevy3SxGSPh06fngs_sLxR-Gu7w@mail.gmail.com>
References: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34479 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770AbbHCIHH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 04:07:07 -0400
Received: by obre1 with SMTP id e1so93652222obr.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 01:07:06 -0700 (PDT)
In-Reply-To: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shaveta Leekha <shaveta@freescale.com>, Alexander Stein <alexander.stein@systec-electronic.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, r64188@freescale.com, Alexandre Courbot <gnurou@gmail.com>

Alexander Stein and Uwe Kleine-K=C3=B6nig are working on this
driver for this kernel cycle so requesting their help in
reviewing these three patches.

Alexander/Uwe: can you see the patches, or will Shaveta
need to resend them?

On Thu, Jul 30, 2015 at 9:27 AM, Shaveta Leekha <shaveta@freescale.com>=
 wrote:

> LS1021a-qds has the same ip block/controller as
> GPIO on powerpc platform(MPC8XXX).
>
> So use portable i/o accessors, as in_be32/out_be32
> accessors are Power architecture specific whereas
> ioread/writebe32 are available in other architectures.
>
> GPIO controller's registers are big endian, the
> accessors ioread32be/iowrite32be matches this one
> and portable on powerpc as well on ARM.
>
> Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
> ---
> Tested on Freescale SDK 1.8, as LS1021aQDS support is not yet complet=
e in upstream

Do you mean that Freescale has synthesized this GPIO
controller on ARM LE too? In that case that is very useful
information that should go into the commit message.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
