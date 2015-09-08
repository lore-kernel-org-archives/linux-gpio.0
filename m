From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Propagate errors from chip->get()
Date: Tue, 8 Sep 2015 15:02:36 +0200
Message-ID: <CACRpkdZFNmF_CmkkmR=HjUfS--jvFe=xTP5X6EvR88gJHE1_kA@mail.gmail.com>
References: <1440780258-23652-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440780258-23652-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2015 at 6:44 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> It's possible to have gpio chips hanging off unreliable remote buses
> where the get() operation will fail to acquire a readout of the current
> gpio state. Propagate these errors to the consumer so that they can
> act on, retry or ignore these failing reads, instead of treating them as
> the line being held high.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

This patch applied for fixes with Alex' Review-tag.
Thanks for fixing this!

Should I even tag it for stable?

Yours,
Linus Walleij
