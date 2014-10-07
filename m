From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] mfd: remove use of gpiochip_remove() retval
Date: Tue, 7 Oct 2014 10:14:17 +0100
Message-ID: <20141007091417.GM25331@lee--X1>
References: <1412086542-1662-1-git-send-email-pramod.gurav@smartplayin.com>
 <1412086542-1662-2-git-send-email-pramod.gurav@smartplayin.com>
 <CACRpkdZVyxN+W_8s3Hvij0wu=bE-tyAFhJPVKumRvDkpUDuncA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:40810 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753194AbaJGJOX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Oct 2014 05:14:23 -0400
Received: by mail-ie0-f179.google.com with SMTP id ar1so4800897iec.24
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2014 02:14:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdZVyxN+W_8s3Hvij0wu=bE-tyAFhJPVKumRvDkpUDuncA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, 01 Oct 2014, Linus Walleij wrote:

> On Tue, Sep 30, 2014 at 4:15 PM, Pramod Gurav
> <pramod.gurav@smartplayin.com> wrote:
>=20
> > Get rid of using return value from gpiochip_remove() as it returns
> > void.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Cc: Samuel Ortiz <sameo@linux.intel.com>
> > CC: Lee Jones <lee.jones@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> >
> > Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
>=20
> Already fixed in the GPIO tree.

What does that mean?  That it doesn't need fixing here?

If this patch still needs applying it will carry more weight with your
Ack.

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
