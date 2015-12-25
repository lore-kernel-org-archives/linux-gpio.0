From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/54] gpio: ich: Be sure to clamp return value
Date: Fri, 25 Dec 2015 13:43:53 +0100
Message-ID: <CACRpkdaXym6fpF93wWhabX7OV6k7TzJ95X45cJ7B-mRHPGYqDg@mail.gmail.com>
References: <1450793493-21995-1-git-send-email-linus.walleij@linaro.org>
	<158154057.29505.1450889984570.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35720 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbbLYMny (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Dec 2015 07:43:54 -0500
Received: by mail-ob0-f172.google.com with SMTP id 18so199439440obc.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Dec 2015 04:43:53 -0800 (PST)
In-Reply-To: <158154057.29505.1450889984570.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Sierra <asierra@xes-inc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Dec 23, 2015 at 5:59 PM, Aaron Sierra <asierra@xes-inc.com> wrote:

>> -             return (data >> 16) & (1 << nr) ? 1 : 0;
>> +             return !!((data >> 16) & (1 << nr));
>
> Linus,
> Is this particular change done to simplify verification via Coccinelle? Otherwise,
> this value is already clamped to 0/1.

No this was my manual inspection, which isn't very accurate. When
in doubt, I made a patch. I'll drop this then, thanks!

Yours,
Linus Walleij
