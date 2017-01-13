From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/6] pinctrl: Add a possibility to configure pins from
 a gpiolib based drivers
Date: Fri, 13 Jan 2017 18:33:24 +0200
Message-ID: <20170113163324.GI25630@lahna.fi.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
 <20170110143201.53539-4-mika.westerberg@linux.intel.com>
 <CACRpkdbFotEknW2dK0ouc2HWLLhL-MERJS_BvCm5ux5hrEsQsg@mail.gmail.com>
 <20170111133304.GQ2330@lahna.fi.intel.com>
 <20170112092255.GX2330@lahna.fi.intel.com>
 <CACRpkdZjQipUkPxGTzJBF_L0EK8dg4wiW5DSCTft15aJ0UiLxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZjQipUkPxGTzJBF_L0EK8dg4wiW5DSCTft15aJ0UiLxQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2017 at 04:36:42PM +0100, Linus Walleij wrote:
> On Thu, Jan 12, 2017 at 10:22 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > Hmm, looking at users of .set_debounce() I can see that the debounce
> > time can be quite large. For example some signals which are connected to
> > physical push-buttons may need > 64ms debounce time.
> >
> > However, the current pinconfig value is defined to be unsigned long
> > which on 32-bit architecture is 32-bits. From that the higher 16-bits
> > are used as config leaving the value to be 16-bits. This gives maximum
> > debounce time of 65535us. I don't think it can cover all the uses of
> > .set_debounce(). This could also be problematic when specifying values
> > for pull resistors.
> >
> > One solution is to convert the packed value to be u64 instead, leaving
> > up to 48-bits for the value. Alternatively we could provide a scale
> > field with the packed format.
> 
> Hm yeah as long as all in-kernel users survive I don't see why we
> couldn't just make it 64bit. Is it a big deal?

As long as everyone is using those macros and inline functions from
pinconf-generic.h, I think the conversion should be pretty
straightforward.
