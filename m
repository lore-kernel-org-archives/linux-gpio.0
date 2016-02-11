From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Can't pinctrl-baytrail be a module?
Date: Thu, 11 Feb 2016 14:56:45 +0200
Message-ID: <20160211125645.GU16826@lahna.fi.intel.com>
References: <s5hwpqbh0v7.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:63336 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbcBKM4t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 11 Feb 2016 07:56:49 -0500
Content-Disposition: inline
In-Reply-To: <s5hwpqbh0v7.wl-tiwai@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, Mathias Nyman <mathias.nyman@linux.intel.com>

+Jean and Mathias

On Thu, Feb 11, 2016 at 01:45:16PM +0100, Takashi Iwai wrote:
> Hi,
> 
> while discussing whether to enable pinctrl drivers on openSUSE distro 
> kernels, I wonder why pinctrl-baytrail is built-in only.  Basically
> the forced built-in is the only reason against the enablement in
> distro kernels.
> 
> The other Intel pinctrl drivers seem to be tristate.
> Any missing piece there?

Jean sent a patch against this couple of hours ago. I explained to him
that there is some ACPI GPIO magic happening on Baytrail-T based
machines such as Asus T100 where the GPIO driver is needed early at
boot, or something along those lines. I've CC'd Mathias Nyman the
original author who hopefully remembers this better.
