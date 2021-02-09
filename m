Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A781DC433DB
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Feb 2021 09:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 687C864EB4
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Feb 2021 09:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhBIJ2L (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 9 Feb 2021 04:28:11 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:12502 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhBIJZQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 04:25:16 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DZcrC4QGHzjLQg;
        Tue,  9 Feb 2021 17:23:07 +0800 (CST)
Received: from [127.0.0.1] (10.40.192.131) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Tue, 9 Feb 2021
 17:24:28 +0800
Subject: Re: [Linuxarm] [PATCH for next v1 0/2] gpio: few clean up patches to
 replace spin_lock_irqsave with spin_lock
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Kevin Hilman" <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
 <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
Date:   Tue, 9 Feb 2021 17:24:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.40.192.131]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2021/2/8 21:28, Andy Shevchenko wrote:
> On Mon, Feb 8, 2021 at 11:11 AM luojiaxing <luojiaxing@huawei.com> wrote:
>> Sorry, my operation error causes a patch missing from this patch set. I
>> re-send the patch set. Please check the new one.
> What is the new one?! You have to give proper versioning and change
> log for your series.


sure, I will send a new one later, but let me answer your question first.


>
>> On 2021/2/8 16:56, Luo Jiaxing wrote:
>>> There is no need to use API with _irqsave in hard IRQ handler, So replace
>>> those with spin_lock.
> How do you know that another CPU in the system can't serve the
> following interrupt from the hardware at the same time?


Yes, I have some question before.


There are some similar discussion here,  please take a look, Song baohua 
explained it more professionally.

https://lore.kernel.org/lkml/e949a474a9284ac6951813bfc8b34945@hisilicon.com/


Here are some excerpts from the discussion:


I think the code disabling irq in hardIRQ is simply wrong.
Since this commit
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e58aa3d2d0cc
genirq: Run irq handlers with interrupts disabled

interrupt handlers are definitely running in a irq-disabled context
unless irq handlers enable them explicitly in the handler to permit
other interrupts.


Thanks

Jiaxing


>

