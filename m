From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] [v11] pinctrl: qcom: add support for sparse GPIOs
Date: Tue, 2 Jan 2018 10:16:35 +0100
Message-ID: <CACRpkdYhryd2qKxagw+orpUQaYCKU-x6RH5OB+pr_PTfzBaPng@mail.gmail.com>
References: <1513797033-9494-1-git-send-email-timur@codeaurora.org>
 <CACRpkdYtMbACG0D2zjgw-kN_3pb_VDGH_3DDhyMQD92eE5P0Gw@mail.gmail.com>
 <20171227020142.GZ7997@codeaurora.org> <CACRpkda5FQg3W4rnxihVB9y2yv-oF1CwBzFJsKB8cxzQ+zoHNg@mail.gmail.com>
 <20171228161556.GG7997@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171228161556.GG7997@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Andrew Cooks <andrew.cooks@opengear.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 28, 2017 at 5:15 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Patch 1 is still needed. Without that patch, we'll be poking each
> GPIO to figure out the direction at boot without checking any
> valid mask or calling the request APIs.

Aha, I just thought you'd augment that code to take valid GPIOs
into account.

Anyways, I left the patch in, so no worries.

> I don't see the part in
> debugfs where we show the direction of a GPIO if it hasn't been
> requested. Don't we skip over the unrequested GPIOs because of
> this code in gpiolib_dbg_show()?
>
>         if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
>                 ...
>                 continue;
>         }

Yes you're right. This is more for lsgpio and the chardev side
of things for inspecting lines really.

Yours,
Linus Walleij
