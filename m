From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v8 0/7] genirq/gpio: Add driver for ThunderX and OCTEON-TX
 SoCs
Date: Fri, 18 Aug 2017 11:07:24 -0700
Message-ID: <f663518b-6330-dfc7-1c55-79b4a5de33fe@caviumnetworks.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
 <alpine.DEB.2.20.1708181123330.1929@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0053.outbound.protection.outlook.com ([104.47.37.53]:28768
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750944AbdHRSHa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Aug 2017 14:07:30 -0400
In-Reply-To: <alpine.DEB.2.20.1708181123330.1929@nanos>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, David Daney <david.daney@cavium.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/18/2017 02:24 AM, Thomas Gleixner wrote:
> On Thu, 17 Aug 2017, David Daney wrote:
> 
>> The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
>> the interrupt signal from each GPIO line being routed to a dedicated
>> MSI-X.  This interrupt routing requires that we add some custom
>> processing to the beginning of the MSI-X irqdomain hierarchy.
> 
> I merged the irq core patches into
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-gpio
> 
> This branch can be pulled into the GPIO tree to avoid pull request
> dependencies.
> 
> Thanks,
> 
> 	tglx
> 

Thanks everybody for helping me work through the challenges of preparing 
this patch set.  Touching multiple subsystems under the stewardship of 
multiple maintainers can be difficult, but I think this worked out well.

David Daney
