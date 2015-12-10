From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add GPIO support for the ACCES 104-IDI-48
Date: Thu, 10 Dec 2015 16:18:46 +0100
Message-ID: <CACRpkdZ3VcL1JJs97cZkPdATGCPVhdSfkBjossNTAw7idMzzbg@mail.gmail.com>
References: <20151123175450.GA16041@sophia>
	<CACRpkda7QAKB=7W6rVA8fh873wTy9wm=8ta+mKZmuP2Sj7rCHA@mail.gmail.com>
	<565D994A.8080002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35778 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753798AbbLJPSr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:18:47 -0500
Received: by obc18 with SMTP id 18so60231056obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:18:46 -0800 (PST)
In-Reply-To: <565D994A.8080002@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 1, 2015 at 1:57 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On 12/01/2015 03:57 AM, Linus Walleij wrote:
>> This is a very nice and clean written driver.
>>
>> Patch applied.
>>
>> Yours,
>> Linus Walleij
>
> I submitted a version 2 of this patch with a minor optimization change
> to the IRQ acknowledgment functionality. Should I resubmit that change
> as a separate patch based on top of this commit?

Yes please. Sorry for the mess, I'm under quite heavy workload
and prone to make mistakes and unpredictable delays right now.

Yours,
Linus Walleij
