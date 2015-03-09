From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] gpiolib: fix issue of gpio acpi handler
Date: Mon, 9 Mar 2015 13:14:03 +0200
Message-ID: <20150309111403.GX1758@lahna.fi.intel.com>
References: <1425654518-48935-1-git-send-email-qipeng.zha@intel.com>
 <20150309111203.GW1758@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:46521 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753790AbbCILOG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 07:14:06 -0400
Content-Disposition: inline
In-Reply-To: <20150309111203.GW1758@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com

On Mon, Mar 09, 2015 at 01:12:03PM +0200, Mika Westerberg wrote:
> On Fri, Mar 06, 2015 at 11:08:38PM +0800, qipeng.zha wrote:
> > From: "qipeng.zha" <qipeng.zha@intel.com>
> > 
> > If GPIO driver use pin mapping, need to tranlate pin number
>                                           ^^^^^^^^
> typo, should be "translate"
> 
> > between ACPI table and GPIO driver.
> > 
> > This issue is found on one platform with Cherryview gpio
> > controller, kernel is hang when executed _PS0 method of
> > one ACPI device, since without this translation, it access
> > invalid gpiodesc array.
> > 
> > Verified it works again with this patch.
> > 
> > Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
> > ---
> >  drivers/gpio/gpiolib-acpi.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > index c0929d9..661e272 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -551,6 +551,13 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
> >  		struct gpio_desc *desc;
> >  		bool found;
> >  
> > +		/*Translate ACPI gpio pin to offset in gpio driver*/
> 
> /* Comments look like this */
> 
> notice that there is space between /* and beginning of the sentence.
> 
> But this comment does not add any new information so I would just drop
> it.
> 
> Otherwise this patch seems right to me.

One more thing, though. The title of the patch should be more
descriptive. So that you get the idea what the patch is fixing when you
run "git log --oneline".
