From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: intel: Allow requesting pins which are in
 ACPI mode as GPIOs
Date: Tue, 27 Oct 2015 13:31:25 +0100
Message-ID: <CACRpkdYRc96HEAsUSryMu3v2-p9siN+3WR3oTXK1N9ExXRUuYA@mail.gmail.com>
References: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
	<1445422125-72075-3-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445422125-72075-3-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2015 at 12:08 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Reserved for ACPI actually means that in such case the GPIO hardware will
> not update the interrupt status register (GPI_IS) even if the pin is
> configured to trigger an interrupt. It will update GPI_GPE_STS instead and
> does not trigger an interrupt.
>
> Allow using such pins as GPIOs, only prevent their usage as interrupts.
>
> We also rename function intel_pad_reserved_for_acpi() to be
> intel_pad_acpi_mode() which reflects the actual meaning better.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
