From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mockup: fix a potential crash when creating debugfs entries
Date: Tue, 27 Mar 2018 15:14:01 +0200
Message-ID: <CACRpkdZyjKJXfqKkiqWAmYoqLW5i28HTaRRsx_a1jk076cJdmg@mail.gmail.com>
References: <20180304124551.22565-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180304124551.22565-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Mar 4, 2018 at 1:45 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> If we failed to create the top debugfs directory, we must not try to
> create the child nodes. We currently only check if gpio_mockup_dbg_dir
> is not NULL, but it can also contain an errno if debugfs is disabled
> in build options. Use IS_ERR_OR_NULL() instead.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
