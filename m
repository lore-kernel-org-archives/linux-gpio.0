From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/9] ARM: sa1100: Rework IRQ handling
Date: Tue, 19 Nov 2013 21:24:31 +0100
Message-ID: <CACRpkdbgn22xDX4nJZSDSE9-h+u1j5DQt=8arO7oS-UCBdBMUQ@mail.gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
	<CACRpkdZU3_EqhBjV68+okJwh7QONuxWVjKkrUO4PkwJhKrP+mQ@mail.gmail.com>
	<528B811A.1030501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:47773 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812Ab3KSUYb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 15:24:31 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so4131052obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 12:24:31 -0800 (PST)
In-Reply-To: <528B811A.1030501@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Dmitry Artamonow <mad_soft@inbox.ru>

On Tue, Nov 19, 2013 at 4:17 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> On 11/19/2013 05:00 PM, Linus Walleij wrote:

>> And that happens before the GPIO driver gets registered -> crash.
>
> That is not the issue. The real issue is h3xxx using those gpio's without
> previously calling gpio_request.

Really? But that wasn't done before this patch either.

It is basically OK to use the gpio_* functions before or
without requesting the GPIOs, it won't look nice but it
works.

> Unfortunately sa1100 driver doesn't have a
> good place to request gpios. When faced this problem during locomo
> refactoring, I ended up with the following piece of code:
(...)
> Russell, Linus, what do you think about the previous solution?

That looks OK but is that really the problem?

Yours,
Linus Walleij
