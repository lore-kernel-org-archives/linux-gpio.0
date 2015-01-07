From: Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] mfd: dln2: add suspend/resume functionality
Date: Thu, 8 Jan 2015 02:16:15 +1300
Message-ID: <CAE1zotJ8RcSing2cQWPFzHoEiH1FH1-NsYZrShuQ=hVEwextug@mail.gmail.com>
References: <1418745435-2851-1-git-send-email-octavian.purdila@intel.com>
	<1418745435-2851-5-git-send-email-octavian.purdila@intel.com>
	<20150107102637.GD22905@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150107102637.GD22905@localhost>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 7, 2015 at 11:26 PM, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 16, 2014 at 05:57:15PM +0200, Octavian Purdila wrote:
>> Without suspend/resume functionality in the USB driver the USB core
>> will disconnect and reconnect the DLN2 port and because the GPIO
>> framework does not yet support removal of an in-use controller a
>> suspend/resume operation will result in a crash.
>>
>> This patch provides suspend and resume functions for the DLN2 driver
>> so that the above scenario is avoided.
>>
>> Signed-off-by: Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>
> This patch looks good now, but how did you say this device was powered?
>
> If powered by vbus you cannot assume that the device maintains it's
> state over a suspend cycle, something which would complicate matters
> quite a bit...
>

Yes, the device is powered by VBUS. During my tests, depending on the
host and USB port, VBUS is sometimes preserved - and this is the case
this patch addresses, and sometimes is not, but in that case because
no reset_resume routine is implemented the resume path will go through
the disconnect/reconnect process. This second case is not addressed by
the patch, as I think in this second case fixing the GPIO framework to
support the removal of an in-use device is the best way to go.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
