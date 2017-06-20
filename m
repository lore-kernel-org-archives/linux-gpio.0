From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/8] gpio: mockup: don't return magic numbers from probe()
Date: Tue, 20 Jun 2017 09:15:30 +0200
Message-ID: <CACRpkdYeHSsRBOUQKXZdxy67RFp8g_-KhjFxChro1_j8mgWLkw@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl> <1497008492-14907-6-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008492-14907-6-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 9, 2017 at 1:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> When the requested number of GPIO lines is 0, return -EINVAL, not
> -1 which is -EPERM.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
