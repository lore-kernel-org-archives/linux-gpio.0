From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-mpp: Fix drive strength setting
Date: Mon, 10 Sep 2018 09:31:47 +0200
Message-ID: <CACRpkdY74znEYMsjAWMn_Erj9KZGzy0DAjRm2FJuFJjEr3HBQg@mail.gmail.com>
References: <20180831005852.156465-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831005852.156465-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 31, 2018 at 2:58 AM Stephen Boyd <swboyd@chromium.org> wrote:

> It looks like we parse the drive strength setting here, but never
> actually write it into the hardware to update it. Parse the setting and
> then write it at the end of the pinconf setting function so that it
> actually sticks in the hardware.
>
> Fixes: 0e948042c420 ("pinctrl: qcom: spmi-mpp: Implement support for sink mode")
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
