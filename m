From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Fix possible use after free on label
Date: Fri, 2 Nov 2018 12:12:24 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1811021205400.1498@knanqh.ubzr>
References: <20181101131250.41636-1-smuchun@gmail.com> <CACRpkdaURruTj6W=ozXpKEvLpxLa=6tLdDywac1uj61Hg8ZKpA@mail.gmail.com> <CACRpkdZ_jrNNB7n0DOuL6n_JtupiwacbMxWcockTak9F8fdAjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ_jrNNB7n0DOuL6n_JtupiwacbMxWcockTak9F8fdAjA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: smuchun@gmail.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, 2 Nov 2018, Linus Walleij wrote:

> On Thu, Nov 1, 2018 at 4:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Nov 1, 2018 at 2:13 PM Muchun Song <smuchun@gmail.com> wrote:
> >
> > > gpiod_request_commit() copies the pointer to the label passed as
> > > an argument only to be used later. But there's a chance the caller
> > > could immediately free the passed string(e.g., local variable).
> > > This could trigger a use after free when we use gpio label(e.g.,
> > > gpiochip_unlock_as_irq(), gpiochip_is_requested()).
> > >
> > > To be on the safe side: duplicate the string with kstrdup_const()
> > > so that if an unaware user passes an address to a stack-allocated
> > > buffer, we won't get the arbitrary label.
> > >
> > > Also fix gpiod_set_consumer_name().
> > >
> > > Signed-off-by: Muchun Song <smuchun@gmail.com>
> >
> > I am still a bit worried about the kstrdup_const() that this
> > introduces.
> 
> Forget it. I realized after actually reading the code
> for kstrdup_const() that it really does exactly
> what we want.
> 
> I should stop assuming things are syntactic sugar
> in the kernel, we have some really smart people
> working with it...

I didn't know about kstrdup_const() either before just now.

If the device tree lands in the kernel rodata area then all is fine. I 
don't know enough about the actual DT processing to be sure though.


Nicolas
