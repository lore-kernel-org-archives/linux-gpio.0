From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 3/6] pinctrl: baytrail: Update gpio chip operations
Date: Tue, 5 Apr 2016 11:48:23 +0300
Message-ID: <20160405084823.GG1727@lahna.fi.intel.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
 <1459508407-22011-4-git-send-email-cristina.ciocan@intel.com>
 <CACRpkdbyGZbzX6k2b6CSKFZmxShXQ0i1=efgX6EKAnCG1EibOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59147 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756749AbcDEIs2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 04:48:28 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbyGZbzX6k2b6CSKFZmxShXQ0i1=efgX6EKAnCG1EibOg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Cristina Ciocan <cristina.ciocan@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>

On Mon, Apr 04, 2016 at 04:08:47PM +0200, Linus Walleij wrote:
> On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
> <cristina.ciocan@intel.com> wrote:
> 
> > This patch updates the gpio chip implementation in order to interact with
> > the pin control model: the chip contains reference to SOC data and
> > pin/group/community information is retrieved through the SOC reference.
> >
> > Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
> 
> Patch applied with Mika's ACK.

Thanks!

> Cristina & Mika, can you provide feedback on a patch I sent last week:
> http://marc.info/?l=linux-gpio&m=145864063724362&w=2
> 
> This makes it possible for a GPIO driver to use native
> open drain if the hardware supports this instead of relying
> on switching the pin to input and thus expecting high impedance.

Looks like a good idea to me. Recent Intel hardware (Skylake, Broxton)
is capable of taking advantage of this. Not sure if Baytrail supports
this at hardware level, though.

> With a backing pin control driver I think that maybe we need
> a pin control back-end performing things like this on behalf
> of the GPIO driver, something like
> pinctrl_gpio_set_config(unsigned gpio, enum pin_config_param param,
> u16 argument);
> 
> So the pin controller can perform config on behalf of the
> GPIO driver (e.g. setting a backing pin to open drain).
> 
> Do you think we will need this?

If I understand this right, GPIO part of the pinctrl driver just calls
pinctrl_gpio_set_config() with correct parameters in its
->set_single_ended() to get the pin to the right mode. So yes, I think
we could use it, at least from Intel pinctrl/GPIO drivers perspective :)
