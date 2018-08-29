From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: gpio: gpio-adp5588: Fix sleep-in-atomic-context bug
Date: Wed, 29 Aug 2018 10:55:38 +0200
Message-ID: <CACRpkdbw3DwYO=W7m5AaNkg8QZmCf+7yM4fNs7tBVDZgVma2wg@mail.gmail.com>
References: <1534168664-13034-1-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534168664-13034-1-git-send-email-michael.hennerich@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, baijiaju1990@gmail.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 13, 2018 at 3:53 PM <michael.hennerich@analog.com> wrote:

> From: Michael Hennerich <michael.hennerich@analog.com>
>
> This fixes:
> [BUG] gpio: gpio-adp5588: A possible sleep-in-atomic-context bug
>                           in adp5588_gpio_write()
> [BUG] gpio: gpio-adp5588: A possible sleep-in-atomic-context bug
>                           in adp5588_gpio_direction_input()
>
> Reported-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>

Thanks Michael, excellent and prompt fix. Patch applied
for fixes (v4.19-rcs).

Should we even tag it for stable?

Yours,
Linus Walleij
