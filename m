From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 RESEND] gpio: arizona: Support Cirrus Logic CS47L24 and WM1831
Date: Fri, 11 Dec 2015 10:18:24 +0100
Message-ID: <CACRpkdaosbBm4oOGHWUVBV+s9UdQ1oU7cFjd4+c_9uzyab97kg@mail.gmail.com>
References: <1449480242-19380-1-git-send-email-rf@opensource.wolfsonmicro.com>
	<1449480242-19380-2-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:36506 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754121AbbLKJSZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 04:18:25 -0500
Received: by obcse5 with SMTP id se5so80025777obc.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 01:18:25 -0800 (PST)
In-Reply-To: <1449480242-19380-2-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Lee Jones <lee.jones@linaro.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Dec 7, 2015 at 10:24 AM, Richard Fitzgerald
<rf@opensource.wolfsonmicro.com> wrote:

> The CS47L24 and WM1831 codecs only have two GPIO lines, but are
> otherwise similar to the WM8280.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

OK I guess it should just be optimistically merged to the MFD
tree where the dependency is (I guess?). Else I can take it once the MFD
changes are upstream.

Yours,
Linus Walleij
