From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: intel: Add support for multiple GPIO chips
 sharing the interrupt
Date: Tue, 27 Oct 2015 13:29:54 +0100
Message-ID: <CACRpkdbO8K+rckMS8qY=YMBXCREdt_uS-pwqAGWj9NfG9gS80w@mail.gmail.com>
References: <1445422125-72075-1-git-send-email-mika.westerberg@linux.intel.com>
	<1445422125-72075-2-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445422125-72075-2-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2015 at 12:08 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> On Intel Broxton the GPIO hardware consists of several chips that all share
> the parent interrupt. It is not possible to handle this by setting chained
> handler for each chip (as they will overwrite each other).
>
> To overcome this we need to request the interrupt using devm_request_irq()
> and pass IRQF_SHARED with the flags.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Makes perfect sense. Patch applied.

Yours,
Linus Walleij
