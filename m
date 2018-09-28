From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sprd: Move DT parsing before registering pinctrl device
Date: Fri, 28 Sep 2018 09:34:43 +0200
Message-ID: <CACRpkdYAGjBRiy2n=7g_62ysb7aO0V9OZDZ0rLEfcevfmG9Uyw@mail.gmail.com>
References: <07c454a686966823161ebfe1ed7c08f29032fb2c.1538039535.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <07c454a686966823161ebfe1ed7c08f29032fb2c.1538039535.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, Mark Brown <broonie@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 27, 2018 at 11:15 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> It will be failed to select default or sleep state for pins hogged
> by the pin controller device, since we hadn't parsed pins configuration
> in device tree before registering the pin controller device. Thus
> we should move the device tree parsing function before registering
> the pin controller device.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Yours,
Linus Walleij
