From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Reorder debug print
Date: Thu, 21 Feb 2019 13:15:27 +0100
Message-ID: <CACRpkdYJw+Kap6LjZAbOp=6eC4DSLOF8unx35t8J89uOeFanmw@mail.gmail.com>
References: <20190219191253.21712-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219191253.21712-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 19, 2019 at 8:12 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> It's reasonable to expect that people turn to the "gpio" debugfs file to
> first and foremost learn about the direction and value of a gpio, and
> second to that about it's pinconf. So reorder the value so each line
> reads:
>
> gpioN: direction value ...
>
> This also makes it consistent with the TLMM pinctrl driver's output in
> the same dump.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied.

Yours,
Linus Walleij
