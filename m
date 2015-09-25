From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: msm: Remove unused driver
Date: Fri, 25 Sep 2015 09:20:59 -0700
Message-ID: <CACRpkda519TxyK9oKDR07m9oG1tUS-RbVLr4_rMBG18bvVyc2g@mail.gmail.com>
References: <1440798536-8337-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1440798536-8337-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2015 at 2:48 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Remove this driver now that Bjorn has introduced a pinctrl driver
> for msm8660 and the dts files have been updated with the pinctrl
> compatibles.
>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Andy Gross <agross@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Patch rebased and applied, thanks!
This concludes the modernization of the MSM GPIO and
pin control, awesome!

Yours,
Linus Walleij
