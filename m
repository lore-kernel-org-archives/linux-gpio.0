Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0649C433FE
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Dec 2020 13:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB2A422B40
	for <linux-gpio@archiver.kernel.org>; Mon,  7 Dec 2020 13:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgLGNLQ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:11:16 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9125 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLGNLQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 08:11:16 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqNvY6v4wz15Mkc;
        Mon,  7 Dec 2020 21:10:01 +0800 (CST)
Received: from [127.0.0.1] (10.57.22.126) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 21:10:24 +0800
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
To:     Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Linuxarm <linuxarm@huawei.com>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com>
 <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation>
 <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
 <a18dfb3ef4dd80dddbd038507d9b8b2f@kernel.org>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <1cc78cf1-edfb-4327-c99c-b3603dc0b3be@huawei.com>
Date:   Mon, 7 Dec 2020 21:10:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a18dfb3ef4dd80dddbd038507d9b8b2f@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.57.22.126]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/7 2:50, Marc Zyngier wrote:
> On 2020-12-06 15:02, Linus Walleij wrote:
>> On Sat, Dec 5, 2020 at 11:15 PM Serge Semin <fancer.lancer@gmail.com> 
>> wrote:
>>
>>> Hmm, that sounds like a problem, but the explanation is a bit unclear
>>> to me. AFAICS you are saying that the only callbacks which are
>>> called during the IRQ request/release are the irq_enable(), right? If
>>> so then the only reason why we haven't got a problem reported due to
>>> that so far is that the IRQs actually unmasked by default.
>>
>> What we usually do in cases like that (and I have discussed this
>> with tglx in the past I think) is to simply mask off all IRQs in 
>> probe().
>> Then they will be unmasked when requested by drivers.
>>
>> See e.g. gpio-pl061 that has this line in probe():
>> writeb(0, pl061->base + GPIOIE); /* disable irqs */
>
> This should definitely be the default behaviour. The code code
> expects all interrupt sources to be masked until actively enabled,
> usually with the IRQ being requested.


I think this patch is used for that purpose. I do two things in 
irq_enable(): unmask irq and then enable IRQ;

and for irq_disable(), it's similar; mask IRQ then disable it.


Thanks

Jiaxing


>
> Thanks,
>
>         M.

