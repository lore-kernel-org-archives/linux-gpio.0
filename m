From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 bus+gpio 1/5] bus: Add support for Moxtet bus
Date: Tue, 5 Mar 2019 12:24:04 +0100
Message-ID: <CAK8P3a2gfj++xu9ZFFx_3KoYFEtOr3HfUk_u1zwQ_8ubQAPdag@mail.gmail.com>
References: <20190301035852.26780-1-marek.behun@nic.cz> <20190301035852.26780-2-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301035852.26780-2-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 1, 2019 at 5:02 AM Marek Behún <marek.behun@nic.cz> wrote:
>
> On the Turris Mox router different modules can be connected to the main
> CPU board: currently a module with a SFP cage, a module with MiniPCIe
> connector, a 4-port switch module, an 8-port switch module, and a 4-port
> USB3 module.
>
> For example:
>   [CPU]-[PCIe]-[8-port switch]-[8-port switch]-[SFP]
>
> Each of this modules has an input and output shift register, and these
> are connected via SPI to the CPU board.
>
> Via SPI we are able to discover which modules are connected, in which
> order, and we can also read some information about the modules or
> configure them.
> From each module 8 bits can be read (of which low 4 bits identify the
> module) and 8 bits can be written.
>
> For example from the module with a SFP cage we can read the LOS,
> TX-FAULT and MOD-DEF0 signals, while we can write TX-DISABLE and
> RATE-SELECT signals.
>
> This driver creates a new bus type, called "moxtet". For each Mox module
> it finds via SPI, it creates a new device on the moxtet bus so that
> drivers can be written for them.
>
> The topology of how Mox modules are connected can then be read by
> listing /sys/bus/moxtet/devices.
>
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

This looks very nice! I looked through the driver now and found nothing
to comment on other than the debugging properties that Linus already
mentioned, so please add my

Acked-by: Arnd Bergmann <arnd@arndb.de>

and submit the next version to soc@kernel.org so we can pick it up
for linux-5.2.

     Arnd
