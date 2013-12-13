From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 1/2] gpio: msm: Fix irq mask/unmask by writing bits
 instead of numbers
Date: Thu, 12 Dec 2013 19:58:46 -0800
Message-ID: <20131213035845.GK11990@sonymobile.com>
References: <1386717544-478-1-git-send-email-sboyd@codeaurora.org>
 <CACRpkdY8W8tGVH-Os5neeFfHWjojdB5fBbjgWcsWkiMyJj=YAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY8W8tGVH-Os5neeFfHWjojdB5fBbjgWcsWkiMyJj=YAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu 12 Dec 11:02 PST 2013, Linus Walleij wrote:

> On Wed, Dec 11, 2013 at 12:19 AM, Stephen Boyd <sboyd@codeaurora.org>=
 wrote:
>=20
> > We should be writing bits here but instead we're writing the
> > numbers that correspond to the bits we want to write. Fix it by
> > wrapping the numbers in the BIT() macro. This fixes gpios acting
> > as interrupts.
> >
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>=20
> I've applied this for fixes and tagged for stable.
> Bj=F6rn, Rohit: OK?

This looks good.

JFYI; the pinctrl-msm is written with gpio-msm-v2 in mind as well, so r=
eplacing
it with pinctrl is on my todo list...

Regards,
Bjorn
