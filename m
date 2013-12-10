From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 10 Dec 2013 12:44:27 +0100
Message-ID: <20131210114427.GU16823@kw.sim.vm.gnt>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
 <20131129185606.GK16823@kw.sim.vm.gnt>
 <529C806F.4000204@einfach.org>
 <20131205165647.GM16823@kw.sim.vm.gnt>
 <52A6EA64.4040307@einfach.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vo2ArcSjcOqS/fzO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:47538 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752855Ab3LJLop (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Dec 2013 06:44:45 -0500
Content-Disposition: inline
In-Reply-To: <52A6EA64.4040307@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org


--Vo2ArcSjcOqS/fzO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2013 at 10:18:12AM +0000, Bruno Randolf wrote:
> On 12/05/2013 04:56 PM, Simon Guinot wrote:
> > Note that this base address is shared between several drivers:=20
> > watchdog/sch311x_wdt, hwmon/dme1737 and gpio/gpio-sch311x.c. The
> > same logical device (0xa) is used.
> >=20
> > Moreover some offsets against this base address are also shared.
> > For example, 0x47 is a "valid" offset for both the GPIO and the
> > watchdog drivers. I guess that the correct usage for this pin
> > depends on how the hardware is wired. Unfortunately, there is no
> > way for the drivers to guess that.
> >=20
> > Did you had the opportunity to run all this drivers together ?
>=20
> My access to the board is limited, but I had a chance to try it.
>=20
> dme1737 doesn't load because there is another resource conflict:
>=20
> # modprobe dme1737
> FATAL: Error inserting dme1737
> (/lib/modules/3.13.0-rc1-wl+/kernel/drivers/hwmon/dme1737.ko): Device
> or resource busy
>=20
> [  181.109897] ACPI Warning: 0x00000670-0x00000671 SystemIO conflicts
> with Region \_SB_.PCI0.LPCB.RNTR 1 (20130927/utaddress-251)
> [  181.109921] ACPI: If an ACPI driver is available for this device,
> you should use it instead of the native driver

You can enforce the driver loading with the kernel parameter
acpi_enforce_resources=3D{lax|no}.

>=20
> I can load and use sch311x_wdt and gpio-sch311x at the same time,
> because they reserve different memory regions:
>=20
> /proc/ioports:
>   0647-0647 : sch311x_wdt
>   064b-0650 : gpio-sch311x
>   0665-0668 : sch311x_wdt
>=20
> Only when I'd try to request GPIO 60 (offset 0x47) I obviously get a
> conflict:
>=20
> # echo 60 > /sys/class/gpio/export
> -bash: echo: write error: Device or resource busy
>=20
> [  334.776859] gpio-sch311x gpio-sch311x: Failed to request region 0x0647.
>=20
> I think this can be expected...

Yes indeed. I guess this kind of devices with common resources could
really make use of a mfd driver.

Regards,

Simon

--Vo2ArcSjcOqS/fzO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKm/psACgkQgtp0PDeOcDpCPQCeNm5+xSBrOh4Lf+cwCyhnSX2g
7QkAn1uSqcUzbOPhRs5qV/+dFIdfWeS3
=g0NF
-----END PGP SIGNATURE-----

--Vo2ArcSjcOqS/fzO--
