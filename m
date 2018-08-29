From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Wed, 29 Aug 2018 09:42:05 +0200
Message-ID: <CACRpkdaPRo1G1qmRvC61UPht=wqUJyA7djVfysMd_NAxeEtR+A@mail.gmail.com>
References: <20180816200648.90458-1-swboyd@chromium.org> <20180816200648.90458-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816200648.90458-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 16, 2018 at 10:06 PM Stephen Boyd <swboyd@chromium.org> wrote:

> We rely on devices to use pinmuxing configurations in DT to select the
> GPIO function (function 0) if they're going to use the gpio in GPIO
> mode. Let's simplify things for driver authors by implementing
> gpio_request_enable() for this pinctrl driver to mux out the GPIO
> function when the gpio is use from gpiolib.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Patch applied for v4.20 with Bjorn's ACK.

Yours,
Linus Walleij
