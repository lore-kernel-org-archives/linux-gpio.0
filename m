From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: Re: [PATCH v3 1/6] pinctrl: baytrail: Add pin control data structures
Date: Fri, 1 Apr 2016 13:44:22 +0300
Message-ID: <56FE5106.6010607@intel.com>
References: <1459350335-15192-1-git-send-email-cristina.ciocan@intel.com>
 <1459350335-15192-2-git-send-email-cristina.ciocan@intel.com>
 <20160331080434.GE2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:53554 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751902AbcDAKlE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 1 Apr 2016 06:41:04 -0400
In-Reply-To: <20160331080434.GE2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com

On 31.03.2016 11:04, Mika Westerberg wrote:
> On Wed, Mar 30, 2016 at 06:05:30PM +0300, Cristina Ciocan wrote:
>> +	PINCTRL_PIN(55, "GPIO_S0_SC[055]"),
>> +	PINCTRL_PIN(56, "GPIO_S0_SC[056]"),
>> +	PINCTRL_PIN(57, "GPIO_S0_SC[057]"),
>> +	PINCTRL_PIN(58, "GPIO_S0_SC[058]"),
>> +	PINCTRL_PIN(59, "GPIO_S0_SC[059]"),
>> +	PINCTRL_PIN(60, "GPIO_S0_SC[060]"),
>> +	PINCTRL_PIN(61, "GPIO_S0_SC[061]"),
> 
> You still have these (and all similar [number]) things. IMO this looks
> better:
> 
> 	PINCTRL_PIN(55, "GPIO_S0_SC55"),
> 	PINCTRL_PIN(56, "GPIO_S0_SC56"),
> 	PINCTRL_PIN(57, "GPIO_S0_SC57"),
> 	PINCTRL_PIN(58, "GPIO_S0_SC58"),
> 	PINCTRL_PIN(59, "GPIO_S0_SC59"),
> 	PINCTRL_PIN(60, "GPIO_S0_SC60"),
> 	PINCTRL_PIN(61, "GPIO_S0_SC61"),

Will fix in a new patch set, for consistency. Thank you.

> 
> but I don't really care that much ;-)
> 
> My ack still applies to the whole series.
> 

