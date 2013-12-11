From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: driver for Xtensa GPIO32
Date: Wed, 11 Dec 2013 14:38:54 +0200
Message-ID: <20131211123854.GH1217@tarshish>
References: <9b46369ab60c23a6bd9f1930c4ff6c2fec57e798.1386057874.git.baruch@tkos.co.il>
 <CACRpkdb7nLg6op+_oi=PB2FnVcErQGDhHk82PHk7Os9rG1XVKg@mail.gmail.com>
 <20131205054327.GH32492@tarshish>
 <CACRpkdZV-G8GSE7R+2cfriA0JxAhQz0nzsWOqMP9MEnzkrBVBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:50613 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751956Ab3LKMi6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 11 Dec 2013 07:38:58 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZV-G8GSE7R+2cfriA0JxAhQz0nzsWOqMP9MEnzkrBVBg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

Hi Linus,

On Wed, Dec 11, 2013 at 01:32:47PM +0100, Linus Walleij wrote:
> On Thu, Dec 5, 2013 at 6:43 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > We need to preserve the irq flags. Let me know if the following is OK:
> >
> > static inline unsigned long enable_cp(void)
> > {
> >         unsigned long flags, cpenable;
> >
> >         local_irq_save(flags);
> >         RSR_CPENABLE(cpenable);
> >         WSR_CPENABLE(cpenable | XCHAL_CP_PORT_MASK);
> >
> >         return flags;
> > }
> >
> > static inline void disable_cp(unsigned long flags)
> > {
> >         WSR_CPENABLE(cpenable);
> >         local_irq_restore(flags);
> > }
> 
> Looks OK.

Done in v2.

> >> > +static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
> >> > +                                   int value)
> >> > +{
> >> > +}
> >>
> >> This is a rather nasty implementation for something that will always
> >> fail. What about putting an dev_err(gc->dev, "..."); in that set_value?
> >
> > This is an input only device, so this callback should never run. Ideally it
> > would be nice to just have it NULL, but the core gpiolib doesn't support that.
> > Are you sure bloating the kernel with an error message that never displays is
> > worth it?
> 
> Yes I am sure. If you think a few lines of error message is too much,
> you can add a BUG(); here instead.

Will do in v3.

> >> Why not device_initcall()? (i.e. same as module_init())
> >> Do you need it very early?
> >
> > The main use case for this driver is for intra-core signaling, so it might be
> > needed quite early I guess. I don't need any specific need for it to be
> > available early at the moment, so I can change it device_initcall() if you
> > prefer that.
> 
> Please do that for now, thanks. We shouldn't stick strange stuff
> in because "may need later", as this can lead to weird stuff that people
> don't dare to change. (Cargo-cult phenomenon.)

Done in v2.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
