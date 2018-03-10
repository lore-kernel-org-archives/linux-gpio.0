From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/ and
 ReST
Date: Sat, 10 Mar 2018 12:18:41 +0100
Message-ID: <20180310111841.qarvsrm5pm43njx5@latitude>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
 <20180309104120.40244f8a@lwn.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="v6yukiwpponl6mak"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309104120.40244f8a@lwn.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org


--v6yukiwpponl6mak
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 09, 2018 at 10:41:20AM -0700, Jonathan Corbet wrote:
> On Fri,  9 Mar 2018 00:40:16 +0100
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
>=20
> > The aim of this patchset is to move the GPIO subsystem's documentation
> > under Documentation/driver-api/gpio/ such that it is picked up by Sphinx
> > and compiled into HTML. I moved everything except for sysfs.txt, because
> > this file describes the legacy sysfs ABI, and doesn't seem to serve much
> > (non-historical) purpose anymore.
> >=20
> > There are still some rough edges:
> >=20
> > * I think the API documentation (kernel-doc) should be moved out of
> >   index.rst into more appropriate files.
> > * The headings are arguably wrong, because driver.rst, consumer.rst,
> >   etc. use the "document title" style, even though they are part of the
> >   GPIO chapter. But the resulting TOC tree is consistent, and I did not
> >   want to change almost all headings.
> > * Some of the files could use more :c:func:`...` references and general
> >   ReST polish.
> >=20
> > But I don't want to make this patchset too large.
>=20
> [For future reference, if you're going to CC me on most of a patch series,
> I'd really rather get the whole thing so I don't have to go looking for
> it.]

Noted.

> From a quick look, it seems like a reasonable RST conversion to me.  I do
> wonder if sysfs.txt should just be removed, since it documents something
> we don't want people to use at this point?  Historical purposes are well
> served by the repository history.
>=20
> I'd say changing the headings is worthwhile if it produces a better
> result.

I just tried this on one file (driver.rst) and it made no difference in
the output (neither in the TOC in index.html nor in driver.html).

Thanks,
Jonathan Neusch=C3=A4fer


> OTOH I'd be wary of adding too much "polish"; we really want to
> retain the readability of the plain-text files.
>=20
> Anyway, I'm happy to take these through the docs tree or see them go via
> GPIO; Linus, what's your preference?
>=20
> Thanks,
>=20
> jon


----

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/drive=
r-api/gpio/driver.rst
index 505ee906d7d9..8eb08005be55 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -1,4 +1,3 @@
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
 GPIO Descriptor Driver Interface
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -13,7 +12,7 @@ the structures used to define a GPIO driver:
=20
=20
 Internal Representation of GPIOs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------
=20
 Inside a GPIO driver, individual GPIOs are identified by their hardware nu=
mber,
 which is a unique number between 0 and n, n being the number of GPIOs mana=
ged by
@@ -36,7 +35,7 @@ identify GPIOs in a bank of I2C GPIO expanders.
=20
=20
 Controller Drivers: gpio_chip
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+-----------------------------
=20
 In the gpiolib framework each GPIO controller is packaged as a "struct
 gpio_chip" (see linux/gpio/driver.h for its complete definition) with memb=
ers
@@ -74,7 +73,7 @@ not be required.
=20
=20
 GPIO electrical configuration
------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 GPIOs can be configured for several electrical modes of operation by using=
 the
 .set_config() callback. Currently this API supports setting debouncing and
@@ -95,7 +94,7 @@ numbers on the pin controller so they can properly cross-=
reference each other.
=20
=20
 GPIOs with debounce support
----------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Debouncing is a configuration set to a pin indicating that it is connected=
 to
 a mechanical switch or button, or similar that may bounce. Bouncing means =
the
@@ -112,7 +111,7 @@ is not configurable.
=20
=20
 GPIOs with open drain/source support
-------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Open drain (CMOS) or open collector (TTL) means the line is not actively d=
riven
 high: instead you provide the drain/collector as output, so when the trans=
istor
@@ -209,7 +208,7 @@ of actively driving the line low, it is set to input.
=20
=20
 GPIO drivers providing IRQs
----------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
 It is custom that GPIO drivers (GPIO chips) are also providing interrupts,
 most often cascaded off a parent interrupt controller, and in some special
 cases the GPIO logic is melded with a SoC's primary interrupt controller.
@@ -359,7 +358,7 @@ below exists.
=20
=20
 Locking IRQ usage
------------------
+~~~~~~~~~~~~~~~~~
 Input GPIOs can be used as IRQ signals. When this happens, a driver is req=
uested
 to mark the GPIO as being used as an IRQ::
=20
@@ -378,7 +377,7 @@ When using the gpiolib irqchip helpers, these callback =
are automatically
 assigned.
=20
 Real-Time compliance for GPIO IRQ chips
----------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Any provider of irqchips needs to be carefully tailored to support Real Ti=
me
 preemption. It is desirable that all irqchips in the GPIO subsystem keep t=
his
@@ -404,7 +403,7 @@ time-compliance:
=20
=20
 Requesting self-owned GPIO pins
--------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Sometimes it is useful to allow a GPIO chip driver to request its own GPIO
 descriptors through the gpiolib API. Using gpio_request() for this purpose

--v6yukiwpponl6mak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJao78JAAoJEAgwRJqO81/bMusQAIMcFRDepmgvu1iErTnLtRWa
q5dZfN1ufQoKPMySi9Qn81c/4b3tPuDUnkElzz5HvpqZjzlv8BhzVXWjC8HkYPO7
GIadeqXA7MpZyWG4QhL4fJCVJILqnNm3LMzXBeOBeJ9nJP2c6IOzn0P2m0jXR5Fw
D4nJEy/IlUnRlKe/90t40eTKNUmREIZ8cZC009om+PfN1IBmVNMu5JS6aIeve1Fo
yrDRhjKtyq20i8bSFCGuQ/11m6D+/gUVo6cQjmAsNAlS85JELEvRkvTTBGhV1RoJ
ingOOTdPSr4aLP+OpmpJZp1cVpOtD+FOZVmUeOEh3y5AYJQh2JrHws5FwRQAaFH7
DWgG3/wLjjePbshCdUrYjlVjt9UikoCPbEmB849gpah2Z2nga5wREY2mVMwNtqyb
bNRL77jveJgEFDBQS7Qf23wERsirZOK5wVbpveec1FZK1KfnLz0q0bERRtYmTTDC
0ZnM6rWkLgQoFxFcF9Enz3Ng9VByJHgyAcsRW2jsP5shrgWJubMfVRt4kim+zIIe
3eyrqRxW+JAhaCl9zfa1l9WJhTkyjgv9ify7uU/Ah41q/lC5zz7AIDKX+5gSIMbd
p3gbEJ8y1jcNNFcb+/9rcn88hN3ed4FNxnJxp6mXs63oUWVyOVwfGr2WyxgCE73m
aEO5kOkKMs7LApAA7icp
=XKA6
-----END PGP SIGNATURE-----

--v6yukiwpponl6mak--
