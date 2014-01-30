From: "xinhui.pan" <mnipxh@gmail.com>
Subject: Re: [PATCH] gpio-intel-mid: fix the incorrect return of idle callback
Date: Thu, 30 Jan 2014 20:15:00 +0800
Message-ID: <52EA4244.5000509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:48092 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752750AbaA3MPT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jan 2014 07:15:19 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: balbi@ti.com, david.a.cohen@linux.intel.com
Cc: yanmin_zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, xinhuix.pan@intel.com

On Wed, 29 Jan 2014 13:06, David Cohen wrote:
> On Wed, Jan 29, 2014 at 01:52:30PM -0600, Felipe Balbi wrote:
>> On Wed, Jan 29, 2014 at 11:12:32AM -0800, David Cohen wrote:
>>> On Wed, Jan 29, 2014 at 03:23:40PM +0800, xinhui.pan wrote:
>>>>
>>>> =E4=BA=8E 2014=E5=B9=B401=E6=9C=8829=E6=97=A5 08:13, David Cohen =E5=
=86=99=E9=81=93:
>>>>> On Tue, Jan 28, 2014 at 12:12:06PM -0600, Felipe Balbi wrote:
>>>>>> On Tue, Jan 28, 2014 at 09:24:13AM -0800, David Cohen wrote:
>>>>>>> On Tue, Jan 28, 2014 at 10:49:37AM -0600, Felipe Balbi wrote:
>>>>>>>> On Tue, Jan 28, 2014 at 04:50:57PM +0800, xinhui.pan wrote:
>>>>>>>>> From: "xinhui.pan" <xinhuiX.pan@intel.com>
>>>>>>>>>
>>>>>>>>> intel_gpio_runtime_idle should return correct error code if i=
t do fail.
>>>>>>>>> make it more correct even though -EBUSY is the most possible =
return value.
>>>>>>>>>
>>>>>>>>> Signed-off-by: bo.he <bo.he@intel.com>
>>>>>>>>> Signed-off-by: xinhui.pan <xinhuiX.pan@intel.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpio/gpio-intel-mid.c |    4 +++-
>>>>>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpi=
o-intel-mid.c
>>>>>>>>> index d1b50ef..05749a3 100644
>>>>>>>>> --- a/drivers/gpio/gpio-intel-mid.c
>>>>>>>>> +++ b/drivers/gpio/gpio-intel-mid.c
>>>>>>>>> @@ -394,7 +394,9 @@ static const struct irq_domain_ops intel_=
gpio_irq_ops =3D {
>>>>>>>>>
>>>>>>>>>  static int intel_gpio_runtime_idle(struct device *dev)
>>>>>>>>>  {
>>>>>>>>> -	pm_schedule_suspend(dev, 500);
>>>>>>>>> +	int err =3D pm_schedule_suspend(dev, 500);
>>>>>>>>> +	if (err)
>>>>>>>>> +		return err;
>>>>>>>>>  	return -EBUSY;
>>>>>>>>
>>>>>>>> wait, is it only me or this would look a lot better as:
>>>>>>>>
>>>>>>>> static int intel_gpio_runtime_idle(struct device *dev)
>>>>>>>> {
>>>>>>>> 	return pm_schedule_suspend(dev, 500);
>>>>>>>> }
>>>>>>>
>>>>>>> The reply to your suggestion is probably in this commit :)
>>>>>>>
>>>>>>> ---
>>>>>>> commit 45f0a85c8258741d11bda25c0a5669c06267204a
>>>>>>> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>>>>> Date:   Mon Jun 3 21:49:52 2013 +0200
>>>>>>>
>>>>>>>     PM / Runtime: Rework the "runtime idle" helper routine
>>>>>>> ---
>>>>>>>
>>>>>>> We won't return 0 from here.
>>>>>>
>>>>>> so you never want to return 0, why don't you, then:
>>>>>>
>>>>>> static int intel_gpio_runtime_idle(struct device *dev)
>>>>>> {
>>>>>> 	pm_schedule_suspend(dev, 500);
>>>>>> 	return -EBUSY;
>>>>>> }
>>>>>
>>>>> That's how it is currently :)
>>>>>
>>>>> But this patch is making the function to return a different code =
in case
>>>>> of error. IMHO there is not much fuctional gain with it, but I se=
e
>>>>> perhaps one extra info for tracing during development.
>>>>>
>>>>> Anyway, I'll let Xinhui to do further comment since he's the auth=
or.
>>>>>
>>>>> Br, David
>>>>>
>>>> hi ,David & Balbi
>>>>   I checked several drivers yesterday to see how they use pm_sched=
ule_suspend=20
>>>> then found one bug in i2c. Also I noticed  gpio.=20
>>>> I think returning a correct error code is important.So I change -E=
BUSY=20
>>>> to *err*. To be honest,current code works well.
>>>
>>> In my experience, when I'm using fancy things like lauterbach a pro=
per
>>> error code may save couple of minutes in my life :)
>>>
>>> I keep my ack here.
>>
>> fair enough, sorry for the noise ;-) It could still be simplified a =
bit:
>>
>> 	return err ?: -EBUSY;
>=20
> Agreed :)
> Xinhui, could we have this suggestion in your patch?
>=20
> Br, David
>=20

Hi all,
  I am xinhui pan. Thanks to the VPN problem, I can't access Intel's ne=
twork. So I have to send you this email by personal email address.
I am on Spring Festival vacation until Feb 9th. Sorry for that.
  Your suggestion is very nice,thanks :)=20
  I will  generate V2 patch ASAP when my vocation is over. Thanks for a=
ll your help.

>>
>> --=20
>> balbi
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
