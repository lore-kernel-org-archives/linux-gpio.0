From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Sun, 15 Oct 2017 00:43:16 +0200
Message-ID: <CACRpkdYis3kNG45zmkTcP8vCutfRJkh5UjnzwFVeyLmFYFEC-A@mail.gmail.com>
References: <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
 <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org> <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
 <d53e67a2-4f69-752f-ba35-53872d9b9760@codeaurora.org> <CACRpkdYfAcKrgbgybccurUKTyR0E+tHDyzp7sbXxXxKuyMOGhQ@mail.gmail.com>
 <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org> <CACRpkdZFunwQ=tiQqsapap7Ozz42hr=df5vqbC0S5xy5Wn+ZWw@mail.gmail.com>
 <255ad0dc-2d16-ae7f-0b45-500e23cff1a4@codeaurora.org> <20171003220311.GU457@codeaurora.org>
 <CACRpkdYXsY5eixYkEeuZTHJn7q6_6BdTxZ-2yneUyEKUjKF3Gw@mail.gmail.com> <20171012073922.GB18706@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171012073922.GB18706@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Timur Tabi <timur@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 12, 2017 at 9:39 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> For qcom platforms the driver will never be able to return the
> direction for these certain pins because reading the register is
> not allowed by the firmware. Doing so will cause the device to
> crash with a security violation.

So I guess the driver needs to know what pin registers it can't
access so the user does not get a gun to shoot in the foot with.

If we augment gpiolib to just handle -EACCES or something
(-EIO?) from the driver .get_direction() callback for these lines,
things should be smooth?

Yours,
Linus Walleij
