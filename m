From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] spmi: pmic-arb: revert "validate type when mapping IRQ"
Date: Fri, 8 Feb 2019 15:38:38 +0100
Message-ID: <CACRpkdab=MFffe27qK5qFo1kAKcZOOeGDkEwwHa3HF+EEq0qeQ@mail.gmail.com>
References: <20190208123635.26755-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208123635.26755-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Brian,

I simply applied this patch to the pin control tree so we get it
in with the rest of the patches.

On Fri, Feb 8, 2019 at 1:36 PM Brian Masney <masneyb@onstation.org> wrote:

> Validation of the IRQ type was added to spmi pmic-arb, however spmi-mpp
> in device tree still uses IRQ_TYPE_NONE. This commit caused the
> spmi-mpp probe to fail since platform_irq_count() would return 0.
> Correct this by backing out the previous patch.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: 135ef21ab064 ("spmi: pmic-arb: validate type when mapping IRQ")
> ---
> Linus: I think that the better longer-term approach is to just embed the
> IRQ counts similar to what is now in spmi-gpio.

That is most certainly better.

> Since we are getting
> close to the end of the dev cycle, I think it is safer to just drop
> the old patch for the time being. I'll commit to doing that work for the
> next dev cycle, although I can send you that change this weekend if you
> prefer that we go that route instead.

It's fine like this.

> My ssbi-gpio series does not have this issue.

OK!

Yours,
Linus Walleij
