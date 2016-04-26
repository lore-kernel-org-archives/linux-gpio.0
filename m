From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] pinctrl/broxton: enable platform device in the
 absent of ACPI enumeration
Date: Tue, 26 Apr 2016 14:59:26 +0300
Message-ID: <1461671966.17131.63.camel@linux.intel.com>
References: <1461650991-15185-1-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:28267 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751367AbcDZL6Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Apr 2016 07:58:25 -0400
In-Reply-To: <1461650991-15185-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, 2016-04-26 at 14:09 +0800, Tan Jui Nee wrote:
> Hi,
> The patches are to cater the need for non-ACPI system whereby
> a platform device has to be created in order to bind with
> Apollo Lake Pinctrl GPIO platform driver.
>=20
> The MMIO BAR is accessed over the Primary to Sideband bridge
> (P2SB). Since the BIOS prevents the P2SB device from being
> enumerated by the PCI subsystem, so we need to hide/unhide P2SB
> to lookup the P2SB BAR and pass the PCI BAR address to the gpio
> platform driver.
>=20
> All these three patches have dependencies on each other.
>=20

Lee, Linus, I'm fine with the series, though I doubt which solution is
better to have the original driver independent as much as possible from
p2sb.

> Changes from V1:
> 	- Add new config option CONFIG_X86_INTEL_NON_ACPI and "select
> PINCTRL"
> 	=C2=A0=C2=A0to fix kbuildbot error
>=20
> Andy Shevchenko (1):
> =C2=A0 x86/platform/p2sb: New Primary to Sideband bridge support driv=
er for
> =C2=A0=C2=A0=C2=A0=C2=A0Intel SOC's
>=20
> Tan Jui Nee (2):
> =C2=A0 pinctrl/broxton: enable platform device in the absent of ACPI
> =C2=A0=C2=A0=C2=A0=C2=A0enumeration
> =C2=A0 mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl i=
n
> =C2=A0=C2=A0=C2=A0=C2=A0non-ACPI system
>=20
> =C2=A0arch/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A014 ++++
> =C2=A0arch/x86/include/asm/p2sb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A027 +++++++
> =C2=A0arch/x86/platform/intel/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0arch/x86/platform/intel/p2sb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A099
> ++++++++++++++++++++++++
> =C2=A0drivers/mfd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A03 +-
> =C2=A0drivers/mfd/lpc_ich.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 128
> ++++++++++++++++++++++++++++++++
> =C2=A0drivers/pinctrl/intel/pinctrl-broxton.c |=C2=A0=C2=A043 +++++++=
+---
> =C2=A07 files changed, 302 insertions(+), 13 deletions(-)
> =C2=A0create mode 100644 arch/x86/include/asm/p2sb.h
> =C2=A0create mode 100644 arch/x86/platform/intel/p2sb.c
>=20

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
