From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Tue, 12 Apr 2016 14:11:28 +0300
Message-ID: <1460459488.6620.92.camel@linux.intel.com>
References: <1460343044-1474-4-git-send-email-jui.nee.tan@intel.com>
	 <201604111231.JOsx2OGx%fengguang.wu@intel.com>
	 <0158A29DB680F54A88142ED28D55B1D008209DC3@PGSMSX107.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:38790 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932287AbcDLLKc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 12 Apr 2016 07:10:32 -0400
In-Reply-To: <0158A29DB680F54A88142ED28D55B1D008209DC3@PGSMSX107.gar.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Tan, Jui Nee" <jui.nee.tan@intel.com>, lkp <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>

On Tue, 2016-04-12 at 08:34 +0000, Tan, Jui Nee wrote:

> -----Original Message-----
> > From: lkp
> > Sent: Monday, April 11, 2016 12:35 PM
> > To: Tan, Jui Nee <jui.nee.tan@intel.com>
> > Cc: kbuild-all@01.org; mika.westerberg@linux.intel.com;
> > heikki.krogerus@linux.intel.com; andriy.shevchenko@linux.intel.com;
> > tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com; x86@kernel.org=
;
> > ptyser@xes-inc.com; lee.jones@linaro.org; linux-gpio@vger.kernel.or=
g
> > ;
> > linux-kernel@vger.kernel.org; Tan, Jui Nee <jui.nee.tan@intel.com>;
> > Yong,
> > Jonathan <jonathan.yong@intel.com>; Yu, Ong Hock
> > <ong.hock.yu@intel.com>; Voon, Weifeng <weifeng.voon@intel.com>; Wa=
n
> > Mohamad, Wan Ahmad Zainie
> > <wan.ahmad.zainie.wan.mohamad@intel.com>
> > Subject: Re: [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo
> > Lake GPIO
> > pinctrl in non-ACPI system
> >=20
> > Hi Tan,
> >=20
> > [auto build test ERROR on tip/x86/core]
> > [also build test ERROR on v4.6-rc3 next-20160408] [if your patch is
> > applied to
> > the wrong git tree, please drop us a note to help improving the
> > system]
> >=20
> > url:=C2=A0=C2=A0=C2=A0=C2=A0https://github.com/0day-ci/linux/commit=
s/Tan-Jui-Nee/pinctrl
> > -
> > broxton-enable-platform-device-in-the-absent-of-ACPI-
> > enumeration/20160411-105542
> > config: x86_64-randconfig-n0-04111131 (attached as .config)
> > reproduce:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# save the attached=
 .config to linux build tree
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0make ARCH=3Dx86_64
> >=20
> > All error/warnings (new ones prefixed by >>):
> >=20
> > =C2=A0=C2=A0=C2=A0drivers/mfd/lpc_ich.c:204:22: error: invalid appl=
ication of
> > 'sizeof' to
> > incomplete type 'struct pinctrl_pin_desc'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pdata_size =3D sizeof(apl_pinctrl_pd=
ata),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0^
> > =C2=A0=C2=A0=C2=A0drivers/mfd/lpc_ich.c: In function 'lpc_ich_misc'=
:
> > =C2=A0=C2=A0=C2=A0drivers/mfd/lpc_ich.c:1146:4: error: invalid use =
of undefined
> > type 'struct
> > pinctrl_pin_desc'

> >=C2=A0
> Hi Andy, I will send patch v2 that looks like:
>=20
> +static int lpc_ich_misc(struct pci_dev *dev, enum lpc_chipsets
> chipset)
> +{
> ...
> +	const char *name;

This will make things worse.

> Please let me know if that isn't the right thing. Thanks.

Nope. The complain by kbuidbot apparently about specific kernel
configuration. I'm pretty sure it's about CONFIG_PINCTRL=3Dn.

I don't know the best solution here (only add select PINCTRL that sound=
s
a bit overhead to me), perhaps Lee can advise something.

Perhaps new config option is required for APL like you have

arch/x86:

config X86_INTEL_NON_ACPI
=C2=A0bool "enable support non-ACPI Intel platforms"
=C2=A0help
=C2=A0 =E2=80=A6

mfd:
config LPC_ICH
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "Intel ICH LPC=
"
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on PCI
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on X86 && PCI
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select MFD_CORE
+ =C2=A0 =C2=A0select P2SB if X86_INTEL_NON_ACPI
+ =C2=A0 =C2=A0select PINCTRL if X86_INTEL_NON_ACPI

In the code
#ifdef X86_INTEL_NON_ACPI
#else
#endif

P.S. I don't like this either.

--=C2=A0
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
