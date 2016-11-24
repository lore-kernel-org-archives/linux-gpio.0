From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: sx150x: support setting multiple pins at once
Date: Thu, 24 Nov 2016 15:08:25 +0100
Message-ID: <CACRpkdavVJjBQCg-4ydrjp68VSgd9H+Xr2PkrPLGoqUhgBy8HQ@mail.gmail.com>
References: <1479896331-16915-1-git-send-email-peda@axentia.se> <1479896331-16915-3-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479896331-16915-3-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 23, 2016 at 11:18 AM, Peter Rosin <peda@axentia.se> wrote:

> If the chip does not have an oscio pin, all pins are configured in
> the same regmap register making it trivial to update all pins at
> once, so do that. If an oscio pin is present, there needs to be
> more locking in place to handle all cases correctly, so this is
> skipped.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Tired of waiting for ACKs. Looks good. Patch applied.

Yours,
Linus Walleij
