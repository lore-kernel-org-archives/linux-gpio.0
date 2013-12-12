From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: msm: Fix irq mask/unmask by writing bits
 instead of numbers
Date: Thu, 12 Dec 2013 20:02:27 +0100
Message-ID: <CACRpkdY8W8tGVH-Os5neeFfHWjojdB5fBbjgWcsWkiMyJj=YAA@mail.gmail.com>
References: <1386717544-478-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1386717544-478-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <Bjorn.Andersson@sonymobile.com>, Rohit Vaswani <rvaswani@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2013 at 12:19 AM, Stephen Boyd <sboyd@codeaurora.org> w=
rote:

> We should be writing bits here but instead we're writing the
> numbers that correspond to the bits we want to write. Fix it by
> wrapping the numbers in the BIT() macro. This fixes gpios acting
> as interrupts.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

I've applied this for fixes and tagged for stable.
Bj=F6rn, Rohit: OK?

Yours,
Linus Walleij
