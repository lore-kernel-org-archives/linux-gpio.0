From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Add Intel Sunrisepoint pin controller and
 GPIO support
Date: Tue, 7 Apr 2015 15:18:20 +0200
Message-ID: <CACRpkdbhwOd9P56Hwn5XaOMrSTp--XW-i9aDXwmYR+GbzAWurQ@mail.gmail.com>
References: <1427725909-79500-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427725909-79500-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 30, 2015 at 4:31 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> This driver supports pinctrl/GPIO hardware found on Intel Sunrisepoint (a
> Skylake PCH) providing users a pinctrl and GPIO interfaces (including GPIO
> interrupts).
>
> The driver is split into core and platform parts so that the same core
> driver can be reused in other drivers for other Intel GPIO hardware that is
> based on the same host controller design.
>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

How could I possibly resist this gorgeous driver that just
does everything right? Patch applied for 4.1.

> +config PINCTRL_INTEL
> +       tristate
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIOLIB_IRQCHIP

Is this opening a refactoring possibility sharing more code/infrastructure
amongst the Intel drivers or just something that will be used for
new SoCs going forward?

Yours,
Linus Walleij
