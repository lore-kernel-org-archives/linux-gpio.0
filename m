From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: max732x: convert to GPIOLIB_IRQCHIP
Date: Mon, 2 Mar 2015 15:43:42 +0100
Message-ID: <CACRpkdZVENHZtkDXTS260nDoFDXxQEtp924Z4hM08nbmbfh3ew@mail.gmail.com>
References: <1422614764-5430-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdYYdRpx2RfHEnkA9gatCYEt-Qv+i2PkGOaLUNi2+xgxfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:63822 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127AbbCBOno (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 09:43:44 -0500
Received: by mail-oi0-f41.google.com with SMTP id z81so27267803oif.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 06:43:42 -0800 (PST)
In-Reply-To: <CACRpkdYYdRpx2RfHEnkA9gatCYEt-Qv+i2PkGOaLUNi2+xgxfg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sam Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Mans Rullgard <mans@mansr.com>

On Tue, Feb 3, 2015 at 1:35 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jan 30, 2015 at 11:46 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>
>> Take a sweep to bring the irq support for the MAX732x expanders
>> into the gpiolib core to cut down on duplicated code.
>>
>> Only compile tested! I need some feedback from people using this
>> expander with interrupts to tell me if things go right or
>> wrong when I do this.
>>
>> Cc: Semen Protsenko <semen.protsenko@globallogic.com>
>> Cc: Mans Rullgard <mans@mansr.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Semen can you test this patch?

No answer so applying the patch to move ahead with consolidation.

Yours,
Linus Walleij
