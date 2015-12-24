From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/54] GPIO: clamp return values from drivers
Date: Thu, 24 Dec 2015 19:51:14 +0100
Message-ID: <CACRpkdbPZfFVotrtS6zZ4udaEQSfcZy6KwDYTtJD7jamYH7B7w@mail.gmail.com>
References: <1450793312-21725-1-git-send-email-linus.walleij@linaro.org>
	<567966EB.8060900@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35824 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000AbbLXSvP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2015 13:51:15 -0500
Received: by mail-ob0-f170.google.com with SMTP id 18so189937715obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2015 10:51:14 -0800 (PST)
In-Reply-To: <567966EB.8060900@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@sonymobile.com>, Johan Hovold <johan@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>

On Tue, Dec 22, 2015 at 4:06 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> From a19047b2131f73cdf494abd44d76de6f57ca81ff Mon Sep 17 00:00:00 2001
> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Date: Tue, 22 Dec 2015 16:37:28 +0200
> Subject: [PATCH] gpio: update gpiochip .get() callback description
>
> Since gpiochip .get() callback may return a negative error value, it
> strictly limits the range of possible non-error returned values to
> a subset of [30:0] bitmask, however on practice on success all
> gpiochip drivers return either 0 for low signal or 1 for high signal,
> this is assured by "gpio: *: Be sure to clamp return value" series of
> changes. To avoid any confusion, misinterpretation and potential
> errors while developing gpiochip drivers in future convert this
> implicit assumption to a mandatory rule.
>
> For output signals with unknown output signal state gpiochip drivers
> should return a negative error instead of 0.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Patch applied!

Merry Christmas,
Linus Walleij
