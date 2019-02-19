From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 1/7] irq/irq_sim: add irq_set_type() callback
Date: Tue, 19 Feb 2019 13:40:33 +0000
Message-ID: <20190219134033.23a53fc1@why.wild-wind.fr.eu.org>
References: <20190218164138.24921-1-brgl@bgdev.pl>
        <20190218164138.24921-2-brgl@bgdev.pl>
        <20190219122524.2e2b01db@why.wild-wind.fr.eu.org>
        <CAMRc=McPh3ox-eLGdS=VdmJOsxHeYwRTTjHfay9oEAr4QfjV1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=McPh3ox-eLGdS=VdmJOsxHeYwRTTjHfay9oEAr4QfjV1g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, 19 Feb 2019 14:20:03 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> wt., 19 lut 2019 o 13:25 Marc Zyngier <marc.zyngier@arm.com> napisał(a):
> >
> > On Mon, 18 Feb 2019 17:41:32 +0100
> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >  
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Implement the irq_set_type() callback and call irqd_set_trigger_type()
> > > internally so that users interested in the configured trigger type can
> > > later retrieve it using irqd_get_trigger_type().
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  kernel/irq/irq_sim.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> > > index 98a20e1594ce..83ecc65d8be2 100644
> > > --- a/kernel/irq/irq_sim.c
> > > +++ b/kernel/irq/irq_sim.c
> > > @@ -25,10 +25,18 @@ static void irq_sim_irqunmask(struct irq_data *data)
> > >       irq_ctx->enabled = true;
> > >  }
> > >
> > > +static int irq_sim_set_type(struct irq_data *data, unsigned int type)
> > > +{
> > > +     irqd_set_trigger_type(data, type);
> > > +
> > > +     return 0;  
> >
> > You keep ignoring the requirement for sanitization of the trigger type.
> > Frankly, I'm getting tired of fighting over 3 lines of incorrect code.
> >  
> 
> It used to be there in previous versions, but I removed it on purpose
> in v5. I understand why we needed that earlier, but if we now moved
> *all* the logic behind the trigger type to the users of this API and
> we're now simply storing any config we get, then why would we impose
> any limits on it here? We don't do this now and this patch doesn't
> change the current behavior. I really don't understand how not
> rejecting certain trigger types makes this patch incorrect.

You expose a new set_type callback. Only a set of valid values can be
handled by the users of this interface. At least your mockup gpio only
handles a narrow set of configuration. Not rejecting erroneous values
is a bug. This isn't a new requirement; this is how the irqchip API
works, as drivers do expect such a failure if requiring an invalid
type.

> > I guess that despite all the noise, you don't really want this code in
> > after all.
> >  
> 
> I do want and need this, but I really can't figure out from your
> reviews how you imagine the correct solution. You said previously that
> the irq_set_type callback should push the configuration to wherever
> it's needed.

Yes. But it doesn't mean it should accept something that cannot be
handled by the irqchip. If you push it to the code that does the
handling, it still has to return an error if the backing code decides
that this is not a supported configuration.

At the end of the day, where you store it is irrelevant for the problem
at hand. There is an API, and you need to implement it correctly.

> I believe the above patch does this. Should we then limit
> the supported trigger types? That would mean that irq_sim would need
> to know what users support. It seems inverted to me, but if you think
> it's right, then my question is: will accepting only IRQ_TYPE_NONE,
> IRQ_TYPE_EDGE_RISING and IRQ_TYPE_EDGE_FALLING in the above function
> be enough for you to accept it? Is the rest fine?

IRQ_TYPE_NONE doesn't mean anything, apart from "whatever defaults were
there because I have no clue". In your case, I really don't see the
point. The EDGE settings are what you handle, and are the only values
that should be accepted.

As for the rest of the patches, I haven't looked at them, and probably
won't (if only because I'm on holiday and would like to do something
else...). All I'm asking from you is to give me a correct patch #1.
Once I see that, I'll gladly ack it.

	M.
-- 
Without deviation from the norm, progress is not possible.
