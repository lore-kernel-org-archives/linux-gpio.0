From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 armsoc/drivers/bus+gpio 1/5] bus: Add support for
 Moxtet bus
Date: Fri, 8 Mar 2019 14:15:21 +0100
Message-ID: <CACRpkdb+mR_=tC89AS6XzuB0STb4-H-DHhf+yM8K33V809A60g@mail.gmail.com>
References: <20190307125251.724-1-marek.behun@nic.cz> <20190307125251.724-2-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307125251.724-2-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 7, 2019 at 1:53 PM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote:

> On the Turris Mox router different modules can be connected to the main
> CPU board: currently a module with a SFP cage, a module with MiniPCIe
> connector, a PCIe pass-through MiniPCIe connector module, a 4-port
> switch module, an 8-port switch module, and a 4-port USB3 module.
>
> For example:
>   [CPU]-[PCIe-pass-through]-[PCIe]-[8-port switch]-[8-port switch]-[SFP]
>
> Each of this modules has an input and output shift register, and these
> are connected via SPI to the CPU board.
>
> Via SPI we are able to discover which modules are connected, in which
> order, and we can also read some information about the modules (eg.
> their interrupt status), and configure them.
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
> It also implements a virtual interrupt controller for the modules which
> send their interrupt status over the SPI shift register. These modules
> do this in addition to sending their interrupt status via the shared
> interrupt line. When the shared interrupt is triggered, we read from the
> shift register and handle IRQs for all devices which are in interrupt.
>
> The topology of how Mox modules are connected can then be read by
> listing /sys/bus/moxtet/devices.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
