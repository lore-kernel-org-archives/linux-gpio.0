From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: (gpio-pca953x) move header to linux/platform_data/
Date: Fri, 16 Aug 2013 17:42:25 +0200
Message-ID: <CACRpkdYX_u3yn0AhyMpCSYoQQJdaWJeK_GztxNM_LUL15WpAhA@mail.gmail.com>
References: <CACRpkdZdeVNtJSmc6Lr6j=oO9FLsAvjyrwhYS0j4OoAEhxCN9g@mail.gmail.com>
	<82440653.410050.1376665340121.JavaMail.root@mail>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:59300 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab3HPPmZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 11:42:25 -0400
Received: by mail-oa0-f46.google.com with SMTP id l10so2416536oag.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 08:42:25 -0700 (PDT)
In-Reply-To: <82440653.410050.1376665340121.JavaMail.root@mail>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@savoirfairelinux.com

On Fri, Aug 16, 2013 at 5:02 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:

>> Why does the GPIO driver need platform data from the
>> I2C driver???
>>
>> Can't this just be made to go away?
>
> I didn't dig that much in the driver, but I cannot imagine
> another way to pass, for instance, the setup callback.

Hm so this is some combined platform data for I2C *and* GPIO?

Hmm ugly, but OK then.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
