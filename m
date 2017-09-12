From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: save pin registers over suspend/resume
Date: Tue, 12 Sep 2017 15:59:57 +0200
Message-ID: <CACRpkdZtviYaRHp10PyXucq7D4NtAUxREX7YHdzD8gy1bU0RrQ@mail.gmail.com>
References: <20170911061156.31872-1-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:43707 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdILN77 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 09:59:59 -0400
Received: by mail-it0-f54.google.com with SMTP id g142so16223634ita.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2017 06:59:58 -0700 (PDT)
In-Reply-To: <20170911061156.31872-1-drake@endlessm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, linux@endlessm.com

On Mon, Sep 11, 2017 at 8:11 AM, Daniel Drake <drake@endlessm.com> wrote:

> The touchpad in the Asus laptop models X505BA/BP and X542BA/BP is
> unresponsive after suspend/resume. The following error appears during
> resume:
>
>   i2c_hid i2c-ELAN1300:00: failed to reset device.
>
> The problem here is that i2c_hid does not notice the interrupt being
> generated at this point, because the GPIO is no longer configured
> for interrupts.
>
> Fix this by saving pinctrl-amd pin registers during suspend and
> restoring them at resume time.
>
> Based on code from pinctrl-intel.
>
> Signed-off-by: Daniel Drake <drake@endlessm.com>

Excellent analysis and patch.

Applied for fixes and tagged for stable.

Yours,
Linus Walleij
