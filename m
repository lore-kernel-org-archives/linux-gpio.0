From: Andy Gross <andy.gross@linaro.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 12:21:19 -0400
Message-ID: <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org> <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org> <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook> <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f54.google.com ([209.85.213.54]:35166 "EHLO
        mail-vk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750837AbdFPQVU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 12:21:20 -0400
Received: by mail-vk0-f54.google.com with SMTP id 191so24870463vko.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2017 09:21:20 -0700 (PDT)
In-Reply-To: <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On 16 June 2017 at 12:17, Timur Tabi <timur@codeaurora.org> wrote:
> On 6/16/17 11:06 AM, Bjorn Andersson wrote:
>>
>> Exposing a subset of GPIOs with a different numbering than what's in the
>> hardware documentation is going to be quite confusing for the users.
>
>
> I agree, and that's why I was hoping to expose only the qdss_tracedata pins.
>
>> Just to confirm, are the qdss_tracedata the only GPIOs that you want to
>> expose from the TLMM now? Are those consecutive?
>
>
> Well, ideally would like to expose only those pins that are:
>
> 1) Approved by the XPU

How do you know what this is?  And this changes based on the TZ load.

> and
>
> 2) Already set to function 0 on boot
>
> Unfortunately, doing both of these would require significant changes to
> pinctrl-msm.  Considering how unimportant this feature is (we don't need the
> TLMM any more for normal operations), I don't really want to invest too much
> time in it.
>
> So assuming I can get approval from all stakeholders, all I want to do is
> expose the qdss_tracedata[0..n-1] pins as gpios 0..n-1.
>
>
> --
> Sent by an employee of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the
> Code Aurora Forum, hosted by The Linux Foundation.
