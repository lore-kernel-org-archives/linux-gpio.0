From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we
 get a deferral
Date: Tue, 28 Mar 2017 18:03:00 +0300
Message-ID: <1490713380.708.32.camel@linux.intel.com>
References: <20170323202138.GA11912@dtor-ws>
         <CACRpkdZJxvLF2T4akRVSNa9SjS30_q_A-vd2OaLE4eMSye1EMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZJxvLF2T4akRVSNa9SjS30_q_A-vd2OaLE4eMSye1EMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2017-03-28 at 15:25 +0200, Linus Walleij wrote:
> On Thu, Mar 23, 2017 at 9:21 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > If, while locating GPIOs by name, we get probe deferral, we should
> > immediately report it to caller rather than trying to fall back to
> > parsing
> > unnamed GPIOs from _CRS block.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Can I get some indication from Mika/Rafael/Andy whether this is
> correct?

While Mika agrees on the change, I would like nevertheless to hear Hans'
opinion or even Tested-by tag since it was his fix around those lines.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
