From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/6] dt-bindings: gpio: Add binding documentation for gpio-thunderx
Date: Tue, 14 Mar 2017 22:21:28 +0100
Message-ID: <CACRpkda-uq4EgHYRRnEdTByMy3rFUkquz0jyxWY_7_1TrppdFw@mail.gmail.com>
References: <1488332932-2691-1-git-send-email-david.daney@cavium.com>
 <1488332932-2691-5-git-send-email-david.daney@cavium.com> <CACRpkda_k=dBdvEBu86KaahjVnADzH7tP_AnoRWS_UQ=sRmdng@mail.gmail.com>
 <c0dcf6be-b4be-168c-2cf0-9edbffddb2b5@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:38023 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751883AbdCNVVb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 17:21:31 -0400
Received: by mail-it0-f54.google.com with SMTP id m27so8067524iti.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 14:21:30 -0700 (PDT)
In-Reply-To: <c0dcf6be-b4be-168c-2cf0-9edbffddb2b5@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 14, 2017 at 5:45 PM, David Daney <ddaney@caviumnetworks.com> wrote:
> On 03/14/2017 07:53 AM, Linus Walleij wrote:
>>
>> On Wed, Mar 1, 2017 at 2:48 AM, David Daney <david.daney@cavium.com>
>> wrote:
>>
>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>
>>
>> This patch applied to the GPIO tree, really simplistic so why not
>> merge it.
>
>
> I think the idea is that with Rob's Acked-by, it could be merged via the
> GPIO tree when and if the other patches in the set are merged.  Since I
> don't maintain any trees pulled by Linus Torvalds, I am at the mercy of the
> various maintainers.

I agree that the code changes need to go in together.

But DT bindings are sort of decoupled from the kernel i general
(they are theoretically also used by other OSes such as *BSD)
so they can be merged in an orthogonal manner once they are
considered finished.

No biggie for me though, if you prefer, I can pull it out.

Yours,
Linus Walleij
