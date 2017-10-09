From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs
 dynamically
Date: Mon, 9 Oct 2017 17:17:16 -0500
Message-ID: <7ba9913d-9411-a75d-e7f0-2e9dcd71d742@ti.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
 <20170928083348.GI4630@lahna.fi.intel.com>
 <CACRpkdZVSXtj31stVo6QvQ05LN43nEVj_1BccrebbcT7Ee24-A@mail.gmail.com>
 <aabd3920-7170-3883-58a8-695d15664150@ti.com>
 <CACRpkdZe6uKqWo6hg4ROjiv4YUWyW0Upy4s6UCMH4ri3v3PF5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:61145 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754959AbdJIWRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2017 18:17:19 -0400
In-Reply-To: <CACRpkdZe6uKqWo6hg4ROjiv4YUWyW0Upy4s6UCMH4ri3v3PF5g@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Chris Gorman <chrisjohgorman@gmail.com>



On 10/09/2017 02:57 PM, Linus Walleij wrote:
> On Mon, Oct 9, 2017 at 8:10 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> At the moment it was merged there were no user of irq_base except gpio-mockup.c.
> 
> OK I feel calmer.
> 
>> And actually there are shouldn't as calling irq_create_mapping() in cycle
>> will not guarantee sequential Linux IRQ numbers allocation.
> 
> Yeah. I always felt that was bad practice.
> 
> But we should really kill off that irq_base member from gpio_chip. It looks
> dangerous to have arond.

patch posted.

-- 
regards,
-grygorii
