From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC/PATCH] gpio/pinctrl: baytrail: move gpio driver from pinctrl
 to gpio directory
Date: Tue, 14 Oct 2014 13:35:43 +0300
Message-ID: <543CFC7F.2070607@linux.intel.com>
References: <1413227857-555-1-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:10512 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754690AbaJNKgk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 14 Oct 2014 06:36:40 -0400
In-Reply-To: <1413227857-555-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>, linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On 13.10.2014 22:17, David Cohen wrote:
> Even though GPIO module on Intel Bay Trail is able to control pin
> functionality, it's unlikely Linux kernel driver will ever support it
> since BIOS should handle all pin muxing itself.
> 
> Currently this driver does not register any pinctrl interface and
> doesn't call any pinctrl interface. It just uses on internal functions
> the 'struct pinctrl_gpio_range', which is a weak justification to not be
> under gpio directory.
> 

This discussion was held when gpio-baytrail was first submitted.
These threads explain the gpio/pinctrl-baytrail history:

http://marc.info/?l=linux-kernel&m=136981432427668&w=2
http://marc.info/?l=linux-kernel&m=137113578604763&w=2
http://marc.info/?l=linux-kernel&m=137155497023054&w=2

A proper pinctrl driver for baytrail is still not yet ruled out

-Mathias 

