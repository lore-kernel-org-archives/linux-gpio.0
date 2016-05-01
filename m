From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: xgene: Enable ACPI support for X-Gene GFC GPIO driver
Date: Sun, 1 May 2016 10:25:41 +0200
Message-ID: <CACRpkdZDaC=S9NVWgTzDwg16xLnxT5pNv+Qh1bLTt-ACwLQpGg@mail.gmail.com>
References: <1462049367-10028-1-git-send-email-dhdang@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33212 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbcEAIZm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 May 2016 04:25:42 -0400
Received: by mail-oi0-f51.google.com with SMTP id v145so128149628oie.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 May 2016 01:25:42 -0700 (PDT)
In-Reply-To: <1462049367-10028-1-git-send-email-dhdang@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Duc Dang <dhdang@apm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches <patches@apm.com>

On Sat, Apr 30, 2016 at 10:49 PM, Duc Dang <dhdang@apm.com> wrote:

> This patch enables ACPI support for X-Gene GFC GPIO driver.
>
> Signed-off-by: Duc Dang <dhdang@apm.com>

Patch applied.

Duc do you have a datasheet for this GPIO controller?

I want to know if it has further abilities, when I see this:

#define GPIO_SET_DR_OFFSET    0x0C
#define GPIO_DATA_OFFSET    0x14
#define GPIO_BANK_STRIDE    0x0C

It seems like there is a whole bunch of registers there that are not
yet utilized.

Yours,
Linus Walleij
