From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 5/7] gpio: brcmstb: enable masking of interrupts when
 changing type
Date: Tue, 3 Oct 2017 20:15:51 -0700
Message-ID: <CADtm3G4uTVGRj45ksCqp-jV9tq1QGSmw7radz8vU8wSqRdmr7g@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-6-opendmb@gmail.com>
 <CADtm3G5oWZTZ7OkAko9_5ge_eOG7FRaEd702rqh55hJnnFi5ow@mail.gmail.com> <5b38f92b-47a9-c75e-dd4e-3f1f907f1359@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:55511 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751132AbdJDDQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 23:16:22 -0400
In-Reply-To: <5b38f92b-47a9-c75e-dd4e-3f1f907f1359@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Oct 3, 2017 at 7:22 PM, Doug Berger <opendmb@gmail.com> wrote:
> On 10/03/2017 07:10 PM, Gregory Fong wrote:
>> Hi Doug,
>>
>> On Fri, Sep 29, 2017 at 8:40 PM, Doug Berger <opendmb@gmail.com> wrote:
>>> Mask the GPIO interrupt while its type is being changed, just in case
>>> it can prevent a spurious interrupt.
>>
>> "Just in case"?  I don't have access to hardware documentation for
>> this anymore, but I'd expect to some stronger claim that the hardware
>> actually requires masking before changing the trigger type.  If you
>> can quote documentation for this or explain an actual problem seen,
>> that would be good.
>
> Well spotted ;).  This was a protectionist change added at the request
> of a user of the driver.  I believe that it is superfluous and I suppose
> that belief leaked through in the language of my comment.
>
> In actuality, the GPIO APIs don't make provision for clearing GPIO
> interrupts before enabling them so this masking is really only a
> deferral of a spurious interrupt if one is triggered by changes in the
> hardware programming.

Indeed.  If the hardware is behaving in unexpected ways that would be
a whole different kind of problem.

>
> I can strike this from the upstream submission and save a couple lines
> of source code (after IRQCHIP_MASK_ON_SUSPEND goes away) if you prefer.
>

Yes, please remove.

Thanks,
Gregory
