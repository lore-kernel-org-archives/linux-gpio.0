From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
Date: Tue, 11 Jun 2019 11:51:01 -0700
Message-ID: <20190611185102.368ED21744@mail.kernel.org>
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org> <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com> <20190610145132.DD1132085A@mail.kernel.org> <46b715974766d5c557685a1ab9131abe@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46b715974766d5c557685a1ab9131abe@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tengfeif@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, MSM <linux-arm-msm@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting tengfeif@codeaurora.org (2019-06-11 03:41:26)
> On 2019-06-10 22:51, Stephen Boyd wrote:
> > Quoting Linus Walleij (2019-06-07 14:08:10)
> >> On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> =

> >> wrote:
> >>=20
> >> > The gpio interrupt status bit is getting set after the
> >> > irq is disabled and causing an immediate interrupt after
> >> > enablling the irq, so clear status bit on irq_unmask.
> >> >
> >> > Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
> >>=20
> >> This looks pretty serious, can one of the Qcom maintainers ACK
> >> this?
> >>=20
> >> Should it be sent to fixes and even stable?
> >>=20
> >> Fixes: tag?
> >>=20
> >=20
> > How is the interrupt status bit getting set after the irq is disabled?
> > It looks like this is a level type interrupt? I thought that after
> > commit b55326dc969e ("pinctrl: msm: Really mask level interrupts to
> > prevent latching") this wouldn't be a problem. Am I wrong, or is qcom
> > just clearing out patches on drivers and this is the last one that=20
> > needs
> > to be upstreamed?
>=20
> Your patch(commit b55326dc969e) can cover our issue, and my patch is no=20
> longer needed.
> Your patch isn't included in our code, so I submitted this patch.

Alright cool. Sounds like this patch can be dropped then and you can
pick up the patch from upstream into your vendor kernel.
