From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] gpio: lp3943: Remove redundant of_match_ptr helper
Date: Mon, 6 Jan 2014 12:15:13 +0000
Message-ID: <20140106121513.GF30156@lee--X1>
References: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
 <CACRpkdb+NQOZXD2iHco+5UoFAt0abc8teFvZV0TayxXMRUZRNw@mail.gmail.com>
 <20140106110750.GO23772@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:63328 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbaAFMPU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2014 07:15:20 -0500
Received: by mail-we0-f173.google.com with SMTP id u57so15596931wes.18
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2014 04:15:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20140106110750.GO23772@lee--X1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, 06 Jan 2014, Lee Jones wrote:

> On Thu, 02 Jan 2014, Linus Walleij wrote:
>=20
> > On Sat, Dec 21, 2013 at 11:27 AM, Sachin Kamat <sachin.kamat@linaro=
=2Eorg> wrote:
> >=20
> > > 'lp3943_gpio_of_match' is always compiled in. Hence the
> > > helper macro is not needed.
> > >
> > > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > > ---
> > >  drivers/gpio/gpio-lp3943.c |    2 +-
> >=20
> > This driver is merged into the MFD tree, you need Lee or
> > Sam to apply it.
> >=20
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Applied, thanks.

Whoops, jumped ahead of the gun there. I don't have this in my inbox.

Sachin, can you send again with Linus' Ack please?

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
