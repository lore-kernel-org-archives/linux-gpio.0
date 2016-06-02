From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enfore type for
 i2c_smbus_write_word_data()
Date: Thu, 02 Jun 2016 17:43:15 +0300
Message-ID: <1464878595.1767.28.camel@linux.intel.com>
References: <1464721423-10969-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <CADO9-pd60y8u7fQ-thBfpKr58t-=i2D9gyW-PWcz1_CyvgOFsA@mail.gmail.com>
	 <1464784534.1767.11.camel@linux.intel.com>
	 <CADO9-pdtfOKdAtwueg0YZ0GHnLkPwL842SXhpx+ENt+11wepPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:5329 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751175AbcFBOt0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jun 2016 10:49:26 -0400
In-Reply-To: <CADO9-pdtfOKdAtwueg0YZ0GHnLkPwL842SXhpx+ENt+11wepPA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>

On Wed, 2016-06-01 at 23:19 +0800, Yong Li wrote:
> Hi andy,
>=20
> Sorry for the confusing. I tested the patch today, using Ubuntu 1604 =
+
> gcc 5.3, the make bzImage does not output any warning messages about
> this .c file. I am wondering how you captured the warnings. It seems
> that I need the "make C=3D2" command.


It requires to explicitly enable endianess check via CF=3D parameter.

Linus, by the way do we need to go with this to stable and -rc2?

>=20
> Thanks,
> Yong
>=20
> 2016-06-01 20:35 GMT+08:00 Andy Shevchenko <andriy.shevchenko@linux.i=
n
> tel.com>:
> > On Wed, 2016-06-01 at 12:44 +0800, Yong Li wrote:
> > > Hi Andy,
> > >=20
> > > Could you let me know which build system you are using? I am usin=
g
> > > Ubuntu 1604(64 bit) to build the kernel source, but I did not fin=
d
> > > the
> > > warning.
> >=20
> > Hmm... I'm confused what exactly you are asking here. My host syste=
m
> > is
> > Debian unstable, kernel is built by it's own KBuild infrastructure.
> >=20
> > I'm pretty sure you are talking about this:
> >=20
> > https://lwn.net/Articles/205624/
> >=20
> > >=20
> > > Thanks,
> > > Yong
> > >=20
> > > 2016-06-01 3:03 GMT+08:00 Andy Shevchenko <andriy.shevchenko@linu=
x
> > > .int
> > > el.com>:
> > > > The commit 9b8e3ec34318 ("gpio: pca953x: Use correct u16 value
> > > > for
> > > > register
> > > > word write") fixed regression in pca953x_write_regs(). At the
> > > > same
> > > > time the
> > > > solution introduced a sparse warning:
> > > >=20
> > > > drivers/gpio/gpio-pca953x.c:168:39: warning: incorrect type in
> > > > argument 3 (different base types)
> > > > drivers/gpio/gpio-pca953x.c:168:39:=C2=A0=C2=A0=C2=A0=C2=A0expe=
cted unsigned short
> > > > [unsigned] [usertype] value
> > > > drivers/gpio/gpio-pca953x.c:168:39:=C2=A0=C2=A0=C2=A0=C2=A0got =
restricted __le16
> > > > [usertype] <noident>
> > > >=20
> > > > Fix the code by enforcing the type of
> > > > i2c_smbus_write_word_data()
> > > > parameter.
> > > >=20
> > > > Cc: Yong Li <sdliyong@gmail.com>
> > > > Cc: Phil Reid <preid@electromag.com.au>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.c=
o
> > > > m>
> > > > ---
> > > > =C2=A0drivers/gpio/gpio-pca953x.c | 9 ++++++---
> > > > =C2=A01 file changed, 6 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-
> > > > pca953x.c
> > > > index d8233be..21b21cd 100644
> > > > --- a/drivers/gpio/gpio-pca953x.c
> > > > +++ b/drivers/gpio/gpio-pca953x.c
> > > > @@ -163,10 +163,13 @@ static int pca953x_write_regs(struct
> > > > pca953x_chip *chip, int reg, u8 *val)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NBANK(chip), val);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (chip->chip_type) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0case PCA953X_TYPE:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0ret =3D i2c_smbus_write_word_data(chip-
> > > > > client,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0reg << 1,
> > > > cpu_to_le16(get_unaligned((u16
> > > > *)val)));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0case PCA953X_TYPE: {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0__le16 word =3D
> > > > cpu_to_le16(get_unaligned((u16
> > > > *)val));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0ret =3D i2c_smbus_write_word_data(chip-
> > > > > client, reg << 1,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(__force
> > > > u16)word);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0break;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case PCA957X_TYPE:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0ret =3D i2c_smbus_write_byte_data(chip-
> > > > > client, reg << 1,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val[0]);
> > > > --
> > > > 2.8.1
> > > >=20
> >=20
> > --
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Intel Finland Oy

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
