From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] sh-pfc: emev2 - Fix mangled author name
Date: Wed, 4 Feb 2015 09:54:15 +0100
Message-ID: <CACRpkdaY+fiYMt4MGQFTdyRAMXnhNj6tJQckst5ECrKREOQ6gw@mail.gmail.com>
References: <1422526376-12146-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:47089 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754268AbbBDIyQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Feb 2015 03:54:16 -0500
Received: by mail-ob0-f182.google.com with SMTP id nt9so259353obb.13
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2015 00:54:15 -0800 (PST)
In-Reply-To: <1422526376-12146-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niso@kth.se>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Thu, Jan 29, 2015 at 11:12 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 1e7d5d849cf4f0c5 ("sh-pfc: Add emev2 pinmux support")
> ---
> Looks like the original UTF-8 was interpreted as ISO-8859-1, and the
> resulting characters being converted to UTF-8 again.
>
> BTW, the same issue is present in the SoB-lines of both
> 1e7d5d849cf4f0c5 ("sh-pfc: Add emev2 pinmux support") and
> 4c9e473541c52453 ("sh-pfc: add macro to define pinmux without functio=
n")
> Perhaps they can still be fixed while squashing this in?

This is painful, your patch arrives with this header:

Content-Type: text/plain; charset=3Dy
Content-Transfer-Encoding: 8bit

When I try to apply it git am says:

$ git am --signoff geert1.patch
fatal: cannot convert from y to UTF-8

Wut? I never heard of an encoding named "y", and SMTP is
not my strongest subject anyway.

This UTF-8 business i becoming a subject for this years kernel
summit as I see the same thing with a few fellow german and
Swedish contributors appearing using our funny diacritics
=C3=85=C3=84=C3=96=C3=86=C3=98=C3=A5=C3=A4=C3=B6=C3=B8=C3=A6

Yeah well even =C3=9F at some time IIRC...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
