From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: cherryview: Prevent possible interrupt storm
 on resume
Date: Fri, 4 Nov 2016 16:14:11 +0100
Message-ID: <CACRpkdbNzjqxMTZspxSrXsva552nMM0=YTQEkEhc8SCsL2MUGg@mail.gmail.com>
References: <20161031145734.193016-1-mika.westerberg@linux.intel.com> <20161031145734.193016-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161031145734.193016-2-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2016 at 3:57 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> When the system is suspended to S3 the BIOS might re-initialize certain
> GPIO pins back to their original state or it may re-program interrupt mask
> of others. For example Acer TravelMate B116-M had BIOS bug where certain
> GPIO pin (MF_ISH_GPIO_5) was programmed to trigger on high level, and the
> pin state was high once the BIOS gave control to the OS on resume.
>
> This triggers lots of messages like:
>
>  irq 117, desc: ffff88017a61e600, depth: 1, count: 0, unhandled: 0
>  ->handle_irq():  ffffffff8109b613, handle_bad_irq+0x0/0x1e0
>  ->irq_data.chip(): ffffffffa0020180, chv_pinctrl_exit+0x2d84/0x12 [pinctrl_cherryview]
>  ->action():           (null)
>     IRQ_NOPROBE set
>
> We reset the mask back to known state in chv_pinctrl_resume() but that is
> called only after device interrupts have already been enabled.
>
> Now, this particular issue was fixed by upgrading the BIOS to the latest
> (v1.23) but not everybody upgrades their BIOSes so we fix it up in the
> driver as well.
>
> Prevent the possible interrupt storm by moving suspend and resume hooks to
> be called at _noirq time instead. Since device interrupts are still
> disabled we can restore the mask back to known state before interrupt storm
> happens.
>
> Reported-by: Christian Steiner <christian.steiner@outlook.de>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
