From: "Zheng, Qi" <qi.zheng@intel.com>
Subject: RE: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Tue, 15 Mar 2016 05:17:02 +0000
Message-ID: <0DD381DBF8F68D419C32ACFCEB28EB2521D10B54@SHSMSX101.ccr.corp.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
 <20160311094517.GO1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
 <20160314084457.GX1796@lahna.fi.intel.com>
 <CACRpkdbqa2zmQ4ajH6LVQLPcWXJ+hWvHNPY5-L3TeLvA=3yg-g@mail.gmail.com>
 <20160314125436.GG1793@lahna.fi.intel.com>
 <20160314130041.GH1793@lahna.fi.intel.com>
 <20160314142607.GI1793@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:26416 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753241AbcCOFRK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 01:17:10 -0400
In-Reply-To: <20160314142607.GI1793@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Westerberg, Mika" <mika.westerberg@intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


> On Mon, Mar 14, 2016 at 03:00:41PM +0200, Westerberg, Mika wrote:
> 
> > > Your set_type() is supporting edges but have all IRQs handled by 
> > > handle_simple_irq() rather than handle_edge_irq() for the edges, 
> > > which gives a more robust control flow from IRQ to ACK to calling 
> > > the handler.
> > > 
> > > Zheng/Mika: please look at how the level/edge IRQs are handled in 
> > > drivers/gpio/gpio-pl061.c where I *tried* to do things right, 
> > > switching handler in .set_type() using irq_set_handler_locked(). I 
> > > think you may need to use handle_edge_irq() for the edge IRQs and 
> > > handle_level_irq() for the level IRQs just like I do in the PL061 
> > > driver.
> > 
> > The driver is already doing that as far as I can tell (see 
> > intel_gpio_irq_type()).
> 
> I will check again if we are still missing something there.

> Maybe we can implement ->enable() that clears the status right before interrupt is unmasked? Something like below.
>
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index c0f5586218c4..b4873a4e25d5 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -648,6 +648,33 @@ static const struct gpio_chip intel_gpio_chip = {
 > 	.set = intel_gpio_set,
 > };
 >

The gpio_irq_enable callback way looks better.
I will do the test with this solution and submit it if the unit test passed (no unexpected gpio interrupt).
Thanks.
