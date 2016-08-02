From: Jean Delvare <jdelvare@suse.de>
Subject: Re: Can't pinctrl-baytrail be a module?
Date: Tue, 2 Aug 2016 10:38:01 +0200
Message-ID: <20160802103801.765b8202@endymion>
References: <s5hwpqbh0v7.wl-tiwai@suse.de>
	<20160211125645.GU16826@lahna.fi.intel.com>
	<s5hpow3gzt3.wl-tiwai@suse.de>
	<56BC903C.9000008@linux.intel.com>
	<s5hh9hef5j2.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41889 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751640AbcHBIil (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Aug 2016 04:38:41 -0400
In-Reply-To: <s5hh9hef5j2.wl-tiwai@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Fri, 12 Feb 2016 13:59:45 +0100, Takashi Iwai wrote:
> On Thu, 11 Feb 2016 14:44:28 +0100,
> Mathias Nyman wrote:
> > 
> > On 11.02.2016 15:08, Takashi Iwai wrote:
> > > On Thu, 11 Feb 2016 13:56:45 +0100,
> > > Mika Westerberg wrote:
> > >>
> > >> +Jean and Mathias
> > >>
> > >> On Thu, Feb 11, 2016 at 01:45:16PM +0100, Takashi Iwai wrote:
> > >>> Hi,
> > >>>
> > >>> while discussing whether to enable pinctrl drivers on openSUSE distro
> > >>> kernels, I wonder why pinctrl-baytrail is built-in only.  Basically
> > >>> the forced built-in is the only reason against the enablement in
> > >>> distro kernels.
> > >>>
> > >>> The other Intel pinctrl drivers seem to be tristate.
> > >>> Any missing piece there?
> > >>
> > >> Jean sent a patch against this couple of hours ago.
> > >
> > > I noticed it right after I send my mail, too, sorry :)
> > >
> > >> I explained to him
> > >> that there is some ACPI GPIO magic happening on Baytrail-T based
> > >> machines such as Asus T100 where the GPIO driver is needed early at
> > >> boot, or something along those lines. I've CC'd Mathias Nyman the
> > >> original author who hopefully remembers this better.
> > >
> > > I know of pinctrl-cherryview is needed before others like shdci, but
> > > for Baytrail-T, it's more than that?
> > >
> > 
> > If I remember correctly the reason was that the gpio driver was supposed
> > to work with Hardware reduced ACPI events (in ACPI 5).
> > Basically ACPI telling operating system it wants an ACPI event handler run
> > when a certain gpio interrupt is triggered, and the HW reduced ACPI expects the OS gpio driver to do it.
> 
> OK, so this is an implicit dependency.  If this is the only issue, it
> sounds like the driver can be a module.
> 
> > I haven't followed up on this at all. Can't say if we have any HW reduced baytrail variants out there.
> > 
> > For Lynxpoint there was also some issue that pnpacpi reserved the IO resources before a modular gpio driver could get it,
> > I think it was fixed, might be that baytrail would face same issue.
> 
> Could you give any pointer, if you remember?

Mathias, any progress on this?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
