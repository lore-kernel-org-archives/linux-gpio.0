From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 bus+gpio 1/4] bus: Add support for Moxtet bus
Date: Fri, 9 Nov 2018 10:59:20 +0100
Message-ID: <CACRpkdZRi_prZK=EwFF86bWEC26+ajr9F9s3ALqVi-rQW+r2AQ@mail.gmail.com>
References: <20181102103539.6077-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102103539.6077-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: marek.behun@nic.cz
Cc: ext Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 2, 2018 at 11:35 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote=
:

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
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>

This looks fine to me. Maybe strange with "gpio" in the
subject of the mail? Consider adding sysfs ABI documentation
in Documentation/ABI/testing/*
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
