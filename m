From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/lynxpoint: check if the interrupt is enabled in IRQ handler
Date: Fri, 11 Oct 2013 12:57:37 +0200
Message-ID: <CACRpkda=C3+pkVsVbZAkasxyWGedNsb7oAKTt4ApnJ4Q+k9BCw@mail.gmail.com>
References: <1380638143-20040-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380638143-20040-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 1, 2013 at 4:35 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Checking LP_INT_STAT is not enough in the interrupt handler because its
> contents get updated regardless of whether the pin has interrupt enabled or
> not. This causes the driver to loop forever for GPIOs that are pulled up.
>
> Fix this by checking the interrupt enable bit for the pin as well.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes with Mathias ACK.

Should this be tagged for -stable as well?

Yours,
Linus Walleij
