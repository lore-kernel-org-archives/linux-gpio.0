From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mb86s70: Revert "Return error if requesting an
 already assigned gpio"
Date: Tue, 31 Oct 2017 13:14:16 +0100
Message-ID: <CACRpkdb6ZhW_02GFBpZ-RGJm_h-DGU4iwTzCqOa+Rw=7tu6sAg@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org> <20171027202148.4188-3-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:47243 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbdJaMOS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 08:14:18 -0400
Received: by mail-io0-f194.google.com with SMTP id h70so34524761ioi.4
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 05:14:18 -0700 (PDT)
In-Reply-To: <20171027202148.4188-3-ard.biesheuvel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Axel Lin <axel.lin@ingics.com>

On Fri, Oct 27, 2017 at 10:21 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> Commit fd9c963c5661 ("gpio: mb86s70: Return error if requesting an
> already assigned gpio") adds code that infers from the state of the
> GPIO Pin Function Register (PFR) whether a GPIO has been assigned
> already. This assumes that the pin functions are set to 'peripheral'
> when the driver is loaded, which is not guaranteed. Also, the GPIO
> layer is perfectly capable of keeping track of which GPIOs have been
> assigned already, so we shouldn't need this check in the first place.
>
> This reverts commit fd9c963c5661af3403e77e312c0d9941773b6c1b.
>
> Cc: Axel Lin <axel.lin@ingics.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Patch applied with Axel's ACK.

Yours,
Linus Walleij
