From: "xinhui.pan" <xinhuix.pan@intel.com>
Subject: Re: [PATCH] gpio-intel-mid: fix the incorrect return of idle callback
Date: Wed, 29 Jan 2014 15:23:40 +0800
Message-ID: <52E8AC7C.5070903@intel.com>
References: <52E76F71.4080304@intel.com> <20140128164937.GA30226@saruman.home> <20140128172413.GA31821@psi-dev26.jf.intel.com> <20140128181206.GB31977@saruman.home> <20140129001357.GA13185@psi-dev26.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:13956 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750834AbaA2HXq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 29 Jan 2014 02:23:46 -0500
In-Reply-To: <20140129001357.GA13185@psi-dev26.jf.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>, Felipe Balbi <balbi@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, yanmin_zhang@linux.intel.com


=E4=BA=8E 2014=E5=B9=B401=E6=9C=8829=E6=97=A5 08:13, David Cohen =E5=86=
=99=E9=81=93:
> On Tue, Jan 28, 2014 at 12:12:06PM -0600, Felipe Balbi wrote:
>> On Tue, Jan 28, 2014 at 09:24:13AM -0800, David Cohen wrote:
>>> On Tue, Jan 28, 2014 at 10:49:37AM -0600, Felipe Balbi wrote:
>>>> On Tue, Jan 28, 2014 at 04:50:57PM +0800, xinhui.pan wrote:
>>>>> From: "xinhui.pan" <xinhuiX.pan@intel.com>
>>>>>
>>>>> intel_gpio_runtime_idle should return correct error code if it do=
 fail.
>>>>> make it more correct even though -EBUSY is the most possible retu=
rn value.
>>>>>
>>>>> Signed-off-by: bo.he <bo.he@intel.com>
>>>>> Signed-off-by: xinhui.pan <xinhuiX.pan@intel.com>
>>>>> ---
>>>>>  drivers/gpio/gpio-intel-mid.c |    4 +++-
>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-in=
tel-mid.c
>>>>> index d1b50ef..05749a3 100644
>>>>> --- a/drivers/gpio/gpio-intel-mid.c
>>>>> +++ b/drivers/gpio/gpio-intel-mid.c
>>>>> @@ -394,7 +394,9 @@ static const struct irq_domain_ops intel_gpio=
_irq_ops =3D {
>>>>> =20
>>>>>  static int intel_gpio_runtime_idle(struct device *dev)
>>>>>  {
>>>>> -	pm_schedule_suspend(dev, 500);
>>>>> +	int err =3D pm_schedule_suspend(dev, 500);
>>>>> +	if (err)
>>>>> +		return err;
>>>>>  	return -EBUSY;
>>>>
>>>> wait, is it only me or this would look a lot better as:
>>>>
>>>> static int intel_gpio_runtime_idle(struct device *dev)
>>>> {
>>>> 	return pm_schedule_suspend(dev, 500);
>>>> }
>>>
>>> The reply to your suggestion is probably in this commit :)
>>>
>>> ---
>>> commit 45f0a85c8258741d11bda25c0a5669c06267204a
>>> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> Date:   Mon Jun 3 21:49:52 2013 +0200
>>>
>>>     PM / Runtime: Rework the "runtime idle" helper routine
>>> ---
>>>
>>> We won't return 0 from here.
>>
>> so you never want to return 0, why don't you, then:
>>
>> static int intel_gpio_runtime_idle(struct device *dev)
>> {
>> 	pm_schedule_suspend(dev, 500);
>> 	return -EBUSY;
>> }
>=20
> That's how it is currently :)
>=20
> But this patch is making the function to return a different code in c=
ase
> of error. IMHO there is not much fuctional gain with it, but I see
> perhaps one extra info for tracing during development.
>=20
> Anyway, I'll let Xinhui to do further comment since he's the author.
>=20
> Br, David
>=20
hi ,David & Balbi
  I checked several drivers yesterday to see how they use pm_schedule_s=
uspend=20
then found one bug in i2c. Also I noticed  gpio.=20
I think returning a correct error code is important.So I change -EBUSY=20
to *err*. To be honest,current code works well.=20
>>
>> just like drivers/tty/serial/mfd.c::serial_hsu_runtime_idle() is doi=
ng ?
>>
>> --=20
>> balbi
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
