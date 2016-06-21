From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband
 bridge support driver for Intel SOC's
Date: Tue, 21 Jun 2016 05:03:20 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D008244AF1@PGSMSX107.gar.corp.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
 <20160609140538.GL1791@lahna.fi.intel.com>
 <1465826071.30123.18.camel@linux.intel.com>
 <20160613142514.GA1740@lahna.fi.intel.com>
 <1465831152.30123.21.camel@linux.intel.com>
 <20160613155907.GB1740@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160613155907.GB1740@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>
List-Id: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Monday, June 13, 2016 11:59 PM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Tan, Jui Nee <jui.nee.tan@intel.com>; heikki.krogerus@linux.intel=
=2Ecom;
> tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com; x86@kernel.org;
> ptyser@xes-inc.com; lee.jones@linaro.org; linux-gpio@vger.kernel.org;
> linux-kernel@vger.kernel.org; Yong, Jonathan <jonathan.yong@intel.com=
>;
> Yu, Ong Hock <ong.hock.yu@intel.com>; Voon, Weifeng
> <weifeng.voon@intel.com>; Wan Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>
> Subject: Re: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideban=
d
> bridge support driver for Intel SOC's
>=20
> On Mon, Jun 13, 2016 at 06:19:12PM +0300, Andy Shevchenko wrote:
> > On Mon, 2016-06-13 at 17:25 +0300, Mika Westerberg wrote:
> > > On Mon, Jun 13, 2016 at 04:54:31PM +0300, Andy Shevchenko wrote:
> > > > Would work to me, though still the same question: is it possibl=
e
> > > > to avoid building it on even most of Intel platforms, since the=
re,
> > > > I assume, will be not many users of the module?
> > >
> > > Well, even if you make it configurable via Kconfig, I guess distr=
os
> > > will have to enable it in order to support as wide range of CPUs =
as
> > > possible in a single binary.
> >
> > Good point.
> >
> > Then perhaps the following we can do:
> > =A0- add a static boolean flag
> > =A0- add __init function where we check either PCI root bridge ID o=
r CPU
> > ID (I don't know which one is better, I suppose second one, though =
it
> > will require an update of arch/x86/include/asm/intel-family.h)
> > =A0- add a check into the function.
> >
> > What do you think?
>=20
> Maybe, or make it modular and use MODULE_DEVICE_TABLE(x86cpu, ...) to
> match the corresponding CPUs.
We need CONFIG_X86_INTEL_NON_ACPI Kconfig option to select CONFIG_PINCT=
RL.
This is to solve kbuidbot complaint about kernel configuration, i.e.
CONFIG_PINCTRL=3Dn. Appreciate if you could advise something on this.
