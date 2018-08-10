From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: axp209: Fix NULL pointer dereference after allocation
Date: Fri, 10 Aug 2018 23:13:31 +0200
Message-ID: <CACRpkdY1wtMN_bq+za=nhd_xYb-23g2zeA++ouwxVsJMxH5L9Q@mail.gmail.com>
References: <20180806160635.9293-1-vasilyev@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806160635.9293-1-vasilyev@ispras.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: vasilyev@ispras.ru
Cc: Chen-Yu Tsai <wens@csie.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 6, 2018 at 6:07 PM Anton Vasilyev <vasilyev@ispras.ru> wrote:

> There is no check that allocation in axp20x_funcs_groups_from_mask
> is successful.
> The patch adds corresponding check and return values.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>

Patch applied with Chen-Yu's ACK.

Yours,
Linus Walleij
