From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/6] pinctrl: baytrail: Add pin control data structures
Date: Wed, 30 Mar 2016 14:42:43 +0300
Message-ID: <20160330114243.GT2099@lahna.fi.intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
 <1459171780-24856-2-git-send-email-cristina.ciocan@intel.com>
 <20160330111501.GS2099@lahna.fi.intel.com>
 <56FBB993.9030905@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:4763 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751404AbcC3Lms (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 30 Mar 2016 07:42:48 -0400
Content-Disposition: inline
In-Reply-To: <56FBB993.9030905@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: mathias.nyman@linux.intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com

On Wed, Mar 30, 2016 at 02:33:39PM +0300, Cristina Ciocan wrote:
> On 30.03.2016 14:15, Mika Westerberg wrote:
> > On Mon, Mar 28, 2016 at 04:29:35PM +0300, Cristina Ciocan wrote:
> >> +/* SCORE pins */
> >> +static const struct pinctrl_pin_desc byt_score_pins[] = {
> >> +	PINCTRL_PIN(0, "SATA_GP[0]"),		/* GPIOC_0 */
> >> +	PINCTRL_PIN(1, "SATA_GP[1]"),		/* GPIOC_1 */
> > 
> > Maybe we should call these "SATA_GP0" and "SATA_GP1" like we do in other
> > Intel pinctrl drivers?
> 
> The names are directly taken form the public datasheet found at:
> http://www.intel.com/content/www/us/en/embedded/products/bay-trail/atom-e3800-family-datasheet.html,
> section 10.3, Ball Name and Function by Location.
> 
> I kept those names, even though they are not always pretty, so that teh
> pins can be easily identified if someone searches them in the datasheet
> for extra information.

Well, I think it is not too hard to find out that SATA_GP0 matches
SATA_GP[0] in the datasheet ;-)

> > Also I don't think /* GPIOC_1 */ is really useful comment as that can be
> > derived already from the pin number.
> 
> The issue here is that pins are not referenced by the same name in the
> datasheet. In the above mentioned section (10.3), south core pins are
> GPIO_S0_SC[<pin_number>], whereas in the GPIO section (39) they are
> referenced as GPIOC_<pin_number>. I added the comments for the same
> reasoning as above, easy search for datasheet-driver pin matching.

And the <pin_number> in both cases is the same.

> If this is not an issue, I can change both names and comments.

I'm fine either way. Just wanted to mention because other Intel pinctrl
drivers use slightly different naming.
