From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Thu, 17 Mar 2016 17:14:24 +0200
Message-ID: <874mc5uofj.fsf@intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com> <20160311093856.GN1796@lahna.fi.intel.com> <0DD381DBF8F68D419C32ACFCEB28EB2521D1032C@SHSMSX101.ccr.corp.intel.com> <20160314085002.GY1796@lahna.fi.intel.com> <0DD381DBF8F68D419C32ACFCEB28EB2521D10643@SHSMSX101.ccr.corp.intel.com> <CACRpkdbT9w+XXOUSuzGY+NUkxkKvoUK7KXMRi8R5TJK8Ytk+KQ@mail.gmail.com> <0DD381DBF8F68D419C32ACFCEB28EB2521D10AC2@SHSMSX101.ccr.corp.intel.com> <CACRpkdZ25kGPZ7SfeactfqY9PNrH4++v0V727Rbmh-NQCLuE4w@mail.gmail.com> <20160316133412.GN14170@phenom.ffwll.local> <CACRpkdZfOtgNpnR9i-_pwP8Wsc9YrwtTLwN9n=ADCV9g4265kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:45314 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030970AbcCQPOg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 17 Mar 2016 11:14:36 -0400
In-Reply-To: <CACRpkdZfOtgNpnR9i-_pwP8Wsc9YrwtTLwN9n=ADCV9g4265kg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Felipe Balbi <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "Westerberg, Mika" <mika.westerberg@intel.com>, Hans Holmberg <hans.holmberg@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, "Zha, Qipeng" <qipeng.zha@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Zheng, Qi" <qi.zheng@intel.com>

On Thu, 17 Mar 2016, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Mar 16, 2016 at 2:34 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Wed, Mar 16, 2016 at 01:27:49PM +0100, Linus Walleij wrote:
>
>>> - What is a HPD interrupt?
>>
>> hotplug interrupt, fires when you plug in a cable.
>>
>>> - What is a Type-C DP HPD?
>>
>> usb type C connector can multiplex both DisplayPort and USB, you need to
>> renegotiate the lane splitting every time the sink changes, i.e. on each
>> hotplug.
>
> OK I understand, thanks a lot!
>
>>> - Again why can't you just use a notifier or function call?
>>
>> Because windows sucks, hence all that coordination happens through hw
>> forwarded interrupts and magic registers. Same horror story on the sound
>> side, where the sound driver needs to know what kind of PCM stream the
>> monitor can take. It's hilarious. Except when they screw up the design and
>> then need to fake parts of it in software.
>
> So the story is something like that these IRQs have been put into
> hardware in order to compensate for flaws in Windows device driver
> model, I see.
>
> If there are such special registers in some hardware I guess I'm all for
> implementing some generic quirk in gpiolib for people who need to
> software-trigger GPIO IRQs. Could be good for testing too, as there
> are such registers in ARMs PL061 GPIO controller for test, just so as
> to simulate a GPIO IRQ.
>
> gpiod_trig_irq() would work with me, I'm happy to support whatever
> the GPIO hardware can do usually.
>
>> In sound we've switched over to a proper sw interface, and we tie the
>> different parts (drm graphics driver and alsa snd driver) using the
>> component.c framework.
>
> Hm is that solution or something similar proper for USB connector
> as well I wonder... I was thinking about just adding $random_notifier
> but maybe that is a bit ugly :/
>
>>> What is VPG? Now it seems Intel's internal organization is being used as
>>> part of the argument to get this change in and that makes me a bit
>>> annoyed.
> (...)
>> There was chat of usb type C support for forever, but I was always
>> promised that we don't need any interactions on the sw side and it's all
>> magic in hw. There hasn't been any real design discussions in the open
>> source group. VPG is the hw/windows group and generally comes up with
>> "interesting" designs not suitable for upstream.
>>
>> Feel free to just nack this stuff, and please cc intel-gfx/dri-devel in
>> the future (since I tend to ignore everything that's not cc'ed to mailing
>> lists I don't care about, even when I'm on cc personally). I've added them
>> all to cc.
>
> Thanks a lot Daniel, I understand better now. I'm not really against
> adding this "interesting" workaround if that is how Windows works,
> we usually have to go by their standards. From the GPIO point
> of view it is OK, just something the GPIO can do. I would be more
> worried about what the USB PHY maintainer (Felipe) is going to say
> about this.

Adding Felipe's current address. Considering the new domain part of the
address, I'm hopeful we can sort this out. ;)

BR,
Jani.

>
> Yours,
> Linus Walleij
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Technology Center
