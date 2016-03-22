From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 17:58:09 +0200
Message-ID: <1458662289.5907.1.camel@linux.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
	 <20160322152218.GA2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:35889 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752168AbcCVP5S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Mar 2016 11:57:18 -0400
In-Reply-To: <20160322152218.GA2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, 2016-03-22 at 17:22 +0200, Mika Westerberg wrote:
> On Tue, Mar 22, 2016 at 11:09:51AM -0400, Martin Langhoff wrote:
> >=20
> > =C2=A0=C2=A0=C2=A0Hi pinctrl_cherryview maintainers.
> > =C2=A0=C2=A0=C2=A0I unsuspectingly bought a laptop for a family mem=
ber which hits
> > trouble
> > =C2=A0=C2=A0=C2=A0with pinctrl_cherryview; it only boots with the m=
odule
> > blacklisted or
> > =C2=A0=C2=A0=C2=A0acpi=3Doff .
> > =C2=A0=C2=A0=C2=A0System is (trying) to run Fedora 23 -- made more =
difficult by
> > recent
> > =C2=A0=C2=A0=C2=A0Fedora kernels having the module built-in.
> > =C2=A0=C2=A0=C2=A0Are there any useful debugging steps I can follow=
 to narrow this
> > down?
> > =C2=A0=C2=A0=C2=A0Already tried the acpi diagnostics steps (acpi=3D=
ht, etc) to no
> > avail.
> > =C2=A0=C2=A0=C2=A0thank you!
> I think this is a known issue.
>=20
> Please disable dw_dmac from your .config (or blacklist the module):
>=20
> =C2=A0 CONFIG_DW_DMAC_CORE=3Dn
> =C2=A0 CONFIG_DW_DMAC=3Dn
>=20
> You can also enable pinctrl-cherryview.c.
>=20
> Andy (Cc'd) is working a fix for this DMA hang issue.

The issue Mika pointed out is described in the kernel bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=3D101271

However it might be not the same issue.


--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
