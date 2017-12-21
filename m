From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] [v11] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 21 Dec 2017 13:11:13 +0100
Message-ID: <CACRpkdYtMbACG0D2zjgw-kN_3pb_VDGH_3DDhyMQD92eE5P0Gw@mail.gmail.com>
References: <1513797033-9494-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1513797033-9494-1-git-send-email-timur@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Andrew Cooks <andrew.cooks@opengear.com>
List-Id: linux-gpio@vger.kernel.org

Hi Timur,

thank you for your perseverance. I am sorry that I am sometimes not
fast to respond :(

On Wed, Dec 20, 2017 at 8:10 PM, Timur Tabi <timur@codeaurora.org> wrote:

> Patch 1 reverts an old patch that triggers a get_direction of every
> pin upon init, without attempting to request the pins first.  The
> direction is already being queried when the pin is requested.
>
> Patch 2 adds support to pinctrl-msm for "unavailable" GPIOs.

I have applied both of these to the pinctrl "devel" branch so we
can see if all is fine.

They have Stephen's ACK so I am happy with them, I am just
still slightly worried about possible regressions because of
patch 1.

> Patch 3 extends that support to pinctrl-qdf2xxx.  A recent ACPI change
> on QDF2400 platforms blocks access to most pins, so the driver can only
> register a subset.

I see this one is still under discussion.

If nothing drastic happens with patch 1/2 in linux-next
it should be fine if you just resend this single patch in subsequent
submissions.

I think it may be worthwhile to keep Andrew Cooks in the loop for
future submissions as he's trying to solve similar problems for
AMD.

Yours,
Linus Walleij
