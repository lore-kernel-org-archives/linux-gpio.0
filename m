From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] bulk GPIO changes for v3.19
Date: Thu, 11 Dec 2014 11:34:44 -0800
Message-ID: <CA+55aFx2yi6sxaWt+DZh1QYaqs550Zw1PWOKn0P=0D8fRsqrKA@mail.gmail.com>
References: <CACRpkda1EPMPTzW56GcCsMnBvn=s1gnp-pHu4cHP-+P-J2q52w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:62249 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbaLKTep convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Dec 2014 14:34:45 -0500
In-Reply-To: <CACRpkda1EPMPTzW56GcCsMnBvn=s1gnp-pHu4cHP-+P-J2q52w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Dec 9, 2014 at 1:09 AM, Linus Walleij <linus.walleij@linaro.org=
> wrote:
>
> here is the bulk of GPIO changes for the v3.19 kernel series.
> The major external change is the new API to driver several GPIOs
> simultaneously, and the major internal change is that we're getting
> rid of a static array of GPIO descriptors and again moving away,
> slowly, from the global GPIO numberspace.

This does not build for me.

The gpio-mcp23s08.c driver now has a "chip.of_node" access outside of
#ifdef CONFIG_OF, resulting in

  drivers/gpio/gpio-mcp23s08.c: In function =E2=80=98mcp23s08_probe_one=
=E2=80=99:
  drivers/gpio/gpio-mcp23s08.c:658:57: error: =E2=80=98struct gpio_chip=
=E2=80=99 has
no member named =E2=80=98of_node=E2=80=99
     mcp->irq_active_high =3D of_property_read_bool(mcp->chip.of_node,

Should it be using "mcp->chip.dev->of_node" instead? Or should the
driver just depend on OF?

                        Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
