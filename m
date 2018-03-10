From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/ and
 ReST
Date: Sat, 10 Mar 2018 14:29:52 +0100
Message-ID: <20180310132952.7rm3wmcr3ynrrxvf@latitude>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
 <CACRpkda=5i-j=W8+yosF9WiZRKFF=iRC-djja7MJE+k6b1xtaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vi4r2vd4bf5bnzeo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda=5i-j=W8+yosF9WiZRKFF=iRC-djja7MJE+k6b1xtaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--vi4r2vd4bf5bnzeo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 10, 2018 at 12:50:46PM +0100, Linus Walleij wrote:
> On Fri, Mar 9, 2018 at 12:40 AM, Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > The aim of this patchset is to move the GPIO subsystem's documentation
> > under Documentation/driver-api/gpio/ such that it is picked up by Sphinx
> > and compiled into HTML.
>=20
> Awesome!
>=20
> > I moved everything except for sysfs.txt, because
> > this file describes the legacy sysfs ABI, and doesn't seem to serve much
> > (non-historical) purpose anymore.
> >
> > There are still some rough edges:
> >
> > * I think the API documentation (kernel-doc) should be moved out of
> >   index.rst into more appropriate files.
> > * The headings are arguably wrong, because driver.rst, consumer.rst,
> >   etc. use the "document title" style, even though they are part of the
> >   GPIO chapter. But the resulting TOC tree is consistent, and I did not
> >   want to change almost all headings.
> > * Some of the files could use more :c:func:`...` references and general
> >   ReST polish.
> >
> > But I don't want to make this patchset too large.
>=20
> It's fine, we take it one step at a time.
>=20
> On Fri, Mar 09, 2018 at 10:41:20AM -0700, Jonathan Corbet wrote:
>=20
> > Anyway, I'm happy to take these through the docs tree or see them go via
> > GPIO; Linus, what's your preference?
>=20
> I might have some doc patches that could collide so I can take them.
>=20
> I take it there will be a v2?

Not necessarily, but if I need to rebase on a different branch, or on
future linux-next, I'll do that. (Or if some other issue is found.)

I thought that patch 8/8 currently requires commit 93db446a424c ("mtd:
nand: move raw NAND related code to the raw/ subdir"), which is in next
through Boris Brezillon's nand tree, but this isn't true. The patchset
(currently) applies to both v4.16-rc4 and next, AFAICS.


Thanks,
Jonathan Neusch=C3=A4fer

--vi4r2vd4bf5bnzeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJao93DAAoJEAgwRJqO81/bvT4P/2aQLu+d/XOm0MX2UtM4bjvF
AhpJ23O/U9XGRVaQOBByV4LZXmNd10I71KTJujpXMI8D+NrlWgC9RyTObEJhC706
l2ULk8b54Zq+yNVimLGaG/k4UE/w/rCI4VE8gBb2yGy9AUsu1RrF+1Yebiyz4GYg
SA7z7tUsZVgIvCtO66DliRYf2HrbIsJZfpq59uXvZu5QIgxARJ8JTUE8eIWJH3n9
gg5X5fd5URNZx0moDN86RWGrRY7kFNhrda8D5TCbrFT+MAP7mhNKq0PQLdKqYeod
jhDosUyaO7ja3ONIUP3P/Wj+Be76+ytnbhhhrVoFh+n1i4iARE+5B5sV+PWohbE/
9bkE3Jl+df4RWxe3Hq3qmhJkN7bibCWo4IVAIGdWXX3e1m76DUqqwo5ka2sU6SQD
xc9dBUDfCIitmr9qRd47OEml1ttiseupH1iqbctHFgQn18Wrx/48TaxUp154BKUb
T03rOYo+V8pyp3pjopvxhz9w84cAGLD+ozWhqH/MOXOs6vuCkfNNoTLiO/Y1F+VQ
wHSuGDIR2KM+/6QUdEViEL+kJ8dGAJcWONCKUwaVnzMBnjLdv3ceb4Yq9IqOgtYV
mv6yvHGcaf1SOKJzl/yKvath/cgjMa4aPzIvFhENjFrEIa1Y22ojeqKiYC+rC1/K
Rna/d5nDHrYKgp+3+NT+
=of2O
-----END PGP SIGNATURE-----

--vi4r2vd4bf5bnzeo--
