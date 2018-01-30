From: Phil Reid <preid@electromag.com.au>
Subject: Re: sharing IRQ when IRQ is always enabled
Date: Tue, 30 Jan 2018 09:41:46 +0800
Message-ID: <5df9768e-ba03-4823-6ee7-f4053214ab2e@electromag.com.au>
References: <7594fad0-00c3-5dc6-c095-908e8a03c31a@radiodata.biz>
 <519fc4da-3baa-195a-b046-2799b2609a53@radiodata.biz>
 <3c11e860-39f1-6a8b-4235-9580d3812cd2@electromag.com.au>
 <bc29c7bf-4dca-d835-3c1d-d703206ca449@radiodata.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:34554 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752440AbeA3Bls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jan 2018 20:41:48 -0500
In-Reply-To: <bc29c7bf-4dca-d835-3c1d-d703206ca449@radiodata.biz>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Raphael Lisicki <rlisicki@radiodata.biz>, linux-gpio@vger.kernel.org

On 29/01/2018 21:38, Raphael Lisicki wrote:
> Hallo Phil, thank you for your answer.
> 
> 
> On 29.01.2018 02:21, Phil Reid wrote:
>> I've ran into this problem before myself. As far as I could determine there was no way to delay the enabling of the irq.
> Did you solve the issue at that time? If so, how?

In a ound about way.
My hardware had the irqs connected to a pca9543 i2c mux that ANDs the irq together.
The device can tell you which irq is active but can not mask them.
The irq source was an SMBus alert on each i2c segment. So I modified the i2c core to register smb alert handlers.
And had the mux driver delay registering its irq until all bus segments had been created.

Had some other hardware using the pca gpio with irq tied together. Fortunately hardware was only at 1st prototype.
So I changed the hardware once I'd found this problem :) USed mcp23 series gpio's instead.

> 
>> There's probably enough information in the dt to determine this by searching for all the devices using that irq.
>>
>> An approach would be to create an intermediary irq chip device. (Something that models an AND /OR gate for example)
>> The driver for which could be setup to delay registering the irq until all irq sources have registered.
>>
>> This would keep the code separate for the core irq library I think... 
> This proxy sounds like an interesting idea. I will try to see what can be done in this regard.

Something like this would solve a number of problems.
The was a previous discussion in regards one of my patches (around nov last year) for the mcp23s08 driver irq to
create something to model an inverter on the irq line.
Something configurable with X lines and possibility to invert inputs would be generic.
Just haven't got to it as yet.

-- 
Regards
Phil Reid
