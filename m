From: Raphael Lisicki <rlisicki@radiodata.biz>
Subject: Re: sharing IRQ when IRQ is always enabled
Date: Mon, 29 Jan 2018 14:38:06 +0100
Message-ID: <bc29c7bf-4dca-d835-3c1d-d703206ca449@radiodata.biz>
References: <7594fad0-00c3-5dc6-c095-908e8a03c31a@radiodata.biz>
 <519fc4da-3baa-195a-b046-2799b2609a53@radiodata.biz>
 <3c11e860-39f1-6a8b-4235-9580d3812cd2@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.radiodata.biz ([78.47.114.250]:40089 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751822AbeA2NiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jan 2018 08:38:15 -0500
In-Reply-To: <3c11e860-39f1-6a8b-4235-9580d3812cd2@electromag.com.au>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>, linux-gpio@vger.kernel.org

Hallo Phil, thank you for your answer.


On 29.01.2018 02:21, Phil Reid wrote:
> I've ran into this problem before myself. As far as I could determine 
> there was no way to delay the enabling of the irq.
Did you solve the issue at that time? If so, how?

> There's probably enough information in the dt to determine this by 
> searching for all the devices using that irq.
>
> An approach would be to create an intermediary irq chip device. 
> (Something that models an AND /OR gate for example)
> The driver for which could be setup to delay registering the irq until 
> all irq sources have registered.
>
> This would keep the code separate for the core irq library I think... 
This proxy sounds like an interesting idea. I will try to see what can 
be done in this regard.

Best regards
Raphael
