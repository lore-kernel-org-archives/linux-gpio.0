From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/10] gpio: mockup: improve the debugfs input sanitization
Date: Mon, 29 May 2017 13:32:16 +0200
Message-ID: <CACRpkdarjDT5+SUku9ZfbwYi0TdgM2Yv14Hi347gWkw4N0q7GQ@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-6-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701227-28809-6-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 25, 2017 at 10:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> We're currently only checking the first character of the input to the
> debugfs event files, so a string like '0sdfdsf' is valid and indicates
> a falling edge event.
>
> Be more strict and only allow '0', '1', '0\n' & '1\n'.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Since I applied patches 1-4 you only need to resend from this point
when posting v2.

Yours,
Linus Walleij
