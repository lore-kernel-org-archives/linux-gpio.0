From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: sta2x11: check the return value of irq_alloc_generic_chip()
Date: Mon, 29 May 2017 13:34:03 +0200
Message-ID: <CACRpkdb5ANyn3LxH56xz8QQVdN1tF+H7r9j=H_O_JgWV52kwGA@mail.gmail.com>
References: <1495701458-12444-1-git-send-email-brgl@bgdev.pl> <1495701458-12444-3-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701458-12444-3-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 25, 2017 at 10:37 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This function can fail, so check the return value before dereferencing
> the returned pointer.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
