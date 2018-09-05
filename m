From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: davinci: Use dev name for label and automatic
 base selection
Date: Wed, 5 Sep 2018 12:37:47 +0200
Message-ID: <CACRpkdYvNeKyfRf5Et5zC4=hcu9cfDubftRFRHtrKLN-5Snd1Q@mail.gmail.com>
References: <20180831191326.25106-1-afd@ti.com> <20180831191326.25106-2-afd@ti.com>
 <2a02c241-ac91-1bac-380d-122858bb03c3@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a02c241-ac91-1bac-380d-122858bb03c3@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "Andrew F. Davis" <afd@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 3, 2018 at 7:40 AM Keerthy <j-keerthy@ti.com> wrote:
> On Saturday 01 September 2018 12:43 AM, Andrew F. Davis wrote:
> > Use dev_name to get a unique label and use -1 for a base to get our
> > selection automatically. We pull in all GPIOs per chip now so this
> > does not have the effect of out of order labels like before.
> >
> > We do these both together so we can drop all the static data in one
> > patch. This also lets us normalize the return paths as we don't need
> > any cleanup after this change.
>
> echo 28 > /sys/class/gpio/export
> / # echo 28 > /sys/class/gpi[   12.839205] export_store: invalid GPIO 28
> o/export
> echo 2 > /sys/class/gp[   22.165728] export_store: invalid GPIO 2
> io/export
> / # echo 1 > /sys/class/gp[   25.961392] export_store: invalid GPIO 1
> io/export
> / # echo 3 > /sys/class/gp[   29.981918] export_store: invalid GPIO 3
> io/export
>
> Export fails with this patch. I am testing this on keystone-k2g-evm.

I think the GPIO got a new number didn't it?

Did you check the gpio file in debugfs to see which number
it got.

This is sadly the global numberspace that we are tying to
get rid of (new apps/scripts should use the chardev).

Are there applications that rely on the sysfs ABI on DaVinci?

In that case base needs to be prerseved.

Yours,
Linus Walleij
