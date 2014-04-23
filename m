From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sirf: move to use irq_get_handler_data
Date: Thu, 24 Apr 2014 06:59:29 +0800
Message-ID: <CAGsJ_4y=zNNWAvVOK6zGaY-bufUCbOcZtwE=SuWJ=QpF9rBNHg@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
 <1397544229-20545-5-git-send-email-21cnbao@gmail.com> <CACRpkdbDeF5gBVv=hQSdX1i9fw=7Or+=qN=g4OXHvHkZKr7vcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:65124 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600AbaDWW7t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 18:59:49 -0400
Received: by mail-pa0-f50.google.com with SMTP id rd3so1239062pab.9
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 15:59:49 -0700 (PDT)
In-Reply-To: <CACRpkdbDeF5gBVv=hQSdX1i9fw=7Or+=qN=g4OXHvHkZKr7vcQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

2014-04-24 4:17 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:
>
>> From: Barry Song <Baohua.Song@csr.com>
>>
>> we set bank as handler_data, now we can get bank in ISR directly
>> instead of looking-up.
>>
>> Signed-off-by: Barry Song <Baohua.Song@csr.com>
>
> If you want to use some other handler data than the gpiochip,
> you should just use irq_set_chained_handler() and
> irq_set_handler_data() directly.

i think this should be fixed in the general API but not use one more
function call to over-write the handler_data which has been filled in
the API.
since we have the chance for drivers to set either the whole chip for
a simple chip,  or bank-specific data for a chip which has multiple
parent IRQs.

>
> Yours,
> Linus Walleij

-barry
