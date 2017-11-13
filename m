From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] [v7] pinctrl: qcom: add support for sparse GPIOs
Date: Mon, 13 Nov 2017 22:49:05 +0100
Message-ID: <CACRpkdbwe9+TovFYoD-W_9kabe+jsVbN6juJQBUzicq=1XDphg@mail.gmail.com>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org> <c219c289-9cad-f96c-f766-ec28af8f078d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <c219c289-9cad-f96c-f766-ec28af8f078d@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 13, 2017 at 8:19 PM, Timur Tabi <timur@codeaurora.org> wrote:

> Any chance of these patches going into 4.15?

Sadly no. The merge window is open.

>  I've been making lots of
> changes, but I haven't gotten a lot of feedback.  I still think that v7 i=
s
> more intrusive and risky than v5, with no real benefit.  But at this poin=
t,
> I just want something to be merged so that I stop thinking about it.

I am waiting for feedback from the maintainer(s) mainly Bj=C3=B6rn.

There are only so many people I really trust with reviewing
qualcomm pinctrl code: Bj=C3=B6rn and Stephen mainly.
Especially for the core of the driver.

>From what I have understood Qualcomm has one finger constantly
on the fast-forward button for upstreaming right now, which I think
is good (everyone should have!) but the limited number of trusted
maintainers of core infrastructure code makes bottlenecks form
around these drivers where review is really needed and deep queues
of patches form. Sorry.

If the manpower shortage persists maybe we can seek some
review from other major contributors to these drivers?
Varadarajan and Neil for example?

Yours,
Linus Walleij
