From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mockup: use devm_kcalloc() where applicable
Date: Fri, 9 Jun 2017 10:06:54 +0200
Message-ID: <CACRpkdZbvhqd0LETS3CJ_V5D_aqsmezC-ehhgyXcsfHU9J_2hQ@mail.gmail.com>
References: <1496317623-24026-1-git-send-email-brgl@bgdev.pl> <1496317623-24026-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496317623-24026-2-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 1, 2017 at 1:47 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> When allocating a zeroed array of objects use devm_kcalloc() instead
> of manually calculating the required size and using devm_kzalloc().
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

This does not apply on the GPIO "devel" branch in my tree,
probably because of other patches from you :)

Could you rebase and resend?

Yours,
Linus Walleij
