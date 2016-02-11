From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: tps65086: Add GPO driver for the TPS65086 PMIC
Date: Thu, 11 Feb 2016 09:20:43 +0000
Message-ID: <20160211092043.GF3782@x1>
References: <1454775130-15995-1-git-send-email-afd@ti.com>
 <CACRpkdZqe6gBoPMq0otn13HFx0pHGij0em1KD6BS6bNLFE_Vdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:38621 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800AbcBKJUr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 04:20:47 -0500
Received: by mail-wm0-f44.google.com with SMTP id p63so59547509wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 01:20:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdZqe6gBoPMq0otn13HFx0pHGij0em1KD6BS6bNLFE_Vdg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 10 Feb 2016, Linus Walleij wrote:

> On Sat, Feb 6, 2016 at 5:12 PM, Andrew F. Davis <afd@ti.com> wrote:
>=20
> > Add support for the TPS65086 PMIC GPOs.
> >
> > TPS65086 has four configurable GPOs that can be used for several
> > purposes. These are output only.
> >
> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > ---
> > This is the last component of the tps65086 series, other parts have
> > been taken already, this will probably need to be taken through the
> > MFD tree due to header dependencies.
>=20
> Lee: go ahead.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Very well, applied.

I also know Linus W likes dicing with death, so this is going into my
main branch.  As this is a new driver, it shouldn't be an issue;
however, it does mean that any changes you make (hopefully none)
during this cycle will also have to come through the MFD tree.

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
