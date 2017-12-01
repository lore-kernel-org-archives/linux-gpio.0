From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v2] gpio: davinci: Assign first bank regs for unbanked
 case
Date: Fri, 1 Dec 2017 10:10:59 +0530
Message-ID: <707ccb0f-0fc5-a981-0e21-d3e43bbd96a6@ti.com>
References: <1510312397-29040-1-git-send-email-j-keerthy@ti.com>
 <CACRpkdYVzvbJR+Y-7GpA2BwqJjS6=J6zp6Pf5UVxOt0mp4nJ0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:60120 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752129AbdLAEl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 23:41:28 -0500
In-Reply-To: <CACRpkdYVzvbJR+Y-7GpA2BwqJjS6=J6zp6Pf5UVxOt0mp4nJ0A@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>



On Thursday 30 November 2017 08:12 PM, Linus Walleij wrote:
> On Fri, Nov 10, 2017 at 12:13 PM, Keerthy <j-keerthy@ti.com> wrote:
> 
>> As per the re-design assign the first bank regs for unbanked
>> irq case. This was missed out in the original patch.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> Fixes: b5cf3fd827d2e1 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
>> ---
>>
>> Changes in v2:
>>
>>   * Fixed $Author
> 
> Patch applied for fixes, sorry for eternal delay.

No issues and Thanks!

> 
> Keerthy, if you work on DaVinci, would you mind looking quickly at this
> patch:
> https://marc.info/?l=linux-input&m=151151651401442&w=2

Sure. I will get back on this.

> 
> Yours,
> Linus Walleij
> 
