From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: constify label in gpio_device
Date: Wed, 20 Dec 2017 09:02:16 +0100
Message-ID: <CACRpkdZzJxLfekXu2=PLEpBQy8QmfWSoJAUdUAFnFetjS87FAg@mail.gmail.com>
References: <20171213112520.7479-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:46034 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754168AbdLTICR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 03:02:17 -0500
Received: by mail-io0-f179.google.com with SMTP id e204so16388904iof.12
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 00:02:17 -0800 (PST)
In-Reply-To: <20171213112520.7479-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 13, 2017 at 12:25 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This string is never modified. Make it const.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
