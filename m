From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] pinctrl: sirf: move to use irq_get_handler_data
Date: Thu, 24 Apr 2014 14:59:54 +0200
Message-ID: <CACRpkdYz+JdAbhdR_s9h4m_3JNcpLo-2VzoXYoEd21myB4yZtg@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-5-git-send-email-21cnbao@gmail.com>
	<CACRpkdbDeF5gBVv=hQSdX1i9fw=7Or+=qN=g4OXHvHkZKr7vcQ@mail.gmail.com>
	<CAGsJ_4y=zNNWAvVOK6zGaY-bufUCbOcZtwE=SuWJ=QpF9rBNHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:45944 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752678AbaDXM7z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Apr 2014 08:59:55 -0400
Received: by mail-ob0-f181.google.com with SMTP id gq1so2586898obb.40
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2014 05:59:55 -0700 (PDT)
In-Reply-To: <CAGsJ_4y=zNNWAvVOK6zGaY-bufUCbOcZtwE=SuWJ=QpF9rBNHg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Thu, Apr 24, 2014 at 12:59 AM, Barry Song <21cnbao@gmail.com> wrote:

>> If you want to use some other handler data than the gpiochip,
>> you should just use irq_set_chained_handler() and
>> irq_set_handler_data() directly.
>
> i think this should be fixed in the general API but not use one more
> function call to over-write the handler_data which has been filled in
> the API.
> since we have the chance for drivers to set either the whole chip for
> a simple chip,  or bank-specific data for a chip which has multiple
> parent IRQs.

I don't think it's worth it for saving one line. The helper is intended
for the simple case, i.e. where it's enough to just get the gpio_chip
as handler data. Other alternatives need to be open coded.

I'm even considering removing this helper if it's confusing, it doesn't
really add much, gpiochip_irqchip_add() is the important function
to use, not gpiochip_set_chained_irqchip().

Yours,
Linus Walleij
