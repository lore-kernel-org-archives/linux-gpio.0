From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pinctrl/rockchip: Don't call pinctrl_force_* for nothing
Date: Tue, 27 Feb 2018 12:51:23 -0800
Message-ID: <CAD=FV=XrtV_6etcXVtzb4OT3frCdK=LvpsnZisCwsH+OPYsXEg@mail.gmail.com>
References: <20180224200732.6116-1-marc.zyngier@arm.com>
 <2464665.XPfZqEy7lr@phil>
 <CAD=FV=XDc9Npn-ZensiYSPy6gVs81oGfnL+Q=_hpHRT+FgKc7g@mail.gmail.com>
 <24eb9ab9-e5b5-5f31-036a-a72cb6e8c300@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <24eb9ab9-e5b5-5f31-036a-a72cb6e8c300-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi,

On Tue, Feb 27, 2018 at 11:06 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> On 27/02/18 18:47, Doug Anderson wrote:
>> Hi,
>>
>> On Tue, Feb 27, 2018 at 7:05 AM, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
>>> Hi Marc,
>>>
>>> Am Samstag, 24. Februar 2018, 21:07:31 CET schrieb Marc Zyngier:
>>>> The rockchip pinctl driver calls pinctrl_force_default and
>>>> pinctrl_force_sleep on suspend resume, but seems to expect
>>>> that the outcome of these calls will be that nothing happens,
>>>> as the core code checks whether we're already in the right
>>>> state or not.
>>>>
>>>> Or at least, that was what the core code was doing until
>>>> 981ed1bfbc ("pinctrl: Really force states during suspend/resume"),
>>>> which gives the "force" qualifier its actual meaning.
>>>>
>>>> In turn, this breaks suspend/resume on the rk3399. So let's
>>>> change the rockchip code to do what it should have done from
>>>> the very begining, which is exactly *nothing*.
>>
>> Can you explain how exactly the patch broke suspend/resume?  I just
>> tried this once and it looks like the system resumes that later kinda
>> barfs all over the place.  Is that right?
>
> It sort of resumes, barfs about missing interrupts, various timeouts
> from the VOP and thermal sensors, and finally locks up. Not exactly
> usable. Either applying this patch or reverting 981ed1bfbc makes it
> behave again.

OK, then it's the same type of thing I'm seeing.


>>>> We take this opportunity to tidy-up the RK3288 GPIO6_C6 mux
>>>> resume workaround, making it symetrical to the suspend path.
>>>>
>>>> Tested on a rk3399-based kevin Chromebook.
>>>>
>>>> Fixes: 9198f509c888 ("pinctrl: rockchip: add suspend/resume functions")
>>>> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>>>
>>> Now that I had time to look at this a bit more, I'm not sure if removing
>>> that is the right solution.
>>>
>>> The force_sleep and force_suspend functions are meant for the "hog" pins,
>>> meaning the pins that just need to be configured once but are not claimed
>>> by any actual device - see everything named hog_* in the pinctrl core.
>>> And judging by the other users of them, using them like now is the expected
>>> usage.
>>>
>>>
>>> On the rk3399-gru boards, the hogged pins only have a default state and
>>> no sleep configuration and contain some pins like the ap_pwroff that
>>> sound somewhat strange :-)
>>
>> The "ap_pwroff" pin is a special-purpose function on rk3399.  When
>> this pin is configured as its special purpose it will automatically
>> indicate whether the system is suspended or not.  ...so we just need
>> to configure it once at bootup and it will continue to do its job.
>> There is no "driver" to own this pin which is why it's listed in the
>> hog.  So I don't think there's any issue with that pin.
>>
>>
>>> So my guess is that now something bad happens now that the state==oldstate
>>> check is gone.
>>
>> If I had to guess I'd first look at "wlan_module_reset_l".
>> Specifically for this pin:
>>
>> At bootup we wanted Linux to grab this pin and drive it low ASAP, much
>> before any WiFi-related drivers could get to it.  Basically the pin
>> was in a bad state (back-powering the WiFi module IIRC) and we wanted
>> to get out of that state ASAP.
>>
>> In reality even this early in kernel was a bit late to do this.  We
>> really needed the firmware to do it, and certainly before we shipped
>> we did put this in firmware.  However, we left the kernel change in
>> there because:
>> 1. It's nice not to rely on firmware.
>> 2. It shouldn't hurt to have this in the kernel.
>>
>>
>> OK, so in my mind I had a recollection that this pin was claimed by
>> _both_ the hog and the true user of this pin.  In my mind that was an
>> OK thing to do because the "hog" state would be the state of this pin
>> until a real driver came along and claimed true ownership of it.
>>
>> ...but looking at the actual dts that landed (and that I even reviewed
>> at <http://crosreview.com/368770>), we didn't list the pinctrl in the
>> actual "regulator" node.  Thus if the hog gets re-applied sometime
>> after bootup then we'll be in bad state.
>>
>> ---
>>
>> So what's the fix here?  Probably we can just move
>> "wlan_module_reset_l" out of the hog and put it in the "wlan-pd-n"
>> node where it belongs.  We'd essentially be relying on the fact that
>> this was fixed in firmware shortly after the kernel change landed and
>> there's a 0% change anyone has the old firmware.
>>
>>
>> In theory you could also try adding the pinctrl entry to the
>> "wlan-pd-n" node and leave it as a hog.  I think that's supposed to
>> work.  ...but after doing this, you'd need to make sure that the hog
>> properly releases control of the pin as long as it's claimed by
>> "wlan-pd-n" and doesn't try to re-apply the hog at suspend/resume
>> time.
>>
>> ---
>>
>> Anyway, hope that helps.  I tried making this change and doing a
>> suspend/resume and it didn't barf on me anymore, but I didn't stress
>> it out.
>
> Would you mind posting this patch? I'm happy to give it a go on my setup.

Sure.  Try out:

https://patchwork.kernel.org/patch/10246027/
arm64: dts: rockchip: Fix rk3399-gru-* s2r (pinctrl hogs, wifi reset)


>> NOTE: if you're wondering why the WiFi reset could make things so
>> badly behaved, we've definitely found that when the PCIe bus is in a
>> bad state that the whole system in general is just pretty broken...
>
> How reassuring! ;-)

Tell me about it.  It took a REALLY long time to track down a class of
bugs during development because they looked like general instability
(maybe bad voltage, or memory corruption, or bad SDRAM settings, or
...) and it really was just a bad PCIe access.  Sigh.


>> Oh, one last thing: we definitely do need to make sure that the
>> sleep/default hogs are applied on rk3288-veyron.  On those systems
>> we'd be in pretty bad shape if the "sleep" hogs didn't get applied at
>> suspend time.
>
> OK. So this patch is definitely the wrong thing to do.
>
> Thanks for all the context, much appreciated.

-Doug
