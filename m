From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/8] gpio: mockup: tweak gpio_mockup_event_write()
Date: Tue, 20 Jun 2017 09:13:16 +0200
Message-ID: <CACRpkdb0rPCoRtJ=EZSqPaJXj25HiS5Bd9c-cT3SgN_56jAyOg@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl> <1497008492-14907-3-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008492-14907-3-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 9, 2017 at 1:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Invert the logic of the irq_enabled check and only access the private
> data after the input is sanitized.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
