From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] pinctrl: msm: Configure interrupts as input and
 gpio mode
Date: Wed, 29 Aug 2018 09:43:27 +0200
Message-ID: <CACRpkdau5Wnsq3NO2-HY_XSZ3TJHcX9hYU-W46ng+_BwOviqGA@mail.gmail.com>
References: <20180816200648.90458-1-swboyd@chromium.org> <20180816200648.90458-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816200648.90458-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 16, 2018 at 10:06 PM Stephen Boyd <swboyd@chromium.org> wrote:

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

Patch applied for v4.20 with Bjorn's ACK.

Yours,
Linus Walleij
