From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Thu, 17 Mar 2016 15:41:27 +0100
Message-ID: <CACRpkdZfOtgNpnR9i-_pwP8Wsc9YrwtTLwN9n=ADCV9g4265kg@mail.gmail.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
	<20160311093856.GN1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D1032C@SHSMSX101.ccr.corp.intel.com>
	<20160314085002.GY1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D10643@SHSMSX101.ccr.corp.intel.com>
	<CACRpkdbT9w+XXOUSuzGY+NUkxkKvoUK7KXMRi8R5TJK8Ytk+KQ@mail.gmail.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D10AC2@SHSMSX101.ccr.corp.intel.com>
	<CACRpkdZ25kGPZ7SfeactfqY9PNrH4++v0V727Rbmh-NQCLuE4w@mail.gmail.com>
	<20160316133412.GN14170@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160316133412.GN14170-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Zheng, Qi" <qi.zheng-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hans Holmberg <hans.holmberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Westerberg, Mika" <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Zha, Qipeng" <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2016 at 2:34 PM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> On Wed, Mar 16, 2016 at 01:27:49PM +0100, Linus Walleij wrote:

>> - What is a HPD interrupt?
>
> hotplug interrupt, fires when you plug in a cable.
>
>> - What is a Type-C DP HPD?
>
> usb type C connector can multiplex both DisplayPort and USB, you need to
> renegotiate the lane splitting every time the sink changes, i.e. on each
> hotplug.

OK I understand, thanks a lot!

>> - Again why can't you just use a notifier or function call?
>
> Because windows sucks, hence all that coordination happens through hw
> forwarded interrupts and magic registers. Same horror story on the sound
> side, where the sound driver needs to know what kind of PCM stream the
> monitor can take. It's hilarious. Except when they screw up the design and
> then need to fake parts of it in software.

So the story is something like that these IRQs have been put into
hardware in order to compensate for flaws in Windows device driver
model, I see.

If there are such special registers in some hardware I guess I'm all for
implementing some generic quirk in gpiolib for people who need to
software-trigger GPIO IRQs. Could be good for testing too, as there
are such registers in ARMs PL061 GPIO controller for test, just so as
to simulate a GPIO IRQ.

gpiod_trig_irq() would work with me, I'm happy to support whatever
the GPIO hardware can do usually.

> In sound we've switched over to a proper sw interface, and we tie the
> different parts (drm graphics driver and alsa snd driver) using the
> component.c framework.

Hm is that solution or something similar proper for USB connector
as well I wonder... I was thinking about just adding $random_notifier
but maybe that is a bit ugly :/

>> What is VPG? Now it seems Intel's internal organization is being used as
>> part of the argument to get this change in and that makes me a bit
>> annoyed.
(...)
> There was chat of usb type C support for forever, but I was always
> promised that we don't need any interactions on the sw side and it's all
> magic in hw. There hasn't been any real design discussions in the open
> source group. VPG is the hw/windows group and generally comes up with
> "interesting" designs not suitable for upstream.
>
> Feel free to just nack this stuff, and please cc intel-gfx/dri-devel in
> the future (since I tend to ignore everything that's not cc'ed to mailing
> lists I don't care about, even when I'm on cc personally). I've added them
> all to cc.

Thanks a lot Daniel, I understand better now. I'm not really against
adding this "interesting" workaround if that is how Windows works,
we usually have to go by their standards. From the GPIO point
of view it is OK, just something the GPIO can do. I would be more
worried about what the USB PHY maintainer (Felipe) is going to say
about this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
