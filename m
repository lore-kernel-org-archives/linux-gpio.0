From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH] gpiolib-acpi: add _DEP support for Acer One 10
Date: Thu, 16 Jun 2016 09:51:51 +0800
Message-ID: <1466041911.9422.11.camel@intel.com>
References: <1463368705.22433.15.camel@rzhang1-mobl4>
	 <CACRpkdZ8LhhfMWrYbZyovXS3+WiFotuhEujg1faS7WHWHxowHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:27813 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753247AbcFPBvz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 15 Jun 2016 21:51:55 -0400
In-Reply-To: <CACRpkdZ8LhhfMWrYbZyovXS3+WiFotuhEujg1faS7WHWHxowHg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-acpi <linux-acpi@intel.com>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "stace75@gmail.com" <stace75@gmail.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>

On =E4=B8=89, 2016-06-15 at 08:49 +0200, Linus Walleij wrote:
> On Mon, May 16, 2016 at 5:18 AM, Zhang, Rui <rui.zhang@intel.com>
> wrote:
>=20
> >=20
> > On Acer One 10, the ACPI battery driver can not be probed because
> > it depends on the GPIO controller as well as the I2C controller to
> > work,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Device (BATC)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Name (_HID, EisaId ("PNP0C0A") /* Control Method
> > Battery */)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Name (_DEP, Package (0x03)=C2=A0=C2=A0// _DEP: Dependencies
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0I2C1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0GPO2,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0GPO0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0})
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > The I2C dependency also exists on other platforms and has been
> > fixed by commit
> > 40e7fcb19293 ("ACPI: Add _DEP support to fix battery issue on Asus
> > T100TA"),
> > this patch resolves the GPIO dependency for Acer One 10.
> >=20
> > Link:https://bugzilla.kernel.org/show_bug.cgi?id=3D115191
> > CC: Mika Westerberg <mika.westerberg@linux.intel.com>
> > CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Tested-by: Stace A. Zacharov <stace75@gmail.com>
> > Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> Patch applied with the ACKs.
>=20
Thanks for taking the patch.

-rui

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
