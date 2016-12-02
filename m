From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: handle missing 'advanced' reg in
 sx1504 and sx1505
Date: Fri, 2 Dec 2016 14:02:34 +0100
Message-ID: <CACRpkdbsSLKK+McCUm+O+gDozPzVzF5pjUL9iRFexk1vGuUMUA@mail.gmail.com>
References: <1480675876-19540-1-git-send-email-peda@axentia.se> <1480675876-19540-4-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480675876-19540-4-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 2, 2016 at 11:51 AM, Peter Rosin <peda@axentia.se> wrote:

> This fixes a problem where sx150x_regmap_reg_width() returns 8 for the
> data register (reg 0) for sx1504 where it should return 4, and return
> a correct 8 for sx1505 but for the wrong reason (both chips lack the
> 'advanced' register). This is not a real problem, since nothing depends
> on the function returning 4 or 8, and certainly not if it is returning
> 8 for the wrong reason. But fix this to avoid nasty surprises down the
> line.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Patch applied.

Yours,
Linus Walleij
