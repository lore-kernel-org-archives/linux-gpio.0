From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] pinctrl: msm: Really mask level interrupts to prevent latching
Date: Mon, 18 Jun 2018 16:38:27 -0700
Message-ID: <CAD=FV=UhfffG__41+5yeiDEdN1DYeTkXEoqasc23fb1YKg9F9Q@mail.gmail.com>
References: <20180618205255.246104-1-swboyd@chromium.org> <20180618205255.246104-2-swboyd@chromium.org>
 <CAD=FV=WvsY_=Ko2QXvzmHOuy4O5Rh6+sRWZZOuSXyGC829ANag@mail.gmail.com> <152936452512.16708.5405608343995548468@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152936452512.16708.5405608343995548468@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Mon, Jun 18, 2018 at 4:28 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Doug Anderson (2018-06-18 15:43:06)
>>
>> On Mon, Jun 18, 2018 at 1:52 PM, Stephen Boyd <swboyd@chromium.org> wrote:
>>
>> > +        */
>> > +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
>> > +               val &= ~BIT(g->intr_raw_status_bit);
>> > +               writel(val, pctrl->regs + g->intr_cfg_reg);
>>
>> Do you know if it's important to do a 2nd write here, or could this be
>> combined with the next writel()?
>
> I haven't tried combining the writes. It felt safer to keep them split
> up so that both bits don't toggle at the same time, but I don't know if
> it actually matters.

Maybe I'm a glutton for punishment, but I'd say go for it, unless
someone from Qualcomm says "no way".

In the very least in the "unmask" case it seems pretty safe.  IMHO if
re-enabling the "raw" status caused a glitch we'd already be hitting
problems.  Specifically the glitch would end up getting latched
(whee!) and then we'd unmask and see the glitch anyway.

...and actually for the "mask" case it seems like you've written it
the less-safe way anyway.  We know that masking can't cause some sort
of glitch (since that's the old code), but I guess we don't know
whether disabling the "raw" status could cause a glitch.  To be the
absolutely safest you'd do the new disable of the "raw" status _after_
the old masking.  ...but as per above I'd just go whole hog and
combine them.  :-P

As with everything I write, feel free to tell me I'm being stupid and
I'll try to shut up.  ;-)


-Doug
