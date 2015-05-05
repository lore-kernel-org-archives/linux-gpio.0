From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v2 0/2] gpio driver for NXP LPC18xx family
Date: Tue, 5 May 2015 22:41:33 +0200
Message-ID: <CAGhQ9Vy=VQbRrjO7Cd8HQs3gXj6h-t4gG0hZxTO7YB86GKc=Vg@mail.gmail.com>
References: <1430601095-31984-1-git-send-email-manabian@gmail.com>
	<CACRpkdZ9oqsh67-J3imL_tsQxiGfr7O_N82N-SUVmju7cmyb9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:34571 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751541AbbEEUle (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2015 16:41:34 -0400
Received: by laat2 with SMTP id t2so137184426laa.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2015 13:41:33 -0700 (PDT)
In-Reply-To: <CACRpkdZ9oqsh67-J3imL_tsQxiGfr7O_N82N-SUVmju7cmyb9w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Linus,

On 5 May 2015 at 17:58, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, May 2, 2015 at 11:11 PM, Joachim Eastwood <manabian@gmail.com> wrote:
>
>> This patch set adds a gpio driver for NXP LPC18xx/43xx devices.
>> Patchset is based on Linus master 4.1-rc1.
>>
>> changes in v2:
>>  - use PBYTE register for gpio set/get
>>  - refactor direction setup
>>  - add lock for direction set RMW cycle
>>  - expand doc example
>
> This v2 version applied.

Excellent.

Thanks Linus.

regards,
Joachim Eastwood
