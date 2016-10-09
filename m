From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Configure GPIO chip IRQ as wakeup
 interrupts
Date: Sun, 9 Oct 2016 17:59:59 +0300
Message-ID: <20161009145959.GX30800@lahna.fi.intel.com>
References: <1474499002-76446-1-git-send-email-nilesh.bacchewar@intel.com>
 <CAHp75Veb7YwQNGugij_QGLi7rW6ohD52eRnX-aj4-nO=stxnjA@mail.gmail.com>
 <EDC3C55F9AA4D042AD86F2BFE2FD250C017A8102@FMSMSX102.amr.corp.intel.com>
 <CAHp75VcjwCR1W9+9wactFeGS4wEkLdU+PxbzvHXbwKK9NiBTmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcjwCR1W9+9wactFeGS4wEkLdU+PxbzvHXbwKK9NiBTmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Bacchewar, Nilesh" <nilesh.bacchewar@intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 07, 2016 at 10:40:42PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 7, 2016 at 9:17 PM, Bacchewar, Nilesh
> <nilesh.bacchewar@intel.com> wrote:
> > Here, Its marking  GPIO controller IRQ line as wake capable not GPIO lines.
> 
> AFAIU this is called per (GPIO) pin which is IRQ enabled.
> 
> Imagine a case when you have more than one such pin.
> 
> 1. Set IRQ wake for pin 1
> 2. Set IRQ wake for pin 2 (assume that is pin under the question)
> 3. Unset IRQ wake for pin 1 (for some reason)
> 4. Global pinctrl IRQ wake is unset. Resulting same issue as before.
> 
> What did I miss above?

enable/disable_irq_wake() include reference count.
