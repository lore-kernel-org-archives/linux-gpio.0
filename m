From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1 2/2] pinctrl: qcom: spmi-gpio: Set is_enabled flag in set_mux()
Date: Fri, 20 Oct 2017 11:51:50 +0200
Message-ID: <CACRpkdZ65Myn7QdFwAqTrt9T+7-1FDu9DBqCz0VZizSY7BRctA@mail.gmail.com>
References: <20171013061550.996-1-fenglinw@codeaurora.org> <20171013061550.996-3-fenglinw@codeaurora.org>
 <20171016222955.GQ1165@minitux> <78f23ed8-7e3e-ffc9-bdbe-e10622e0c757@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78f23ed8-7e3e-ffc9-bdbe-e10622e0c757@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fenglin Wu <fenglinw@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2017 at 6:36 AM, Fenglin Wu <fenglinw@codeaurora.org> wrote=
:

> I am not sure if this is valid case but it would happen: The
> hardware or the sw prior to linux kernel has the default setting of the
> function and config for one GPIO but we need to keep it disabled until
> the consumer request it, in this case, we just need to define the pinmux
> and ignore the pinconf definition in its device node.

This firmware-kernel partitioning of responsibilities makes me nervous
every time it happens. Who's in charge really? Who fixes bugs? Firmware?
Linux? Linux overriding firmware? Linux overriding firmware on special
firmware revisions? Linux overriding firmware on special firmware revisions
that cannot be detected and instead needs to be passed as cmdline
parmeters?

This kind of stuff gives me the creeps and just a general feeling of not
being in control having very little clue as to what is really going on in
the system.

But I guess that is essentially the working assumption for things like
ACPI and other behind-my-back firmware: don't worry be happy.

Anyways, it's up to Bj=C3=B6rn to establish what is best for the qcom pin c=
ontrol,
I'm just gonna accept whatever he ACKs. Just rambling.

Yours,
Linus Walleij
