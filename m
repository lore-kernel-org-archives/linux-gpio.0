From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpio-intel-mid: fix the incorrect return of idle callback
Date: Wed, 29 Jan 2014 13:06:06 -0800
Message-ID: <20140129210606.GD13185@psi-dev26.jf.intel.com>
References: <52E76F71.4080304@intel.com>
 <20140128164937.GA30226@saruman.home>
 <20140128172413.GA31821@psi-dev26.jf.intel.com>
 <20140128181206.GB31977@saruman.home>
 <20140129001357.GA13185@psi-dev26.jf.intel.com>
 <52E8AC7C.5070903@intel.com>
 <20140129191232.GC13185@psi-dev26.jf.intel.com>
 <20140129195230.GC32149@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:45354 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752584AbaA2VBL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 29 Jan 2014 16:01:11 -0500
Content-Disposition: inline
In-Reply-To: <20140129195230.GC32149@saruman.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, "xinhui.pan" <xinhuix.pan@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, yanmin_zhang@linux.intel.com

On Wed, Jan 29, 2014 at 01:52:30PM -0600, Felipe Balbi wrote:
> On Wed, Jan 29, 2014 at 11:12:32AM -0800, David Cohen wrote:
> > On Wed, Jan 29, 2014 at 03:23:40PM +0800, xinhui.pan wrote:
> > >=20
> > > =E4=BA=8E 2014=E5=B9=B401=E6=9C=8829=E6=97=A5 08:13, David Cohen =
=E5=86=99=E9=81=93:
> > > > On Tue, Jan 28, 2014 at 12:12:06PM -0600, Felipe Balbi wrote:
> > > >> On Tue, Jan 28, 2014 at 09:24:13AM -0800, David Cohen wrote:
> > > >>> On Tue, Jan 28, 2014 at 10:49:37AM -0600, Felipe Balbi wrote:
> > > >>>> On Tue, Jan 28, 2014 at 04:50:57PM +0800, xinhui.pan wrote:
> > > >>>>> From: "xinhui.pan" <xinhuiX.pan@intel.com>
> > > >>>>>
> > > >>>>> intel_gpio_runtime_idle should return correct error code if=
 it do fail.
> > > >>>>> make it more correct even though -EBUSY is the most possibl=
e return value.
> > > >>>>>
> > > >>>>> Signed-off-by: bo.he <bo.he@intel.com>
> > > >>>>> Signed-off-by: xinhui.pan <xinhuiX.pan@intel.com>
> > > >>>>> ---
> > > >>>>>  drivers/gpio/gpio-intel-mid.c |    4 +++-
> > > >>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >>>>>
> > > >>>>> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/g=
pio-intel-mid.c
> > > >>>>> index d1b50ef..05749a3 100644
> > > >>>>> --- a/drivers/gpio/gpio-intel-mid.c
> > > >>>>> +++ b/drivers/gpio/gpio-intel-mid.c
> > > >>>>> @@ -394,7 +394,9 @@ static const struct irq_domain_ops inte=
l_gpio_irq_ops =3D {
> > > >>>>> =20
> > > >>>>>  static int intel_gpio_runtime_idle(struct device *dev)
> > > >>>>>  {
> > > >>>>> -	pm_schedule_suspend(dev, 500);
> > > >>>>> +	int err =3D pm_schedule_suspend(dev, 500);
> > > >>>>> +	if (err)
> > > >>>>> +		return err;
> > > >>>>>  	return -EBUSY;
> > > >>>>
> > > >>>> wait, is it only me or this would look a lot better as:
> > > >>>>
> > > >>>> static int intel_gpio_runtime_idle(struct device *dev)
> > > >>>> {
> > > >>>> 	return pm_schedule_suspend(dev, 500);
> > > >>>> }
> > > >>>
> > > >>> The reply to your suggestion is probably in this commit :)
> > > >>>
> > > >>> ---
> > > >>> commit 45f0a85c8258741d11bda25c0a5669c06267204a
> > > >>> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >>> Date:   Mon Jun 3 21:49:52 2013 +0200
> > > >>>
> > > >>>     PM / Runtime: Rework the "runtime idle" helper routine
> > > >>> ---
> > > >>>
> > > >>> We won't return 0 from here.
> > > >>
> > > >> so you never want to return 0, why don't you, then:
> > > >>
> > > >> static int intel_gpio_runtime_idle(struct device *dev)
> > > >> {
> > > >> 	pm_schedule_suspend(dev, 500);
> > > >> 	return -EBUSY;
> > > >> }
> > > >=20
> > > > That's how it is currently :)
> > > >=20
> > > > But this patch is making the function to return a different cod=
e in case
> > > > of error. IMHO there is not much fuctional gain with it, but I =
see
> > > > perhaps one extra info for tracing during development.
> > > >=20
> > > > Anyway, I'll let Xinhui to do further comment since he's the au=
thor.
> > > >=20
> > > > Br, David
> > > >=20
> > > hi ,David & Balbi
> > >   I checked several drivers yesterday to see how they use pm_sche=
dule_suspend=20
> > > then found one bug in i2c. Also I noticed  gpio.=20
> > > I think returning a correct error code is important.So I change -=
EBUSY=20
> > > to *err*. To be honest,current code works well.
> >=20
> > In my experience, when I'm using fancy things like lauterbach a pro=
per
> > error code may save couple of minutes in my life :)
> >=20
> > I keep my ack here.
>=20
> fair enough, sorry for the noise ;-) It could still be simplified a b=
it:
>=20
> 	return err ?: -EBUSY;

Agreed :)
Xinhui, could we have this suggestion in your patch?

Br, David

>=20
> --=20
> balbi


--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
