From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] ARM: at91: localize GPIO header
Date: Tue, 10 Dec 2013 10:39:34 +0100
Message-ID: <CACRpkdZcOTJqn1hEjDjgF_0cp4-Ab7Kq+3bC0nFfHFqmsLKoqA@mail.gmail.com>
References: <1383643826-14352-1-git-send-email-linus.walleij@linaro.org>
	<52A0AF7D.8020906@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:37932 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519Ab3LJJjf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 04:39:35 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so5085315obb.31
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2013 01:39:34 -0800 (PST)
In-Reply-To: <52A0AF7D.8020906@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Dec 5, 2013 at 5:53 PM, Nicolas Ferre <nicolas.ferre@atmel.com> wrote:

> 3.14 is a big release for us and I am sure that I will have to synchronize
> this patch with:
> - the other patches of this series: the one about serial driver
>   will probably be taken by Uwe.
> - the big cleanup modifications brought by the move to CCF
> - the initiative by Jean-Christophe to remove some of the
>   non-DT board files...
>
> Give me some time to see how I can integrate this into this 3.14 development
> phase...

OK I will keep my fingers away from AT91 for 3.14 so I don't
cause any mess through the GPIO or pinctrl tree. Let's revisit
this after the merge window and see what remains.

Yours,
Linus Walleij
