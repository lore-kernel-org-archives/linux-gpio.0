From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mockup: fix debugfs read
Date: Thu, 28 Mar 2019 17:37:50 +0100
Message-ID: <CACRpkdbw7zvYx1s742HmYj8E=J0=SygEgBHVDyQ5c84N70V3fA@mail.gmail.com>
References: <20190322173052.23763-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322173052.23763-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 22, 2019 at 6:30 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The debugfs read callback must advance ppos or users using read() on
> the file descriptor will never get the EOL. This wasn't spotted before
> as I was using busybox cat for testing which uses sendfile() internally
> and only noticed it now when switched to cat from coreutils.
>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied for fixes.
Sorry for slow application, I was in no-wifi-land for some days.

Yours,
Linus Walleij
