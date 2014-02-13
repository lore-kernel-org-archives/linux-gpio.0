From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6/6] gpio: ich: Add support for Intel Avoton
Date: Thu, 13 Feb 2014 11:12:34 +0000
Message-ID: <20140213111234.GJ32508@lee--X1>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
 <1391779267-27084-6-git-send-email-vdonnefort@lacie.com>
 <CACRpkdYBEC=C+KjZAn30wU92rRnVCFyO_5CYr_3=7GdAV2AE6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:56607 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854AbaBMLMl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2014 06:12:41 -0500
Received: by mail-we0-f182.google.com with SMTP id u57so7179550wes.41
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2014 03:12:40 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYBEC=C+KjZAn30wU92rRnVCFyO_5CYr_3=7GdAV2AE6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

> > From: Vincent Donnefort <vdonnefort@gmail.com>
> >
> > This patch adds support for Atom C2000 series (Avoton and Rangeley)=
=2E And has
> > the following options:
> >   - New addresses register.
> >   - Caching output levels (see Intel external design spec, table 48=
-29)
> >   - No hardware blink.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
>=20
> I need patches 1+2 to be merged first for this to work (apart from
> that it's OK).
>=20
> Can you try to obtain ACKs from Lee or Sam on the MFD portions?

I have no idea where these are.

Vincent, when you send patch-sets it makes the patches much easier to
track if they are shallow-threaded.

Please see git send-email options:
  `--[no-]thread`

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
