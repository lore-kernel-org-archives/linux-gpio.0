From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Thu, 19 Jan 2017 18:41:44 +0100
Message-ID: <20170119174144.hiw7lmvdh2tzxtd7@lukather>
References: <20161223125001.1176-1-icenowy@aosc.xyz>
 <1280f095-ab03-93f8-14d2-99d13ba1ce55@arm.com>
 <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
 <20170105224210.wfinfucbpkkd44om@lukather>
 <38fe3491-457a-f0c5-54fb-9defdcd45045@arm.com>
 <20170116163124.c5gusyd3j3goivnf@lukather>
 <87a535d3-1170-c388-ce7d-4921e69f4cab@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cb462es73x3l3jb2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWHUQPCAKGQEUVYR6FY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <87a535d3-1170-c388-ce7d-4921e69f4cab-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


--cb462es73x3l3jb2
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 09:44:37AM +0000, Andre Przywara wrote:
> Hi,
>=20
> On 16/01/17 16:31, Maxime Ripard wrote:
> > On Mon, Jan 09, 2017 at 12:16:00AM +0000, Andr=C3=A9 Przywara wrote:
> >> On 05/01/17 22:42, Maxime Ripard wrote:
> >>> On Fri, Dec 30, 2016 at 01:55:44PM +0100, Linus Walleij wrote:
> >>>> On Mon, Dec 26, 2016 at 3:33 PM, Andr=C3=A9 Przywara <andre.przywara=
@arm.com> wrote:
> >>>>
> >>>>> So while this patch technically looks correct, I was wondering if w=
e
> >>>>> should really explore the possibility of making the whole of sunxi
> >>>>> pinctrl DT controlled.
> >>>>> I brought this up a while ago, but people weren't overly enthusiast=
ic
> >>>>> about it, though their argument weren't really convincing to me[1].
> >>>>>
> >>>>> So:
> >>>>> As this "driver" here is basically a table linking GPIO bit setting=
s
> >>>>> (the actual mux value) to names and every pin we care about needs t=
o be
> >>>>> enumerated in the DT anyway, why not just add something like:
> >>>>> allwinner,pinmux =3D <4>;
> >>>>> to each pin(group) in the DT and get rid of this "driver" file here
> >>>>> entirely?
> >>>>
> >>>> I'm open to that if you can use pinctrl-single which is in the kerne=
l
> >>>> for this purpose only, and is used with both OMAPs and HiSilicon.
> >>>
> >>> I'm not open to that, and I'm getting tired of discussing it over and
> >>> over again. Andre, if you want to be convinced again, please read the
> >>> last discussion we had on this topic.
> >>
> >> As I said: It didn't convince me back then. And frankly we didn't real=
ly
> >> discuss it back then, I just refrained from entering a discussion
> >> against _two_ maintainers at this time, since my capacity on this kind
> >> of email threads is really very limited - especially for something tha=
t
> >> is a hobby to me.
> >=20
> > This is also (mostly) a hobby to me, which is exactly why I prefer to
> > work on something actually useful, rather than just discussing this
> > over and over again. Just like I don't want (myself, or anyone,
> > really, since we're all in the same boat) to have to maintain two
> > separate pinctrl drivers.
> >=20
> > We're having a documented, simple, pinctrl binding, using the generic
> > bindings now (that almost everyone else is using now, or is very close
> > to), and we can leverage as much documentation and code from that. Why
> > would we want to create and maintain a new driver with a new binding,
> > that will need to be documented again, learned by everyone, and will
> > lead only to confusion across the people who just want to have their
> > board supported?
>=20
> I agree, and thus was proposing a _slightly changed_ pinctrl driver
> which actually *reduces* the maintenance burden in the kernel.
> In the moment we need to add _both_ a pinctrl .dtsi node _and_ a kernel
> "driver" file, which is really boilerplate code plus a table.
> Also we need to make sure that both these files match.
> If a new SoC is really 99% similar to an existing one, atm we still need
> explicit kernel support if only one pin is changed (see the H5).

That's not true anymore. And while it's true that it reduces the
amount of maintainance on the kernel side and more on the DT side. And
from what you're constantly saying, the thing we can't plan on fixing
/ upgrading is the DT, while the kernel is easy to change.

Which means that if we ever want to fix a non-upgradable DT, the only
way to do that would be to add quirks fixing it in the kernel
itself. Adding more maintainance burden to the kernel.

But really, this is not up for debate. You're 4 years too late for
that for the original binding, and almost 2 years for the generic
binding.

> > I'm sorry, but this is also our jobs as maintainers to prevent all
> > these kind of issues, and to maintain consistency. Switching to one
> > binding to another breaks that consistency on many level,
>=20
> Yet we did it for the clocks. The very same argumentation that you gave
> above applies there as well (two different bindings, two sets of drivers
> in the kernel, new learnings for people, etc.)

No, this is very different. An end user just wanting to plug a dumb
device on his i2c bus will never even see how clocks are
described. This is not true for pinctrl.

And all the other arguments for the clocks have been the same than the
pinctrl driver: every driver is converging to the new binding we've
been using, the table in the kernel is easier to fix, etc.

> One difference would be that the new pinctrl binding wouldn't be
> fundamentally different to the old one, up to the point where the old
> driver could possibly use the very same DT nodes (but that would need to
> be worked out).

The story is different if you manage to keep the binding. Every
platform (but TI's) is converging to the generic bindings. Not using
them is not an option. Having a different implementation is.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--cb462es73x3l3jb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgPpUAAoJEBx+YmzsjxAgXC4P/RL7VRPGV/CV6wWVyrGeLeCk
6uREBHSRjzl8WFBI9JyXaht8o8/OBgjFOKFX/8F/qabSRJtnJ2mJSekBteaPmx2+
WAuN1EkOvqXFgaVlflepC0mQL2Vc1sNi2G+GUyWk9hhkz2CE06ql2F5Ry9mQAJrw
sbffSOJkakmSkh66lFM3dow1LyHdtD1bt4HuM17/2NRQHhUe7m12B6UEoyOV8mOQ
inoyqo7UP6KN1RIAIJtkhmykkiROg6KGuRWd3IjLQefQUPkPBlXaJaYVo/QF3VkF
pu7EZGgplEU0JXbz9ND0mA+jPWPRgBbjfmh51Y0E8DfKB82Znur+ajDKdFgOKqiJ
KkpULEfgKXzgxZEVN0Oxuk9Xz0y+RR9LiKu3FDzjtVm7EfvGnplyIbH0KMv+OQQG
oRLJOf2/W+Gn392Eh4MnOOaMtTeCrfD1zlQpG66OcV5k065uvrLusm9qvD9TTw+p
XizJF+l/jxbXFqQk22JNGFRNcJUwY7Z+ld+WLhqKn0rlNBCSw12C0GlwLZ3fTA2U
67EX6NvoSEDk+Tbf8KrQi2NTZcBha4VRq0PNlqzwQ7Z68fA0pDwbyiwhgerS0NlW
Z+CmO0mTx28RQzaDgF8utW1jU7fLDnkrSOo03hmxpoaNuT4qKvT7XODylQWHFdL6
tLy6YzZy/zmv0pJ41neG
=Yxjj
-----END PGP SIGNATURE-----

--cb462es73x3l3jb2--
