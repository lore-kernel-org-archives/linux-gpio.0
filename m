From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND 1/6] mfd: lpc_ich: Convert ICH GPIOs IDs to enum
Date: Mon, 24 Feb 2014 15:40:18 +0000
Message-ID: <20140224154018.GB15847@lee--X1>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
 <1392386518-11025-2-git-send-email-vdonnefort@gmail.com>
 <CACRpkdbBJzV312o8Bk3Bf05zW2RB6N3fxr3uE7SuC7DQnaP7oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:53153 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753180AbaBXPkZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 10:40:25 -0500
Received: by mail-ee0-f54.google.com with SMTP id c41so2348713eek.27
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 07:40:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdbBJzV312o8Bk3Bf05zW2RB6N3fxr3uE7SuC7DQnaP7oA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Aaron Sierra <asierra@xes-inc.com>

On Mon, 24 Feb 2014, Linus Walleij wrote:

> On Fri, Feb 14, 2014 at 3:01 PM, Vincent Donnefort <vdonnefort@gmail.=
com> wrote:
>=20
> > All those IDs are arbitrary and so can be encapsulated into an enum=
eration.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
>=20
> OK Lee, how did we want to proceed with this? I think it's
> easiest to put all patches into one tree, this is just too little
> patches for cross-immutable branches & stuff.
>=20
> You can either take the whole lot with my ACK (hereby
> provided) or you can ACK patch 1+2 and I will put the whole
> thing into the GPIO tree.

I'll save you the trouble.

Applied, thanks.

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
