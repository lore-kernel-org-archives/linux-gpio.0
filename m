From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: remove obsolete tnetv107x driver
Date: Wed, 5 Mar 2014 10:45:30 +0800
Message-ID: <CACRpkdZOpym2bit=kRE3F3rhuFQd=U2A=RynxwDfXNbsditS7A@mail.gmail.com>
References: <1393418614-3968549-1-git-send-email-arnd@arndb.de>
	<1393418614-3968549-3-git-send-email-arnd@arndb.de>
	<CACRpkdaBMozNayXXyn8Ag+GUU_+C2j4X7aVuaZjgV_krCvSy0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:52388 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbaCECpa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Mar 2014 21:45:30 -0500
Received: by mail-oa0-f41.google.com with SMTP id j17so444947oag.14
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2014 18:45:30 -0800 (PST)
In-Reply-To: <CACRpkdaBMozNayXXyn8Ag+GUU_+C2j4X7aVuaZjgV_krCvSy0A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, Cyril Chemparathy <cyril@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 5, 2014 at 9:52 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 26, 2014 at 8:43 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>> The tnetv107x platform is getting removed, so this driver won't
>> be needed any more.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>
> Can I have an ACK from some Sekhar to apply this
> to the GPIO tree, so we are all aligned?

Bah I found the ACK on patch 0, sorry about the fuzz.
Patch applied.

Yours,
Linus Walleij
