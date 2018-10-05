From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v5 3/3] gpiolib: Show correct direction from the beginning
Date: Fri, 5 Oct 2018 11:54:03 -0500
Message-ID: <CAOZdJXU=p0kz0PNhP8KwCQ0o7TuM=z2SvEz4b60_KveCrT7zPA@mail.gmail.com>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
 <20181005065300.22882-3-ricardo.ribalda@gmail.com> <8d10f9b4-7ea9-7d27-478a-39982ba49587@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8d10f9b4-7ea9-7d27-478a-39982ba49587@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus <linus.walleij@linaro.org>, Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/05/2018 11:17 AM, Jeffrey Hugo wrote:>
> Looks like the driver is initing just fine to me.  Is setting up the
> jumpers and running gpio-test warranted?

Well, that test only makes sure that input/output is actually working
on the hardware level, but it also makes sure that the GPIOs are
numbered correctly.

If you want, just put a printk(... offset) in msm_gpio_get() and read
from a GPIO that you know you have access to, and make sure the
'offset' is correct.

Then try reading from a GPIO that you don't have access to, and make
sure you get a failure before msm_gpio_get() is called.
