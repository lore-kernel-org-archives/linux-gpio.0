From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 01/15] pinctrl-sx150x: Improve OF device matching code
Date: Tue, 8 Nov 2016 09:34:03 +0100
Message-ID: <CACRpkdZS4AGO12BWi3EuH3nNwnymOPfnCEiDpZVue94fOKi6cg@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-2-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:35761 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbcKHIeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:34:05 -0500
Received: by mail-qk0-f169.google.com with SMTP id n204so197679001qke.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:34:04 -0800 (PST)
In-Reply-To: <1478537603-23653-2-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Add proper device specific information to of_device_id table of the
> driver and add code to match against and fetch said data from it.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied. Excellent work!

Yours,
Linus Walleij
