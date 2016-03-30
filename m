From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 0/6] Add pinctrl support for Baytrail
Date: Wed, 30 Mar 2016 17:45:03 +0300
Message-ID: <20160330144503.GY2099@lahna.fi.intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:29615 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751631AbcC3OpK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 30 Mar 2016 10:45:10 -0400
Content-Disposition: inline
In-Reply-To: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: mathias.nyman@linux.intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com

On Mon, Mar 28, 2016 at 04:29:34PM +0300, Cristina Ciocan wrote:
> Add support for pin control (pin muxing and pin configuration) for Baytrail
> platform.
> 
> It follows the design in pinctrl-intel.c, but could not use the
> implementation in pinctrl-intel since there were significant differences:
> 	- gpio pin pads are not ordered
> 	- per group functions: for setting a certain mode, there are groups
> 	that need setting pins with different values; for instance, for
> 	setting USB ULPI pins to GPIO function, pin 2 (GPIO_SUS1) needs
> 	to be set to function 1, wihle all other from the group need to be
> 	set to 0
> 	- communities only need pin base and count as specific data
> 	- irq set type only clears all flags, while the actual type setting
> 	is made in the byt_irq_unmask function, which does not comply with
> 	the intel pinctrl implementation
> 
> Changes from v1:
> 	- fix reg, reg_val and byt_soc_data not used variables warnings
> 
> Cristina Ciocan (6):
>   pinctrl: baytrail: Add pin control data structures
>   pinctrl: baytrail: Add pin control operations
>   pinctrl: baytrail: Update gpio chip operations
>   pinctrl: baytrail: Update irq chip operations
>   pinctrl: baytrail: Register pin control handling
>   pinctrl: baytrail: Add debounce configuration

Apart of the pin naming I commented, this patch series finally
brings real pinctrl support to the misnamed baytrail GPIO driver which
is definitely the right thing to do :)

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
