From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: add desc validation to gpiod_set_transitory()
Date: Tue, 2 Jan 2018 09:39:48 +0100
Message-ID: <CACRpkdb4QGSj6WijugeqJ+dpH2HEqoS+Y6kYye2OfmgoS+U1Jg@mail.gmail.com>
References: <20171221163735.6143-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:46558 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752658AbeABIjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:39:49 -0500
Received: by mail-it0-f50.google.com with SMTP id c16so13911056itc.5
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:39:49 -0800 (PST)
In-Reply-To: <20171221163735.6143-1-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-gpio@vger.kernel.org

On Thu, Dec 21, 2017 at 5:37 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> The gpiod_set_transitory() function is publicly exported, and
> it is expected from it to be ready for usage with optional GPIOs
> on consumer's side.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied.

Yours,
Linus Walleij
