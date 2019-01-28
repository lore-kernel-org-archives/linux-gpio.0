From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: berlin: as370: use generic "pwm" as pwm function name
Date: Mon, 28 Jan 2019 15:21:16 +0100
Message-ID: <CACRpkdZ4Ux-y47MumT9wYmJhTt1YmVqVO-cZVV-2U5q6i_-jvw@mail.gmail.com>
References: <20190125153934.3dc818b6@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125153934.3dc818b6@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 25, 2019 at 8:45 AM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:

> So that we could use the generic "pwm" for two or more pins, e.g
>
>         pwm0_pmux: pwm0-pmux {
>                 groups = "PWM0", "PWM1";
>                 function = "pwm";
>         };
>
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Patch applied.

Yours,
Linus Walleij
