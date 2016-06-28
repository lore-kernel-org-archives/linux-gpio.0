From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 2/3] mfd: lpc_ich: Prepare to split lpc-ich driver
Date: Tue, 28 Jun 2016 11:26:49 +0300
Message-ID: <CAHp75VfOcDJS-Pz-v9c7nMKtyzeYCK6n=V=vHUsUQp2yQb52sg@mail.gmail.com>
References: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com> <1467100608-11549-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467100608-11549-3-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, ptyser@xes-inc.com, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2016 at 10:56 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:
> This patch follows the example of mfd/wm831x and splits it into an
> interface independent core since it is growing quite fast with
> many table entries.

I didn't see a split below. It is just a rename. And actually it would
be better to indeed have rename as a separate change.

>
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> ---
>  drivers/mfd/Makefile       |    1 +
>  drivers/mfd/lpc_ich-core.c | 1126 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mfd/lpc_ich.c      | 1126 --------------------------------------------

It can't be reviewed in this form.
Please use parameters (-M, for example) to git format-patch.

-- 
With Best Regards,
Andy Shevchenko
