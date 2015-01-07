From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 4/4] mfd: dln2: add suspend/resume functionality
Date: Wed, 7 Jan 2015 15:26:05 +0100
Message-ID: <20150107142605.GG22905@localhost>
References: <1418745435-2851-1-git-send-email-octavian.purdila@intel.com>
 <1418745435-2851-5-git-send-email-octavian.purdila@intel.com>
 <20150107102637.GD22905@localhost>
 <CAE1zotJ8RcSing2cQWPFzHoEiH1FH1-NsYZrShuQ=hVEwextug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE1zotJ8RcSing2cQWPFzHoEiH1FH1-NsYZrShuQ=hVEwextug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Octavian Purdila <octavian.purdila@intel.com>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 08, 2015 at 02:16:15AM +1300, Octavian Purdila wrote:
> On Wed, Jan 7, 2015 at 11:26 PM, Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Dec 16, 2014 at 05:57:15PM +0200, Octavian Purdila wrote:
> >> Without suspend/resume functionality in the USB driver the USB core
> >> will disconnect and reconnect the DLN2 port and because the GPIO
> >> framework does not yet support removal of an in-use controller a
> >> suspend/resume operation will result in a crash.
> >>
> >> This patch provides suspend and resume functions for the DLN2 driver
> >> so that the above scenario is avoided.
> >>
> >> Signed-off-by: Octavian Purdila <octavian.purdila@intel.com>
> >
> > This patch looks good now, but how did you say this device was powered?
> >
> > If powered by vbus you cannot assume that the device maintains it's
> > state over a suspend cycle, something which would complicate matters
> > quite a bit...
> 
> Yes, the device is powered by VBUS. During my tests, depending on the
> host and USB port, VBUS is sometimes preserved - and this is the case
> this patch addresses, and sometimes is not, but in that case because
> no reset_resume routine is implemented the resume path will go through
> the disconnect/reconnect process.

Yes, it depends on the host controller and I believe the common case is
to drop VBUS.

> This second case is not addressed by
> the patch, as I think in this second case fixing the GPIO framework to
> support the removal of an in-use device is the best way to go.

I agree.

But please do mention that this case is not handled in the commit
message.

Thanks,
Johan
