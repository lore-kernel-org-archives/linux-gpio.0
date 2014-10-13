From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH RESEND] gpio: lib-sysfs: Add 'wakeup' attribute
Date: Mon, 13 Oct 2014 16:47:07 -0700
Message-ID: <6c5c08b2a2924366ac79837e89d3a0ed@BL2FFO11FD056.protection.gbl>
References: <1409853506-26279-1-git-send-email-soren.brinkmann@xilinx.com>
 <CAAVeFuJdCd9Wx+Fq3_9okcnyva70zhZJ5njOho8pmPfgWG3+nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0093.outbound.protection.outlook.com ([157.56.111.93]:44917
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753894AbaJMXrQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Oct 2014 19:47:16 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuJdCd9Wx+Fq3_9okcnyva70zhZJ5njOho8pmPfgWG3+nA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Alexandre,

On Sat, 2014-10-11 at 01:54PM +0900, Alexandre Courbot wrote:
> On Fri, Sep 5, 2014 at 2:58 AM, Soren Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
> > Add an attribute 'wakeup' to the GPIO sysfs interface which allows
> > marking/unmarking a GPIO as wake IRQ.
> > The file 'wakeup' is created in each exported GPIOs directory, if a=
n IRQ
> > is associated with that GPIO and the irqchip implements set_wake().
> > Writing 'enabled' to that file will enable wake for that GPIO, whil=
e
> > writing 'disabled' will disable wake.
> > Reading that file will return either 'disabled' or 'enabled' depeni=
ng on
> > the currently set flag for the GPIO's IRQ.
> >
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > Hi all,
> >
> > I originally submitted this patch with a few fixes for Zynq's GPIO =
driver
> > (https://lkml.org/lkml/2014/8/29/391). Since this change is not jus=
t
> > Zynq-related and has broader impact, Linus asked me to post this ag=
ain, separate
> > from the Zynq series.
> >
> > Let me just quote myself from the original submission:
> > "I'm still not fully convinced that the gpio_keys are the best
> > replacement for the sysfs interface when it comes to inputs. For th=
at
> > reason and to have a way to do some quick wake testing, I'd like to
> > propose adding the ability to control wake through the sysfs interf=
ace
> > (patch 3)."
>=20
> I'm really sorry that I did not provide feedback sooner.  This is the
> kind of area (IRQ) where I am not too confident and typically like to
> hear what Linus has to say first. But I also have a few questions tha=
t
> you could maybe answer for my own education. :)
>=20
> >
> >         Thanks,
> >         S=C3=B6ren
> >
> >  drivers/gpio/gpiolib-sysfs.c | 75 ++++++++++++++++++++++++++++++++=
++++++++----
> >  1 file changed, 69 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sy=
sfs.c
> > index 5f2150b619a7..aaf021eaaff5 100644
> > --- a/drivers/gpio/gpiolib-sysfs.c
> > +++ b/drivers/gpio/gpiolib-sysfs.c
> > @@ -286,6 +286,56 @@ found:
> >
> >  static DEVICE_ATTR(edge, 0644, gpio_edge_show, gpio_edge_store);
> >
> > +static ssize_t gpio_wakeup_show(struct device *dev,
> > +               struct device_attribute *attr, char *buf)
> > +{
> > +       ssize_t                 status;
> > +       const struct gpio_desc  *desc =3D dev_get_drvdata(dev);
> > +       int                     irq =3D gpiod_to_irq(desc);
> > +       struct irq_desc         *irq_desc =3D irq_to_desc(irq);
> > +
> > +       mutex_lock(&sysfs_lock);
> > +
> > +       if (irqd_is_wakeup_set(&irq_desc->irq_data))
> > +               status =3D sprintf(buf, "enabled\n");
> > +       else
> > +               status =3D sprintf(buf, "disabled\n");
> > +
> > +       mutex_unlock(&sysfs_lock);
> > +
> > +       return status;
> > +}
> > +
> > +static ssize_t gpio_wakeup_store(struct device *dev,
> > +               struct device_attribute *attr, const char *buf, siz=
e_t size)
> > +{
> > +       int                     ret;
> > +       unsigned int            on;
> > +       struct gpio_desc        *desc =3D dev_get_drvdata(dev);
> > +       int                     irq =3D gpiod_to_irq(desc);
> > +
> > +       mutex_lock(&sysfs_lock);
> > +
> > +       if (sysfs_streq("enabled", buf))
> > +               on =3D true;
> > +       else if (sysfs_streq("disabled", buf))
> > +               on =3D false;
> > +       else
> > +               return -EINVAL;
>=20
> You forgot to release sysfs_lock before returning here.

Right, I will fix this and send a v2. Good catch.

>=20
> > +
> > +       ret =3D irq_set_irq_wake(irq, on);
>=20
> Just wondering: is it always safe to set the wake property of an IRQ
> even if the direction of its associated GPIO is output? Does it make
> sense at all to have the "wakeup" attribute file visible if the GPIO
> is an output one?
>=20
> > +
> > +       mutex_unlock(&sysfs_lock);
> > +
> > +       if (ret)
> > +               pr_warn("%s: failed to %s wake\n", __func__,
> > +                               on ? "enable" : "disable");
> > +
> > +       return size;
> > +}
> > +
> > +static DEVICE_ATTR(wakeup, 0644, gpio_wakeup_show, gpio_wakeup_sto=
re);
> > +
> >  static int sysfs_set_active_low(struct gpio_desc *desc, struct dev=
ice *dev,
> >                                 int value)
> >  {
> > @@ -526,7 +576,7 @@ static struct class gpio_class =3D {
> >  int gpiod_export(struct gpio_desc *desc, bool direction_may_change=
)
> >  {
> >         unsigned long           flags;
> > -       int                     status;
> > +       int                     status, irq;
> >         const char              *ioname =3D NULL;
> >         struct device           *dev;
> >         int                     offset;
> > @@ -582,11 +632,24 @@ int gpiod_export(struct gpio_desc *desc, bool=
 direction_may_change)
> >                         goto fail_unregister_device;
> >         }
> >
> > -       if (gpiod_to_irq(desc) >=3D 0 && (direction_may_change ||
> > -                                      !test_bit(FLAG_IS_OUT, &desc=
->flags))) {
> > -               status =3D device_create_file(dev, &dev_attr_edge);
> > -               if (status)
> > -                       goto fail_unregister_device;
> > +       irq =3D gpiod_to_irq(desc);
> > +       if (irq >=3D 0) {
> > +               struct irq_desc *irq_desc =3D irq_to_desc(irq);
> > +               struct irq_chip *irqchip =3D irq_desc_get_chip(irq_=
desc);
> > +
> > +               if (direction_may_change ||
> > +                               !test_bit(FLAG_IS_OUT, &desc->flags=
)) {
> > +                       status =3D device_create_file(dev, &dev_att=
r_edge);
> > +                       if (status)
> > +                               goto fail_unregister_device;
> > +               }
> > +
> > +               if (irqchip->flags & IRQCHIP_SKIP_SET_WAKE ||
> > +                               irqchip->irq_set_wake) {
> > +                       status =3D device_create_file(dev, &dev_att=
r_wakeup);
> > +                       if (status)
> > +                               goto fail_unregister_device;
> > +               }
>=20
> Ok, I guess that answers my question. The edge property is always
> visible so it probably doesn't hurt if the wakeup property also is.

Right, it is probably not optimal, but serves the purpose. Users still
might have to turn on their brain. But in general, setting those
properties should be safe, IMHO.
I think being able to mess with GPIO's direction and value is a much
bigger risk since they might be used for something more critical than
just LEDs :)
So, this does not really add a lot of more potential to break things :)

>=20
> The only thing that bothers me a little bit is that both "edge" and
> "wakeup" are not very explicit names, but I guess it can't be helped.

I guess edge is ABI and that ship has sailed. For 'wakeup' we can still
discuss the name. But wakeup is the standard property that is exposed i=
n
sysfs for other devices that support wake and choose to expose
user-space control for it. So, I thought 'wakeup' would be appropriate
here as well.

>=20
> Typically I am not too fond of adding features to this sysfs
> interface, but since this patch is purely local to gpiolib-sysfs.c an=
d
> exposes a property that is arguably not less worthy that the others t=
o
> be exposed, I'm ok with it.
>=20
> Once the lock issue I mentioned above is fixed, please feel free to a=
dd my
>=20
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks for reviewing.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
