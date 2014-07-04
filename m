From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 1/3] gpio: Add APM X-Gene SoC GPIO controller support
Date: Fri, 4 Jul 2014 23:22:44 +0200
Message-ID: <CACRpkdY-5rqR1pkojJALEu7AZYK6UYeDa7XR_EABOKCJGek2HQ@mail.gmail.com>
References: <1403823587-23404-1-git-send-email-fkan@apm.com>
	<1403823587-23404-2-git-send-email-fkan@apm.com>
	<CACRpkdY9MYWx5uG0jCb7TR59wd0+nKBhJruyD2TE6YKgeAX6Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:36787 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753595AbaGDVWo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jul 2014 17:22:44 -0400
Received: by mail-oa0-f47.google.com with SMTP id n16so2223359oag.34
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2014 14:22:44 -0700 (PDT)
In-Reply-To: <CACRpkdY9MYWx5uG0jCb7TR59wd0+nKBhJruyD2TE6YKgeAX6Uw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: patches <patches@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Jul 4, 2014 at 11:20 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jun 27, 2014 at 12:59 AM, Feng Kan <fkan@apm.com> wrote:
>
>> Add APM X-Gene SoC gpio controller driver.
>>
>> Signed-off-by: Feng Kan <fkan@apm.com>
>
> Patch applied with Alexandre's review tag, good job!

Ah wait, Mark still has comments on the DT bindings so
holding back the set until that has been resolved.

Yours,
Linus Walleij
