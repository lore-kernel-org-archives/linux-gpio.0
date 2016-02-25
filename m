From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: core: create unlocked version of pinctrl_find_gpio_range_from_pin
Date: Thu, 25 Feb 2016 15:55:30 +0100
Message-ID: <CACRpkda0Hu+A9C8yNEYx-vxvKvvM+xhpu_N2QWwT7K+WYOhOFQ@mail.gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
	<1456008716-6236-2-git-send-email-manabian@gmail.com>
	<CACRpkdbrS98Bd7Wx8k6GVp27We1nNNtyqEwiR1SxGp1T5myVVw@mail.gmail.com>
	<CACRpkdZ6EODhqbH9amTdgCMbR1Qq4A867wiK24q6RAg+7Svy+w@mail.gmail.com>
	<CAGhQ9Vy6wLctan9-O-FOL6E2_HUhFcHcu+qbx_Ye3ai37w0esg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36132 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760300AbcBYOzb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 09:55:31 -0500
Received: by mail-ob0-f170.google.com with SMTP id s6so268288obg.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 06:55:31 -0800 (PST)
In-Reply-To: <CAGhQ9Vy6wLctan9-O-FOL6E2_HUhFcHcu+qbx_Ye3ai37w0esg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 25, 2016 at 12:19 PM, Joachim  Eastwood <manabian@gmail.com> wrote:

>> Or rather, pinctrl_fund_gpio_range_from_pin_locked(),
>> indicating that you're already holding the necessary lock
>> when calling the function. Now I'm even confusing myself,
>> sorry :(
>
> Shouldn't the function name indicate what the function does with the lock?
>
> pinctrl_fund_gpio_range_from_pin_unlocked() would indicate to me that
> it does not acquire a lock and it is your responsibility as a caller
> to ensure that the correct lock is held before calling.

OK hm maybe you're right, grep the kernel for precedents.

Yours,
Linus Walleij
