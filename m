From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Modular gpio-lynxpoint
Date: Mon, 21 Oct 2013 10:50:50 +0300
Message-ID: <5264DCDA.60508@linux.intel.com>
References: <20131019205702.4bfba569@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:45511 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752364Ab3JUHpo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 21 Oct 2013 03:45:44 -0400
In-Reply-To: <20131019205702.4bfba569@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On 10/19/2013 09:57 PM, Jean Delvare wrote:
> Hi Mathias,
>
> What is the rationale for CONFIG_GPIO_LYNXPOINT being a bool? Device
> drivers that can't be built as modules are a pain for distribution
> kernels. And I tried building gpio-lynxpoint as a module and it worked
> (although I can't run-time test it.)
>

For Lynxpoint I think it only was about competition for port respources. 
IO port ranges used for gpios were specified in ACPI tables both in the 
gpio device, and as a part of a motherboard device. Pnpacpi code 
reserved all the IO port ranges in the motherboard device before the 
gpio driver.

For Baytrail the gpio driver can handle hw reduced ACPI events,
(basically ACPI telling operating system it wants an ACPI event run
when a certain gpio interrupt is triggered, and it wants the OS gpio 
driver to do it. If this feature is used then I think it's better to 
build in the driver.

I'm not sure if there is a resource conflict anymore in the Lynxpoint 
case. Should be checked, and fix it properly on the pnpacpi side. 
Otherwise I guess Lynxpoint could be built as a module

-Mathias
