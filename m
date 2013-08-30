From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: null pointer dereference in error handling in gpiolib.c
Date: Fri, 30 Aug 2013 09:29:29 +0200
Message-ID: <CACRpkdbRR2aVM3L=NfFWQQVwBvh8ndLsXxafKZCza=z5RPzOzg@mail.gmail.com>
References: <52202948.7010303@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52202948.7010303@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bird, Tim" <tim.bird@sonymobile.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 30, 2013 at 7:10 AM, Frank Rowand
<frank.rowand@sonymobile.com> wrote:

> Avoid calling desc_to_gpio() if desc->chip is NULL, as this will
> cause a kernel panic.
>
> In the code above the calls, there is a test for !chip, which
> comes to the 'fail' label if true. In this case, the code
> panics, since desc_to_gpio() uses desc->chip to look up the
> gpio number.
>
> An RFC patch that explained the cause of one example of panic when
> desc->chip is NULL and fixed that example
> (http://lkml.indiana.edu/hypermail/linux/kernel/1308.3/01473.html)
> was accepted.  This patch fixes the remaining locations which have
> the same problem.
>
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>

Hm it appears Alexandre has another idea on how it should be
fixed, but he was in a hurry and didn't provide a proper patch.

Let me cook something up so we can see of we can get
this right.

Yours,
Linus Walleij
