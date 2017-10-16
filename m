From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] gpio: Wakeup gpio controller when it is used as IRQ
 controller
Date: Mon, 16 Oct 2017 15:40:28 +0200
Message-ID: <c50a9e0c-2bba-aa54-0c9a-8551bc0e180c@xilinx.com>
References: <09258550e475aa7135db7b91bb96deeaf900f8c2.1505891674.git.michal.simek@xilinx.com>
 <2cf9c866-5ace-b056-c80b-a7354fb951fc@ti.com>
 <CACRpkdaQZiyfbBQh-CZZuiw96iqA6bZvN+V7HddJZcR7yz4Cmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0053.outbound.protection.outlook.com ([104.47.37.53]:27088
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752337AbdJPNkn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Oct 2017 09:40:43 -0400
In-Reply-To: <CACRpkdaQZiyfbBQh-CZZuiw96iqA6bZvN+V7HddJZcR7yz4Cmw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Borsodi Petr <Petr.Borsodi@i.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>

Hi Linus,

On 21.9.2017 14:19, Linus Walleij wrote:
> On Wed, Sep 20, 2017 at 10:07 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> On 09/20/2017 02:14 AM, Michal Simek wrote:
>>> From: Borsodi Petr <Petr.Borsodi@i.cz>
>>>
>>> There is a problem with GPIO driver when used as IRQ controller.
>>> It is not working because the module is sleeping (clock is disabled).
>>> The patch enables clocks when IP is used as IRQ controller.
>>
>> I think, it should be solved already in genirq core.
>> commit be45beb "genirq: Add runtime power management support for IRQ chips"
> 
> Michal, can you verify?

sorry for delay. I have just confirmed that this patch is not needed.
At least I am not able to replicate the issue again that's why please
skip this patch.

Thanks,
Michal
