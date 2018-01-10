From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add GPIO support for the ACCES PCIe-IDIO-24 family
Date: Wed, 10 Jan 2018 14:40:34 +0100
Message-ID: <CACRpkdaxa2sZR7Tq2Y-AmofH6_hOHgoYWbO+KVdrFqbbeRQbsw@mail.gmail.com>
References: <20180109222145.2323-1-vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180109222145.2323-1-vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 9, 2018 at 11:21 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES PCIe-IDIO-24 device provides 56 lines of digital I/O (24 lines
> of optically-isolated non-polarized digital inputs for AC and DC control
> signals, 24 lines of isolated solid state FET digital outputs, and 8
> non-isolated TTL/CMOS compatible programmable I/O). An interrupt is
> generated when any of the inputs change state (low to high or high to
> low).
>
> Input filter control is not supported by this driver, and input filters
> are deactivated by this driver. These devices are capable of
> get_multiple and set_multiple functionality, but these functions have
> not yet been implemented for this driver. Change-Of-State (COS)
> detection functionality may be configured to fire interrupts on
> exclusively rising/falling edges, but this driver currently only
> implements COS detection for either both edges or none.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Really clean and nice work.

Yours,
Linus Walleij
