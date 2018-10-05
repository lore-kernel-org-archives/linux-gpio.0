From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v5 3/3] gpiolib: Show correct direction from the beginning
Date: Fri, 5 Oct 2018 15:44:06 -0500
Message-ID: <CAOZdJXUgFS+f6P5TFfh2s==fT3jEi8tAnJLX+uQJvFpzfOpDjA@mail.gmail.com>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
 <20181005065300.22882-3-ricardo.ribalda@gmail.com> <8d10f9b4-7ea9-7d27-478a-39982ba49587@codeaurora.org>
 <CAOZdJXU=p0kz0PNhP8KwCQ0o7TuM=z2SvEz4b60_KveCrT7zPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOZdJXU=p0kz0PNhP8KwCQ0o7TuM=z2SvEz4b60_KveCrT7zPA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@kernel.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus <linus.walleij@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 5, 2018 at 11:54 AM Timur Tabi <timur@kernel.org> wrote:
> If you want, just put a printk(... offset) in msm_gpio_get() and read
> from a GPIO that you know you have access to, and make sure the
> 'offset' is correct.
>
> Then try reading from a GPIO that you don't have access to, and make
> sure you get a failure before msm_gpio_get() is called.

Just FYI, if you use sysfs to write to the GPIO, based on the kernel
log you pasted, GPIO 362 in sysfs is actually pin 0 in the TLMM.

If you use gpio-test, it uses gpiolib which figures this all out for
you.  There should still be the gpio-test wiki page I wrote that tells
you how to use it.
