From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: berlin: fix BG2CD field widths
Date: Mon, 5 Oct 2015 09:24:16 +0200
Message-ID: <CACRpkdZ9HJtmEs6KhFRwh4=i2kOqeKV_WPDoi5zppNBc2FUDFw@mail.gmail.com>
References: <56074059.10806@gmail.com>
	<560D89BA.1000203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34214 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684AbbJEHYQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 03:24:16 -0400
Received: by obbda8 with SMTP id da8so122205698obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 00:24:16 -0700 (PDT)
In-Reply-To: <560D89BA.1000203@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Hebb <tommyhebb@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>

On Thu, Oct 1, 2015 at 9:30 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:
> On 27.09.2015 03:03, Thomas Hebb wrote:
>>
>> The previous register layout was incorrect, many of the fields having
>> fewer bits than were needed to represent all their modes. The new layout
>> is taken from the bootloader source of a BG2CD device.
>>
>> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
>> ---
>>   drivers/pinctrl/berlin/berlin-bg2cd.c | 62
>> ++++++++++++++++++-----------------
>>   1 file changed, 32 insertions(+), 30 deletions(-)
>
>
> Applied to berlin/fixes.
>
> There seems to be something wrong with the patch.
> Please base your patches on the recent -rc1 kernel
> and use git send-email. I fixed this patch manually.

I don't understand. Is this for the upstream kernel or not?

I should take it into the pinctrl tree if you ACK it I think?

Yours,
Linus Walleij
