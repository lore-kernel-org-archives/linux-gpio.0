From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Mon, 13 Jun 2016 18:59:07 +0300
Message-ID: <20160613155907.GB1740@lahna.fi.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
 <20160609140538.GL1791@lahna.fi.intel.com>
 <1465826071.30123.18.camel@linux.intel.com>
 <20160613142514.GA1740@lahna.fi.intel.com>
 <1465831152.30123.21.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:9487 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1424479AbcFMP7d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jun 2016 11:59:33 -0400
Content-Disposition: inline
In-Reply-To: <1465831152.30123.21.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tan Jui Nee <jui.nee.tan@intel.com>, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Mon, Jun 13, 2016 at 06:19:12PM +0300, Andy Shevchenko wrote:
> On Mon, 2016-06-13 at 17:25 +0300, Mika Westerberg wrote:
> > On Mon, Jun 13, 2016 at 04:54:31PM +0300, Andy Shevchenko wrote:
> > > Would work to me, though still the same question: is it possible =
to
> > > avoid building it on even most of Intel platforms, since there, I
> > > assume, will be not many users of the module?
> >=20
> > Well, even if you make it configurable via Kconfig, I guess distros
> > will
> > have to enable it in order to support as wide range of CPUs as
> > possible
> > in a single binary.
>=20
> Good point.
>=20
> Then perhaps the following we can do:
> =A0- add a static boolean flag
> =A0- add __init function where we check either PCI root bridge ID or =
CPU
> ID (I don't know which one is better, I suppose second one, though it
> will require an update of arch/x86/include/asm/intel-family.h)
> =A0- add a check into the function.
>=20
> What do you think?

Maybe, or make it modular and use MODULE_DEVICE_TABLE(x86cpu, ...) to
match the corresponding CPUs.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
