From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3][v2] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Fri, 30 Jan 2015 10:44:00 +0100
Message-ID: <CACRpkdb6RZLP-Cv=UvDcO+_pZb34fDeigtABLmKLPpLkPAWfQg@mail.gmail.com>
References: <1485356.H0CQOKK5aG@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:49502 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419AbbA3JoB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 04:44:01 -0500
Received: by mail-ig0-f173.google.com with SMTP id a13so1959923igq.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 01:44:00 -0800 (PST)
In-Reply-To: <1485356.H0CQOKK5aG@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>, Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 21, 2015 at 5:46 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Introduce new functions for conveniently obtaining and disposing of an entire
> array of GPIOs with one function call.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> v2: change interface
>
> The ACPI and platform stuff is only compile-tested.

I'm waiting for Alexandre to review this before any merging,
it's too big a change for me to dare it without his review.

Yours,
Linus Walleij
