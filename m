From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v2 5/5] gpio: Add driver for Maxim MAX3191x industrial
 serializer
Date: Fri, 13 Oct 2017 09:53:06 -0700
Message-ID: <797c3efc-c466-1371-bb3e-176915f81895@caviumnetworks.com>
References: <cover.1507797496.git.lukas@wunner.de>
 <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
 <20171013111124.GA12351@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0061.outbound.protection.outlook.com ([104.47.37.61]:35392
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751057AbdJMQxL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Oct 2017 12:53:11 -0400
In-Reply-To: <20171013111124.GA12351@wunner.de>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>, Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Reid <preid@electromag.com.au>, David Daney <david.daney@cavium.com>, Iban Rodriguez <irodriguez@cemitec.com>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org

On 10/13/2017 04:11 AM, Lukas Wunner wrote:
> [cc += William Breathitt Gray, Geert Uytterhoeven, Phil Reid,
>         David Daney, Iban Rodriguez]
> 
> The drivers
> 
>         gpio-104-dio-48e.c, gpio-74x164.c, gpio-gpio-mm.c,
>         gpio-pca953x.c, gpio-thunderx.c, gpio-ws16c48.c,
>         gpio-xilinx.c
> 
> currently use an inefficient algorithm for their ->set_multiple
> callback:  They iterate over every chip (or bank or gpio pin),
> check if any bits are set in the mask for this particular chip,
> and if so, update the affected GPIOs.  If the mask is sparsely
> populated, you'll waste CPU time checking chips even though
> they're not affected by the operation at all.
> 
> Iterating over the chips is backwards, it is more efficient to
> iterate over the bits set in the mask, identify the corresponding
> chip and update its affected GPIOs.  The gpio-max3191x.c driver
> I posted yesterday contains an example for such an algorithm and
> you may want to improve your ->set_mutiple implementation accordingly:
> 
> 


Do you have any profiling results that demonstrate significant 
system-wide performance improvements by making such a change?

For the gpio-thunderx.c driver, the words in the bits/mask exactly match 
the banks, so the number of iterations doesn't change with the approach 
you suggest.

In fact, an argument could be made in the other direction.  The 
increased ICache pressure from code bloat and branch prediction misses 
resulting from extra testing of the mask bits could easily make the 
system slower using your suggestion.

Thanks,
David Daney

