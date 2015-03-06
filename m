From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: baytrail: Rework interrupt handling
Date: Fri, 6 Mar 2015 12:23:11 +0100
Message-ID: <CACRpkdaGtMmb5mNFK9Fbf29gWKRc3DM2SduM+9aQetcz_az1Gw@mail.gmail.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
	<1424695993-43707-4-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424695993-43707-4-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 23, 2015 at 1:53 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Instead of handling everything in the driver's first level interrupt
> handler, we can take advantage of already existing flow handlers that are
> provided by the IRQ core.
>
> This changes the functionality a bit also. Previously the driver looped
> over pending interrupts in a single loop, restarting the loop if some
> interrupt changed state. This caused problem with Lenovo Thinkpad 10
> digitizer that it was not able to deassert the interrupt before the driver
> disabled the interrupt for good (looplimit was exhausted).
>
> Rework the interrupt handling logic a bit so that we provide proper mask,
> ack and unmask operations in terms of Baytrail GPIO hardware and loop over
> pending interrupts only once. If the interrupt remains asserted the first
> level handler will be re-triggered automatically.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
