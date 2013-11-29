From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: lock adnp IRQs when enabling them
Date: Fri, 29 Nov 2013 10:49:46 +0100
Message-ID: <CACRpkdYjfUAy2jZMZfgH+N+NNpnfZ8eUE3UJ78AJZXWXVHrhfw@mail.gmail.com>
References: <1385460324-30777-1-git-send-email-linus.walleij@linaro.org>
	<52949EFA.3060903@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:47759 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752859Ab3K2Jts (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:49:48 -0500
Received: by mail-oa0-f43.google.com with SMTP id i7so10141853oag.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 01:49:47 -0800 (PST)
In-Reply-To: <52949EFA.3060903@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, Lars Poeschel <poeschel@lemonage.de>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Nov 26, 2013 at 2:15 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 11/26/2013 12:05 PM, Linus Walleij wrote:
>>
>> This uses the new API for tagging GPIO lines as in use by
>> IRQs. This enforces a few semantic checks on how the underlying
>> GPIO line is used.
>>
(...)
>> +       .irq_enable = adnp_irq_enable,
>> +       .irq_disable = adnp_irq_disable,
>
>
> .irq_startup/irq_shutdown ?

Sorry I was in a confused middle-ground when doing this,
not having figured out whether to use enable/disable or
startup/shutdown. Sent a v3 using startup/shutdown.

Yours,
Linus Walleij
