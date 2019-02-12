From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] iio: adc: ti-ads7950: add GPIO support
Date: Tue, 12 Feb 2019 20:35:43 +0000
Message-ID: <20190212203544.181b8c19@archlinux>
References: <1549653856-47409-1-git-send-email-justinpopo6@gmail.com>
        <20190209170042.69a78684@archlinux>
        <2e692086-4be5-10ea-34b0-4444995c4275@lechnology.com>
        <20190211200557.7648d447@archlinux>
        <CAJx26kXdap3oSBREDfakwaWMz4oKxy=oaagP1jo4grD=kqJ2hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJx26kXdap3oSBREDfakwaWMz4oKxy=oaagP1jo4grD=kqJ2hA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Chen <justinpopo6@gmail.com>
Cc: David Lechner <david@lechnology.com>, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bgolaszewski@baylibre.com, Linus Walleij <linus.walleij@linaro.org>, knaack.h@gmx.de, lars@metafoo.de, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 11 Feb 2019 12:17:37 -0800
Justin Chen <justinpopo6@gmail.com> wrote:

> On Mon, Feb 11, 2019 at 12:06 PM Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > On Sat, 9 Feb 2019 12:56:11 -0600
> > David Lechner <david@lechnology.com> wrote:
> >  
> > > On 2/9/19 11:00 AM, Jonathan Cameron wrote:  
> > > > Nope.  This is a state lock used to protect against transitions between
> > > > different modes of the IIO device (buffered vs polled), it
> > > > isn't suitable for general use.
> > > >
> > > > The driver should be modified to handle that correctly.
> > > > We have iio_claim_direct_mode etc that deal with the case
> > > > where a device can't do certain operations whilst in buffered
> > > > mode.  Note it can fail and should.
> > > >
> > > > Seems there are more drivers still doing this than I thought.
> > > > If anyone is bored and wants to clean them out, that would be
> > > > most appreciated!
> > > >
> > > > If you need locking to protect a local buffer or the device
> > > > state, define a new lock to do it with clearly documented
> > > > scope.  
> > >
> > > Just as a reminder, there is a use case for this particular
> > > chip that requires buffered mode and direct mode at the same
> > > time.
> > >
> > > https://patchwork.kernel.org/patch/10539021/
> > > https://patchwork.kernel.org/patch/10527757/  
> >
> > Thanks, I had indeed forgotten that entirely.
> > So it should have a local lock and not take mlock explicitly at all.
> >  
> Thanks for all the feedback.
> So If I am understanding this correctly. I should create a local lock
> to synchronize three different type of transactions (buffered, direct,
> gpio).
> I do not want to use iio_claim_direct_mode because that doesn't allow
> simultaneous use of buffered mode and direct mode, which is necessary
> for this driver because of the above mentioned patch.
No, you should create a local lock to do just one thing. Protect
the buffers used in those transactions.  There is no need
to protect anything else explicitly.

On some devices there are multiple transaction writes, but I don't recall
that being the case here.

Jonathan

> 
> Justin
> > Jonathan  
