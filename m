From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] pinctrl: msm: Configure interrupts as input and gpio mode
Date: Tue, 19 Jun 2018 08:48:13 -0700
Message-ID: <CAD=FV=VfGkOepP3KgYXZLq5esy6rWLr8zf8xiYoPOPN5vmCgGA@mail.gmail.com>
References: <20180618205255.246104-1-swboyd@chromium.org> <20180618205255.246104-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618205255.246104-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Mon, Jun 18, 2018 at 1:52 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> When requesting a gpio as an interrupt, we should make sure to mux the
> pin as the GPIO function and configure it to be an input so that various
> functions or output signals don't affect the interrupt state of the pin.
> So far, we've relied on pinmux configurations in DT to handle this, but
> let's explicitly configure this in the code so that DT implementers
> don't have to get this part right.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 37 ++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

This seems like a reasonable idea to me.  I'm not a huge fan of all
the boilerplate code copied from gpiochip_irq_reqres() and
gpiochip_irq_relres(), but it looks like that's the way it's done at
the moment.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
