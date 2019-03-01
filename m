From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 bus+gpio 3/5] bus: moxtet: Add sysfs documentation
Date: Fri, 1 Mar 2019 15:34:26 +0100
Message-ID: <CACRpkdam_CYGtph16McpQQ_WwohpZr+Rzi1B=re4UrGxXmSEqg@mail.gmail.com>
References: <20190301035852.26780-1-marek.behun@nic.cz> <20190301035852.26780-4-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301035852.26780-4-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 1, 2019 at 4:59 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote:

> Add sysfs ABI documentation for the attribute files module_id,
> module_name, input_value and output_value of Moxtet devices.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>

(...)
> +++ b/Documentation/ABI/testing/sysfs-bus-moxtet-devices
> @@ -0,0 +1,25 @@
> +What:          /sys/bus/moxtet/devices/moxtet-<name>.<addr>/module_id
> +Date:          March 2019
> +KernelVersion: 5.2
> +Contact:       Marek Beh=C3=BAn <marek.behun@nic.cz>
> +Description:   (R) Moxtet module ID. Format: %x
> +
> +What:          /sys/bus/moxtet/devices/moxtet-<name>.<addr>/module_name
> +Date:          March 2019
> +KernelVersion: 5.2
> +Contact:       Marek Beh=C3=BAn <marek.behun@nic.cz>
> +Description:   (R) Moxtet module name. Format: string

These look good.

> +What:          /sys/bus/moxtet/devices/moxtet-<name>.<addr>/input_value
> +Date:          March 2019
> +KernelVersion: 5.2
> +Contact:       Marek Beh=C3=BAn <marek.behun@nic.cz>
> +Description:   (R) Read input value from module at this Moxtet address.
> +               Format: %x
> +
> +What:          /sys/bus/moxtet/devices/moxtet-<name>.<addr>/output_value
> +Date:          March 2019
> +KernelVersion: 5.2
> +Contact:       Marek Beh=C3=BAn <marek.behun@nic.cz>
> +Description:   (RW) Read last written value or write value to the module=
 on
> +               this Moxtet address. Format: %x

What is the usecase for these?

If this is for debugging it should be in debugfs rather than in sysfs.

If it is here for random userspace drivers, we need some good explanation
as to why they can't just be kernel drivers.

Yours,
Linus Walleij
