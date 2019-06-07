From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: hack to fix 24 bit gpio expanders
Date: Sat, 8 Jun 2019 00:04:15 +0200
Message-ID: <CACRpkda6Hk1hE322KGC==0OFr5YZ+Qsvh6Dird_xjS5xop4bEw@mail.gmail.com>
References: <9bb9ca6102e795dc2495d92b7b661779509adebc.1559651758.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9bb9ca6102e795dc2495d92b7b661779509adebc.1559651758.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 2:36 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> 24 bit expanders use REG_ADDR_AI in combination with register addressing. This
> conflicts with regmap which takes this bit as part of the register number,
> i.e. a second cache entry is defined for accessed with REG_ADDR_AI being
> set although on the chip it is the same register as with REG_ADDR_AI being
> cleared.
>
> The problem was introduced by
>
>         commit b32cecb46bdc ("gpio: pca953x: Extract the register address mangling to single function")
>
> but only became visible by
>
>         commit 8b9f9d4dc511 ("regmap: verify if register is writeable before writing operations")
>
> because before, the regmap size was effectively ignored and
> pca953x_writeable_register() did know to ignore REG_ADDR_AI. Still, there
> were two separate cache entries created.
>
> Since the use of REG_ADDR_AI seems to be static we can work around this
> issue by simply increasing the size of the regmap to cover the "virtual"
> registers with REG_ADDR_AI being set. This only means that half of the
> regmap buffer will be unused.
>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch queued for fixes, let's think about better solutions going
forward.

Yours,
Linus Walleij
