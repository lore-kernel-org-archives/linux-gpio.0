From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: baytrail: Clear interrupt triggering from
 pins that are in GPIO mode
Date: Fri, 6 Mar 2015 12:21:50 +0100
Message-ID: <CACRpkdZNOjty9=nigA+SKk3yC5vVjohwjd2Kg+KWV2EYixJ+ag@mail.gmail.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
	<1424695993-43707-3-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424695993-43707-3-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 23, 2015 at 1:53 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> If the pin is already configured as GPIO and it has any of the triggering
> flags set, we may get spurious interrupts depending on the state of the
> pin.
>
> Prevent this by clearing the triggering flags on such pins. However, if the
> pin is also configured as "direct IRQ" we leave the flags as is. Otherwise
> it will prevent interrupts that are routed directly to IO-APIC.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
