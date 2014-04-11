From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH v2] gpio: zevio: Get correct gpio output value
Date: Fri, 11 Apr 2014 08:16:43 +0800
Message-ID: <CAFRkauBQyGnP4hs-fd0Y+fBzD3qk9AAkvvRiP+v+rQQoyWPAjg@mail.gmail.com>
References: <1396915179.4729.1.camel@phoenix>
	<CACRpkdaxvE_TuHAUH1HHcNFkbHRaN=adPSHhU-SFRv90UhsLUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:55893 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811AbaDKAQo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 20:16:44 -0400
Received: by mail-qa0-f47.google.com with SMTP id m5so2660293qaj.34
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 17:16:44 -0700 (PDT)
In-Reply-To: <CACRpkdaxvE_TuHAUH1HHcNFkbHRaN=adPSHhU-SFRv90UhsLUg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>, Fabian Vogt <fabian@ritter-vogt.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-04-11 1:56 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Apr 8, 2014 at 1:59 AM, Axel Lin <axel.lin@ingics.com> wrote:
>
>> Read gpio output value from ZEVIO_GPIO_OUTPUT.
>> The spin_lock is required to ensure the direction is not changed before reading
>> input/ouput value.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
> Waiting for an ACK in this v2 version.
>
> Should it be tagged for stable even?
This is a new driver, so no need for stable.

Regards,
Axel
