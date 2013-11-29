From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio-lynxpoint: Allow building as a module
Date: Fri, 29 Nov 2013 13:13:53 +0200
Message-ID: <20131129111353.GG2281@intel.com>
References: <20131127154606.5b6d6742@endymion.delvare>
 <CACRpkdZYxsEn=YHG9jLnggEXKoskfvijHYe2-=i2fxf23Q2N3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:4013 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751235Ab3K2LHO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 06:07:14 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZYxsEn=YHG9jLnggEXKoskfvijHYe2-=i2fxf23Q2N3w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.de>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 11:27:23AM +0100, Linus Walleij wrote:
> On Wed, Nov 27, 2013 at 3:46 PM, Jean Delvare <jdelvare@suse.de> wrote:
> 
> > Change CONFIG_GPIO_LYNXPOINT from bool to tristate so that the
> > gpio-lynxpoint driver can be built as a module.
> >
> > Add the required glue: an exit function to unregister the driver, and
> > module information.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> 
> Hm I think Mika is working on this driver now, Mika can you have
> a look at this patch?

I don't have any objections in merging this patch. It looks good and I
can't remember any reasons why it can't be compiled as a module :)

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
