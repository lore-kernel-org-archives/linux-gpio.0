From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 35/54] m68k: coldfire/gpio: Be sure to clamp return value
Date: Fri, 25 Dec 2015 13:45:13 +0100
Message-ID: <CACRpkdYfP1OpvBzKEZBuE6DmgPoC3CqpeS4w=oqD0sd_gUU5Pg@mail.gmail.com>
References: <1450795145-27292-1-git-send-email-linus.walleij@linaro.org>
	<567A8AD1.3070705@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35095 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752361AbbLYMpO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Dec 2015 07:45:14 -0500
Received: by mail-ob0-f173.google.com with SMTP id 18so199450206obc.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Dec 2015 04:45:14 -0800 (PST)
In-Reply-To: <567A8AD1.3070705@uclinux.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Wed, Dec 23, 2015 at 12:51 PM, Greg Ungerer <gerg@uclinux.org> wrote:
> On 23/12/15 00:39, Linus Walleij wrote:
>>
>> As we want gpio_chip .get() calls to be able to return negative
>> error codes and propagate to drivers, we need to go over all
>> drivers and make sure their return values are clamped to [0,1].
>> We do this by using the ret = !!(val) design pattern.
>>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Greg Ungerer <gerg@uclinux.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> M68K folks: as mentioned in 00/54: either apply this directly
>> or ACK it and I will take it into the GPIO tree.
>
>
> I will take via the m68knommu git tree.
> I am pushing it up to the for-next branch now.

Awesome, thanks Greg.

Yours,
Linus Walleij
