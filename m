From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: make sure gpiod_to_irq() returns negative on NULL desc
Date: Fri, 17 Jun 2016 18:13:45 +0200
Message-ID: <CACRpkdYsY1xBGPbGM1ojd4-OMZ=e_RSvJg_bqFbEpAzR4rsj9w@mail.gmail.com>
References: <1466024604-28014-1-git-send-email-linus.walleij@linaro.org> <e8975884-ab05-4bb2-114e-8b78009f2c3c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36803 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932579AbcFQQNq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2016 12:13:46 -0400
Received: by mail-oi0-f43.google.com with SMTP id p204so124152691oih.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jun 2016 09:13:46 -0700 (PDT)
In-Reply-To: <e8975884-ab05-4bb2-114e-8b78009f2c3c@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Maxime Ripard <maxime.ripard@free-electrons.com>

On Fri, Jun 17, 2016 at 6:09 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> On 15-06-16 23:03, Linus Walleij wrote:
>>
>> commit 54d77198fdfbc4f0fe11b4252c1d9c97d51a3264
>> ("gpio: bail out silently on NULL descriptors")
>> doesn't work for gpiod_to_irq(): drivers assume that NULL
>> descriptors will give negative IRQ numbers in return.
>>
>> It has been pointed out that returning 0 is NO_IRQ and that
>> drivers should be amended to treat this as an error, but that
>> is for the longer term: now let us repair the semantics.
>>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
>
> I can confirm that this fixes the problem for me:
>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Thanks, applied for fixes and pushed for linux-next.

Yours,
Linus Walleij
