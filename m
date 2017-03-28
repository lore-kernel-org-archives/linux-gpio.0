From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we
 get a deferral
Date: Tue, 28 Mar 2017 16:32:25 +0300
Message-ID: <20170328133225.GS2957@lahna.fi.intel.com>
References: <20170323202138.GA11912@dtor-ws>
 <CACRpkdZJxvLF2T4akRVSNa9SjS30_q_A-vd2OaLE4eMSye1EMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZJxvLF2T4akRVSNa9SjS30_q_A-vd2OaLE4eMSye1EMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 28, 2017 at 03:25:56PM +0200, Linus Walleij wrote:
> On Thu, Mar 23, 2017 at 9:21 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > If, while locating GPIOs by name, we get probe deferral, we should
> > immediately report it to caller rather than trying to fall back to parsing
> > unnamed GPIOs from _CRS block.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Can I get some indication from Mika/Rafael/Andy whether this is correct?

Sorry, I saw the patch but then forgot to ack it.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
