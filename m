From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: add a static gpio/pinctrl pin range mapping
Date: Thu, 18 Jan 2018 08:58:58 +0100
Message-ID: <CACRpkdZfQkzcGW5dFwgg-b1G+R-323OO4nu3jpUkH=x6Ks+RaQ@mail.gmail.com>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
 <20180117133423.4482-1-peda@axentia.se> <20180117133423.4482-4-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117133423.4482-4-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 17, 2018 at 2:34 PM, Peter Rosin <peda@axentia.se> wrote:

> Without such a range, gpiolib fails with -EPROBE_DEFER, pending the
> addition of the range. So, without a range, gpiolib will keep
> deferring indefinitely.
>
> Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond sleep")
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Added the other Fixes: tag as well, add Cc: stable and applied.

It will go in for the merge window as it is now, unless Torvalds
decide to do an -rc9 in which case I will consider sending it as
a separate fix next week.

Yours,
Linus Walleij
