From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 1/9] pinctrl: walk into bcm subdir unconditionally
Date: Thu, 09 Jun 2016 17:16:11 -0700
Message-ID: <87mvmtx5is.fsf@eliezer.anholt.net>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com> <1464934708-24769-2-git-send-email-kraxel@redhat.com> <CACRpkdZKii2QR2TWYZdG-cdTn2UeVDcE3d39xPffWwipHcthpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:56831 "EHLO anholt.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751514AbcFJAQQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Jun 2016 20:16:16 -0400
In-Reply-To: <CACRpkdZKii2QR2TWYZdG-cdTn2UeVDcE3d39xPffWwipHcthpg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Fri, Jun 3, 2016 at 8:18 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>> There is no ARCH_BCM on arm64, and we need pinctrl-bcm2835 for the rpi3.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  drivers/pinctrl/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>> index e4bc115..88586c0 100644
>> --- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>> @@ -35,7 +35,7 @@ obj-$(CONFIG_PINCTRL_TB10X)   += pinctrl-tb10x.o
>>  obj-$(CONFIG_PINCTRL_ST)       += pinctrl-st.o
>>  obj-$(CONFIG_PINCTRL_ZYNQ)     += pinctrl-zynq.o
>>
>> -obj-$(CONFIG_ARCH_BCM)         += bcm/
>> +obj-y                          += bcm/
>
> Looks OK to me, but would like Stephen's or Eric's ACK?

It looks like this is the only instance of filtering the directory on
CONFIG_ARCH_BCM, so regardless of the patch 4 resolution,

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXWgbLAAoJELXWKTbR/J7ogoEP/RyLlUD2hiP6R3JB6T83rtjx
PXly9Vp8asxeEeXQ80yKCoEz+uN6Ln+jWrKRxfUl+AJWOUuPFEaYr0E6SzPdCWf9
itjqppDPaqPRuAADZB56flkPhzJb0KP4KGAE2UQrxZLccJLHxVlMWCRl47Fi/Zu3
XMIDbBjuw8Giloqv7lFtQDeCtp1mU7CibybyGRiM5ou+2ogapqYCPEd0Fkv/osiA
eMbA9SoWvMa7S5bDE9vNVha7LSsqY+WGSdywAOBFglyV4BqyiiSZBdjDy9EUMKto
s4OxDclneziKE6LJorXOeIxUOe3hGlfm+J3RyzqJ/7u2RZJeM2VUmaDo26OSM+NB
3Jn7+FQPzMnLhGovKUm8fKVYpwMbZ01uOkhGRM9tF1KxF4HeKU3Ytk/uRwhoMBYa
CE/JFysZOmFZGpeQFB0LtY1F3MVFlVHBjoLDwZ+HwO9ymS8M2TCmKe0BhjHEppgj
IwyUnjVeygtAjc4pMg8Otfk0hd5LYNMnAph02/E4enWWh5MlDC50W6itoQSbRB9o
qRy6hPY7WTFbEb8vyNcY/VtS93k+Tcm22XygsxO8KRzDwmkhSYm0FQo27WtfzVuS
/pJD+bpqLSAbd2hA9LwBoXBMWngpuHV3EDZbvpm99es2OacvRuPxakJvZ3zzIldf
dRwlhmLhZGaq9cnWER3v
=IiiS
-----END PGP SIGNATURE-----
--=-=-=--
