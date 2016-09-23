From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: intel: Configure GPIO chip IRQ as wakeup interrupts
Date: Fri, 23 Sep 2016 15:15:00 +0200
Message-ID: <CACRpkdZAfxq9BXz3goQY1n+esR9Nij_vh+9NtvkBxXAFCXtscg@mail.gmail.com>
References: <1474500923-84047-1-git-send-email-nilesh.bacchewar@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474500923-84047-1-git-send-email-nilesh.bacchewar@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nilesh Bacchewar <nilesh.bacchewar@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 22, 2016 at 1:35 AM, Nilesh Bacchewar
<nilesh.bacchewar@intel.com> wrote:

> On some Intel BXT platform, wake-up from suspend-to-idle on pressing
> power-button is not working. Its noticed that gpio-keys driver marking the
> second level IRQ/power-button as wake capable but Intel pintctrl
> driver is missing to mark GPIO chip/controller IRQ which first level IRQ
> as wake cable if its GPIO pin IRQ is wakeble. So, though the first level
> IRQ gets generated on power-button press, since it is not marked as
> wake capable resume/wake-up flow is not happening.
> Intel pintctrl/GPIO driver need to mark GPIO chip/controller IRQ (first
> level IRQ) as wake capable iff GPIO pin's IRQ (second level IRQ) is marked
> as wake cable.
>
> Changes in v2:
>  - Add missing irq initialisation.
>
> Signed-off-by: Nilesh Bacchewar <nilesh.bacchewar@intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
