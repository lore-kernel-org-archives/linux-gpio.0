From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] include: linux: gpio: fix build warnings on undefined
 struct pinctrl_dev
Date: Thu, 13 Jun 2019 02:39:50 +0200
Message-ID: <CACRpkdbBcbOmwu6=fB0TkSU-p_-mRRRLpeE3nFAgvSD4Z75DOA@mail.gmail.com>
References: <1560376776-21994-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560376776-21994-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 13, 2019 at 12:04 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> This fixes the warnings:
>
> * include/linux/gpio.h:254:11: warning: 'struct pinctrl_dev' declared
>   inside parameter list will not be visible outside of this definition
>   or declaration
> * include/linux/gpio/driver.h:602:11: warning: 'struct pinctrl_dev'
>   declared inside parameter list will not be visible outside of this
>   definition or declaration
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

Patch applied, also reported by the build robot.

Thanks,
Linus Walleij
