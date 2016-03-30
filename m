From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: Re: [PATCH v2 1/6] pinctrl: baytrail: Add pin control data structures
Date: Wed, 30 Mar 2016 14:33:39 +0300
Message-ID: <56FBB993.9030905@intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
 <1459171780-24856-2-git-send-email-cristina.ciocan@intel.com>
 <20160330111501.GS2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11674 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751425AbcC3LaZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 30 Mar 2016 07:30:25 -0400
In-Reply-To: <20160330111501.GS2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com

On 30.03.2016 14:15, Mika Westerberg wrote:
> On Mon, Mar 28, 2016 at 04:29:35PM +0300, Cristina Ciocan wrote:
>> +/* SCORE pins */
>> +static const struct pinctrl_pin_desc byt_score_pins[] = {
>> +	PINCTRL_PIN(0, "SATA_GP[0]"),		/* GPIOC_0 */
>> +	PINCTRL_PIN(1, "SATA_GP[1]"),		/* GPIOC_1 */
> 
> Maybe we should call these "SATA_GP0" and "SATA_GP1" like we do in other
> Intel pinctrl drivers?

The names are directly taken form the public datasheet found at:
http://www.intel.com/content/www/us/en/embedded/products/bay-trail/atom-e3800-family-datasheet.html,
section 10.3, Ball Name and Function by Location.

I kept those names, even though they are not always pretty, so that teh
pins can be easily identified if someone searches them in the datasheet
for extra information.

> 
> Also I don't think /* GPIOC_1 */ is really useful comment as that can be
> derived already from the pin number.

The issue here is that pins are not referenced by the same name in the
datasheet. In the above mentioned section (10.3), south core pins are
GPIO_S0_SC[<pin_number>], whereas in the GPIO section (39) they are
referenced as GPIOC_<pin_number>. I added the comments for the same
reasoning as above, easy search for datasheet-driver pin matching.

If this is not an issue, I can change both names and comments.

Thank you for the review.

> 
> Otherwise this looks good.
>

