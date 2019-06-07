From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
Date: Fri, 7 Jun 2019 23:08:10 +0200
Message-ID: <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tengfei Fan <tengfeif@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, MSM <linux-arm-msm@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> wrote:

> The gpio interrupt status bit is getting set after the
> irq is disabled and causing an immediate interrupt after
> enablling the irq, so clear status bit on irq_unmask.
>
> Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>

This looks pretty serious, can one of the Qcom maintainers ACK
this?

Should it be sent to fixes and even stable?

Fixes: tag?

Yours,
Linus Walleij
