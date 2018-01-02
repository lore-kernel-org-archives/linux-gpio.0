From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: don't dereference a desc before validation
Date: Tue, 2 Jan 2018 09:32:17 +0100
Message-ID: <CACRpkdYfu9O5HkjZ0peVYyapLyKyx_-FhUOVprVjDpU-aGkV1A@mail.gmail.com>
References: <20171221163724.6043-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:37178 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbeABIcS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:32:18 -0500
Received: by mail-it0-f41.google.com with SMTP id d137so38697328itc.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:32:18 -0800 (PST)
In-Reply-To: <20171221163724.6043-1-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-gpio@vger.kernel.org

On Thu, Dec 21, 2017 at 5:37 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> The fix restores a proper validation of an input gpio desc, which
> might be needed to deal with optional GPIOs correctly.
>
> Fixes: 02e479808b5d ("gpio: Alter semantics of *raw* operations to actually be raw")
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Hm you're right this looks better.

I don't think it's a regression so queued as a non-critical fix.

Yours,
Linus Walleij
