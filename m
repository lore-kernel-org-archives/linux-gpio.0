From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC] gpio: Driver for SYSCON-based GPIOs
Date: Tue, 19 Nov 2013 10:53:06 +0100
Message-ID: <CACRpkdanW0XmPN5s9=gkz3AF9KCo96tw1ie3mim0rj9Dbw9gXA@mail.gmail.com>
References: <1384497752-19032-1-git-send-email-shc_work@mail.ru>
	<CACRpkdZfUnzejxRZ5eoiSV8bg-mkmdwQr0Dyf9tE=HJzVBH1UQ@mail.gmail.com>
	<1384852632.323818774@f377.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:40148 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618Ab3KSJxH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:53:07 -0500
Received: by mail-oa0-f50.google.com with SMTP id j17so3801252oag.37
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 01:53:06 -0800 (PST)
In-Reply-To: <1384852632.323818774@f377.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

On Tue, Nov 19, 2013 at 10:17 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> On Fri, Nov 15, 2013 at 7:42 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

>> Assuming just like the people causing the y2k problem that
>> "32 bits ought to fit everyone".
>>
>> This is not your fault, but I'd like you to insert a big comment
>> explaining that the syscon driver semantics hammer down the
>> 32 bit register width and there is nothing you can do about it.
>
> You mean the comment in the source code or in the DT bindings?
> Thanks.

In the source code right where you hardwire /32 and %32 etc.

Might as well use some

#define SYSCON_REG_WIDTH 32

Yours,
Linus Walleij
