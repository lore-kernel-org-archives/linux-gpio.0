From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/2] gpio: mcp23s08: add pinconf support
Date: Mon, 30 Jan 2017 17:40:56 +0100
Message-ID: <20170130164055.vuae4tesfepiwikd@earth>
References: <20170127144738.21107-1-sre@kernel.org>
 <20170127144738.21107-3-sre@kernel.org>
 <CACRpkdZyUq+v756vBhM=eu1i3ccsOrkMkEJObrt4HttmVXFkYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7gvgrintceai6wpm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:35842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752345AbdA3QlG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Jan 2017 11:41:06 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZyUq+v756vBhM=eu1i3ccsOrkMkEJObrt4HttmVXFkYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--7gvgrintceai6wpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Jan 30, 2017 at 04:08:01PM +0100, Linus Walleij wrote:
> On Fri, Jan 27, 2017 at 3:47 PM, Sebastian Reichel <sre@kernel.org> wrote:
>=20
> > mcp23xxx device have configurable 100k pullup resistors. This adds
> > support for enabling them using pinctrl's pinconf interface.
> >
> > Signed-off-by: Sebastian Reichel <sre@kernel.org>
>=20
> That's the right approach!
>
> > diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
>=20
> Can we move the patch to drivers/pinctrl/* like all other mixed drivers
> doing combined pinctrl and GPIO?

Sure. Two questions:

 * Should the config name change to PINCTRL_MCP23s08 (or PINCTRL_MCP23XXX)?
   This will mean people will have to fix their .config
 * Should there be a "SPI or I2C GPIO expanders" sub-menu for it as in the
   gpio Kconfig?

> Also: no Kconfig changes? Surely you must select the right pinctrl
> things, I guess you're just lucky that some other pin controller on your
> system selects your infrastructure. I think that is why the build robot
> is complaining.

Yes, it should select GENERIC_PINCONF as far as I can see.

> > +static int mcp_update_cache(struct mcp23s08 *mcp)
> > +{
> > +       int ret, reg, i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(mcp->cache); i++) {
> > +               ret =3D mcp_read(mcp, i, &reg);
> > +               if (ret < 0)
> > +                       return ret;
> > +               mcp->cache[i] =3D reg;
> > +       }
> > +
> > +       return 0;
> > +}
>=20
> Why do you need a cache of register values when regmap already
> supports this?
>
> Instead I suggest: exploit the .volatile_reg() callback from
> struct regmap_config and use regmap to maintain the cache.

The mcp_update_cache method is just moved in this patch. I do not
need it, but the existing code uses it. Actually I only moved it, so
that it sticks together with the mcp_read and mcp_write functions,
which must be placed a bit earlier to be usable by the pinctrl stuff.

I did not convert the custom caching in the regmap patch, since it
should be done in its own cleanup patch. Introducing basic regmap
was much more straight forward than removing the open-coded caching.

> Apart from this is is nice!

I guess the custom platform data based pullup config could also
be removed. I just checked and there are not many users of the
platform data:

linux/arch $ git grep -l mcp23 | grep -v "/dts/"        =20
blackfin/mach-bf527/boards/tll6527m.c
blackfin/mach-bf609/boards/ezkit.c

None of them seems to use the pullups variable.

> With the recent changes from Mika Westerberg scheduled for v4.11
> the road is open to expose pullups all the way to userspace from
> GPIOs chardev if we want to (some patches would be needed).

I just added the pinctrl config to DT, but that sounds useful.

-- Sebastian

--7gvgrintceai6wpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAliPbJIACgkQ2O7X88g7
+pp+yA//ZjkoFeFXhn0E6rKZ0GzpbinrfD/m1qqyiRCD55qP8Ut5NEH5EijijuZ4
SDaFmaaZJZZy/CTH7kKlJu1VV4W+W4fI8PNXfegPZ22QeY5ENr6oJ8FH+qn4/kYO
wHtolcMDukFCZGmmA5y5xR6nxSv4QmwWRuvHiYAWn73S2f9RvXfCcTeES5U885+r
5GPND8od7CEM08CoENEjIej3v3dIMqOZ0GvUWoAz/lfPKUTnOwB61AqZ4Bo174oX
8LTf13NYqLtK9OC7jMN0Rb8B3dTivtJXp0zAqnOMxExhP8m6DLYXIbCjfxukaQg1
8oKIRnpXC0AYh5j/LAsz8sRm4nj97bIKoyn3RcHbwBMexhyDYPIwRUF/sug9lGTV
yaxU7vBdQkTcRgnLIspDxRNMchZe/MYUqSwCqryWtZenWvrQo6paw8mrpFpE0Ole
hK5eJcsKJcZ7tFki6F1mjXz/k85VyRp/RwUxYZfzC04zoPK7e43XG4DWsMR7Woqf
cSl3i2MdX8ZoSvkpRf9+AtlOuOunD8H44zcR0JX5TkM+1fFqTA9iSnnHDq/BHM3f
aEV11oFTPvj1u9xqPyfhGIBVhxD6I4OyQHj2WMnvAAnuj2TljyDxs6Qmwao5x8PD
zl1txbrPHQHuk2XypE4BH+1KsJYiP0DPdIvHJcxtz4O/x9u35fk=
=5Hll
-----END PGP SIGNATURE-----

--7gvgrintceai6wpm--
