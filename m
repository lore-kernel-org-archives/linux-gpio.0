From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
Date: Mon, 06 Feb 2017 10:41:44 +1030
Message-ID: <1486339904.7271.12.camel@aj.id.au>
References: <20170202042817.8033-1-andrew@aj.id.au>
         <CACRpkdbbXGuE2u3H0W7XLmaq1VLNnVrGCZYgCC=3_odkifvaaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-y74TOyCYvVaDU8eZr9oq"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47837 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751931AbdBFALy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Feb 2017 19:11:54 -0500
In-Reply-To: <CACRpkdbbXGuE2u3H0W7XLmaq1VLNnVrGCZYgCC=3_odkifvaaQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>


--=-y74TOyCYvVaDU8eZr9oq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2017-02-04 at 21:35 +0100, Linus Walleij wrote:
> > On Thu, Feb 2, 2017 at 5:28 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> > 1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
> > unresolved review comments[1]. Address the comments by removing the use
> > of macros from the consumer header (this patch represents the diff
> > between v2 and v3[2]).
> >=20
> > [1] https://lkml.org/lkml/2017/1/26/337
> > [2] https://lkml.org/lkml/2017/1/26/786
> >=20
> > Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Patch applied with Joel's ACK.
>=20
> Thank you for just tirelessly fixing my mistakes, I owe you one.

No worries!

Andrew
--=-y74TOyCYvVaDU8eZr9oq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYl79AAAoJEJ0dnzgO5LT5yxMQALJz2t0aMuoxyF6imtr6d9Qf
/T97921HvfOGfsjt5eLfIK2BYhXvclglzImFQJMt7sTfqSRJay4t0J6mC/fH+8Ki
mm4yqiGPPE9PXXV2D3+3XPjPrqsBYj/kWnk9pD4TnqOsTZg0OlgLrqb8CzglqJ3A
69kgTFUnhkb6aCPi8cosKkGALqVDlXzYloStiRmZxBvKvIpx76Er5bycxTE+8/1B
Cuiu5sWOlZKRto3d4KtNodOz8859gjGs2u+0Qf78hMLpGfCp2y9Ltz6HaNPWPRVV
kxIDm/500K4eJn3RJwFRyPLP7n/uU/FbnyhVjTzzWvMkINJriZREu2fwc65wyyhq
BRr5qv7C1XuEl9T3BDyj5tKz2zRP1i2kyWfpcYaEP1lZekgTz6K9Lx3Es63n7tJS
KYkbvauJlY7vVKZ17bfGyZiujbd6agk/lD3FDK7DFBNvdRgOaSw33+O/xE6Ycha4
dipPX9eEghTOevwhx+lC/CF4YM/qG+EpRL3cRZLwb1xptrxOe6WdDPDZyyQGt84i
obq6IWhUyIgyJN36CuoEvWnZJ1449ULoMyr9GO90zssMnudJwZfbdB8gbzDmptrR
ITlRczpTSLK/S2LRZEAWdFEdyG5xyk7QiECd0QHETo8e7KT0IE5wdpxzDZmrAtd8
HEgXFker/4YWMTX3EQ7B
=gM69
-----END PGP SIGNATURE-----

--=-y74TOyCYvVaDU8eZr9oq--

