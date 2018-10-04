From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: protected pins and debugfs
Date: Thu, 4 Oct 2018 10:34:03 +0200
Message-ID: <CACRpkdazxOt0E0J8D763_Mc5RVxpYTrfNgHYkMVQB+GVi1S9Hw@mail.gmail.com>
References: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: psodagud@codeaurora.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 3, 2018 at 2:38 PM Sodagudi Prasad <psodagud@codeaurora.org> wrote:

> This is regarding the protected pins configuration reading and printing
> from non-secure operating systems.

I do not think anyone with security in mind should have debugfs
enabled. But maybe that is beside the point.

> GPIO framework is checking whether pin is in use(flag FLAG_REQUESTED) or
> not in gpiolib_dbg_show().
>
> If GPIO chip drivers are overriding the dbg_show callback, drivers are
> not checking whether a pin is really in use or not to print
> configuration details.
>      if (chip->dbg_show)
>                  chip->dbg_show(s, chip);
>          else
>                  gpiolib_dbg_show(s, gdev);

Ah that is right. Because some drivers can inspect all pins whether they
are requested or not.

> Can we use a simple/common solution like below?  It will check whether a
> pin is in use or not before printing configuration data with the help of
> gpiochip_is_requested().

In the msm case I think maybe you want to inspect the valid_mask
instead, so you display debugfs info for all pins you can inspect
in hardware but avoid the "invalid" ones which I half-guess is used
by ACPI in your case.

Yours,
Linus Walleij
