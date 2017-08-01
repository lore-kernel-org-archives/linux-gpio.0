From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2] [BUGFIX] gpio: reject invalid gpio before getting
 gpio_desc
Date: Tue, 1 Aug 2017 17:35:50 +0900
Message-ID: <20170801173550.4e63ceaa562d8e81ecfb1a25@kernel.org>
References: <150146625669.11567.9576692487524672090.stgit@devbox>
        <CACRpkdaOHQ+3mEPOOtztb5LN0pmvnJE5oWd524MgiaYkASYJ_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaOHQ+3mEPOOtztb5LN0pmvnJE5oWd524MgiaYkASYJ_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 1 Aug 2017 10:09:09 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Mon, Jul 31, 2017 at 3:57 AM, Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Check user-given gpio number and reject it before
> > calling gpio_to_desc() because gpio_to_desc() is
> > for kernel driver and it expects given gpio number
> > is valid (means 0 to 511).
> > If given number is invalid, gpio_to_desc() calls
> > WARN() and dump registers and stack for debug.
> > This means user can easily kick WARN() just by
> > writing invalid gpio number (e.g. 512) to
> > /sys/class/gpio/export.
> >
> > Fixes: 0e9a5edf5d01 ("gpio: fix deferred probe detection for legacy API")
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > ---
> >   Changes in v2:
> >    - Add gpio_to_valid_desc() according to Andy's comment (Thanks!).
> >    - Fix patch description.
> 
> I hate the old sysfs ABI sigh. Thanks for fixing it anyways!
> 
> Should this be tagged for stable?

Yes, I think so. Since this has been introduced 3 years ago,
it would be nice to go to older stable trees too.

Thanks,

> 
> Waiting for Andy's review before applying.
> 
> Yours,
> Linus Walleij


-- 
Masami Hiramatsu <mhiramat@kernel.org>
