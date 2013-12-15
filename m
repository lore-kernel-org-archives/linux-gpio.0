From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v7] gpio: davinci: use {readl|writel}_relaxed() instead
 of __raw_*
Date: Sun, 15 Dec 2013 17:05:46 +0530
Message-ID: <52AD9412.1010508@ti.com>
References: <1386784327-22164-1-git-send-email-prabhakar.csengg@gmail.com> <CACRpkdZSyiA1zF3VcGrT+2yu3X5=eoon=0rqr7UejY4kjf7jNw@mail.gmail.com> <CA+V-a8sFpMJce19o9USBFzG2qnxtUrfdLVKPi8em6RnYA5Tfuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:34588 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753943Ab3LOLg4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 15 Dec 2013 06:36:56 -0500
In-Reply-To: <CA+V-a8sFpMJce19o9USBFzG2qnxtUrfdLVKPi8em6RnYA5Tfuw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Taras Kondratiuk <taras.kondratiuk@linaro.org>

On Friday 13 December 2013 09:34 AM, Prabhakar Lad wrote:
> Hi Linus,
> 
> On Fri, Dec 13, 2013 at 2:01 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Dec 11, 2013 at 6:52 PM, Prabhakar Lad
>> <prabhakar.csengg@gmail.com> wrote:
>>
>>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>>>
>>> This patch replaces the __raw_readl/writel with
>>> {readl|writel}_relaxed(), Altough the code runs on ARMv5
>>> based SOCs, changing this will help copying the code

s/copying/using

>>> for other uses.

Call out usability on big-endian machines specifically here.

>>>
>>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>>> ---
>>>  This patch is part of series [1] rest of the patches
>>>  are Acked/reviewed so posting this patch independently
>>>  and marking it as v7.
>>>
>>>  [1] http://www.spinics.net/lists/devicetree/msg13037.html
>>>
>>>  drivers/gpio/gpio-davinci.c |   36 ++++++++++++++++++------------------
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>
> Thanks for the Ack.
> 
>> Should I take this into the GPIO tree, or should it go
>> in through the DaVinci tree?
>>
> To avoid dependencies its better it goes via DaVinci tree.

I added this to v3.14/gpio branch of my tree (with modifications I
mentioned above).

I dont think there are dependencies for this particular patch though
(applies and builds nicely on latest Linus  T's tree). Even then, there
are too many GPIO patches floating around and I think it is better for
me to collect them for a while and if there really are no platform code
dependencies overall, I can probably hand that branch off to Linus W. We
will see.

Thanks,
Sekhar
