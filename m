From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband
 bridge support driver for Intel SOC's
Date: Mon, 13 Jun 2016 16:54:31 +0300
Message-ID: <1465826071.30123.18.camel@linux.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
	 <20160609140538.GL1791@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:8412 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1423417AbcFMNxU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jun 2016 09:53:20 -0400
In-Reply-To: <20160609140538.GL1791@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Thu, 2016-06-09 at 17:05 +0300, Mika Westerberg wrote:
> On Tue, Jun 07, 2016 at 02:55:52PM +0800, Tan Jui Nee wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > There is already one and at least one more user coming which
> > require an access to Primary to Sideband bridge (P2SB) in order
> > to get IO or MMIO bar hidden by BIOS.
> > Create a driver to access P2SB for x86 devices.
> >=20
> > Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > =C2=A0arch/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14 ++++++
> > =C2=A0arch/x86/include/asm/p2sb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 27 +++++++++++
> > =C2=A0arch/x86/platform/intel/Makefile |=C2=A0=C2=A01 +
> > =C2=A0arch/x86/platform/intel/p2sb.c=C2=A0=C2=A0=C2=A0| 99
> > ++++++++++++++++++++++++++++++++++++++++
> > =C2=A04 files changed, 141 insertions(+)
> > =C2=A0create mode 100644 arch/x86/include/asm/p2sb.h
> > =C2=A0create mode 100644 arch/x86/platform/intel/p2sb.c
> >=20
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 2dc18605..589045e 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -606,6 +606,20 @@ config IOSF_MBI_DEBUG
> > =C2=A0
> > =C2=A0	=C2=A0=C2=A0If you don't require the option or are in doubt,=
 say N.
> > =C2=A0
> > +config X86_INTEL_NON_ACPI
> > +	bool "Enable support non-ACPI Intel platforms"
> > +	select PINCTRL
> > +	---help---
> > +	=C2=A0=C2=A0Select this option to enables MMIO BAR access over th=
e
> > P2SB for
> > +	=C2=A0=C2=A0non-ACPI Intel SoC platforms. This driver uses the P2=
SB
> > hide/unhide
> > +	=C2=A0=C2=A0mechanism cooperatively to pass the PCI BAR address t=
o
> > the platform
> > +	=C2=A0=C2=A0driver, currently GPIO on the following SoC products.
> > +	=C2=A0=C2=A0=C2=A0- Apollo Lake
>=20
> Why do we need Kconfig option for this?

In one of previous review I was wondering how we could not to build thi=
s
at all. I don't like this option either.

>=20
> I think better is to make P2SB available on CPUs which have one, and
> that can be detected runtime. If P2SB is not available then p2sb_bar(=
)
> returns -ENODEV.

Would work to me, though still the same question: is it possible to
avoid building it on even most of Intel platforms, since there, I
assume, will be not many users of the module?

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
