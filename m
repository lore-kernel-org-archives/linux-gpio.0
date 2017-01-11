From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Remove impossible checks on container_of() result
Date: Wed, 11 Jan 2017 16:02:02 +0100
Message-ID: <CACRpkdaaMfBAb_-bHstsK2fyNR2j7VO8yOZ-fqKS7jbDayXb9w@mail.gmail.com>
References: <20170109194744.24152-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170109194744.24152-1-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 9, 2017 at 8:47 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> container_of() does pointer math on the pointer that's passed in.
> If it were to return a NULL pointer the value passed in would
> need to be perfectly offset from 0 to make that so. Remove these
> checks because they don't make sense.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Good point.

Patch applied.

Yours,
Linus Walleij
