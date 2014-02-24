From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND 0/6] Intel Atom C2000 series GPIO support
Date: Mon, 24 Feb 2014 14:39:01 +0100
Message-ID: <CACRpkdbJYErKbj3hQjSx=nY3=s7T-aTzn2+6RgogOB0sqGpSLQ@mail.gmail.com>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
	<20140214142734.GE13293@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:55348 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752513AbaBXNjC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 08:39:02 -0500
Received: by mail-oa0-f41.google.com with SMTP id o6so7016249oag.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 05:39:01 -0800 (PST)
In-Reply-To: <20140214142734.GE13293@lee--X1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Aaron Sierra <asierra@xes-inc.com>

On Fri, Feb 14, 2014 at 3:27 PM, Lee Jones <lee.jones@linaro.org> wrote:
>> This patch set is a resend which adds Lee Jones, MFD maintainer into the
>> thread and Aaron Sierra lpc_ich author, forgotten during the first send.
>>
>> The purpose of this patch-set is to add support for GPIOs found on the Intel
>> Atom C2000 series (Avoton/Rangeley)
>>
>> Vincent Donnefort (6):
>>   mfd: lpc_ich: Convert ICH GPIOs IDs to enum
>>   mfd: lpc_ich: Add support for Intel Avoton GPIOs
>>   gpio: ich: Add blink capability option
>>   gpio: ich: Add support for multiple register addresses
>>   gpio: ich: Add output levels cache support
>>   gpio: ich: Add support for Intel Avoton
>>
>>  drivers/gpio/gpio-ich.c     | 96 ++++++++++++++++++++++++++++++++++++++-------
>>  drivers/mfd/lpc_ich.c       |  1 +
>>  include/linux/mfd/lpc_ich.h | 17 ++++----
>>  3 files changed, 93 insertions(+), 21 deletions(-)
>
> I'm fine with the MFD patches in this set.
>
> Linus,
>   Do you want me to create an immutable branch for you to pull from?

Argh too little code for that. It won't collide anyway, either of us
gets to apply all of them.

Yours,
Linus Walleij
