From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] iio: adc: ti-ads7950: add GPIO support
Date: Mon, 11 Feb 2019 20:05:57 +0000
Message-ID: <20190211200557.7648d447@archlinux>
References: <1549653856-47409-1-git-send-email-justinpopo6@gmail.com>
        <20190209170042.69a78684@archlinux>
        <2e692086-4be5-10ea-34b0-4444995c4275@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e692086-4be5-10ea-34b0-4444995c4275@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: justinpopo6@gmail.com, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, 9 Feb 2019 12:56:11 -0600
David Lechner <david@lechnology.com> wrote:

> On 2/9/19 11:00 AM, Jonathan Cameron wrote:
> > Nope.  This is a state lock used to protect against transitions between
> > different modes of the IIO device (buffered vs polled), it
> > isn't suitable for general use.
> > 
> > The driver should be modified to handle that correctly.
> > We have iio_claim_direct_mode etc that deal with the case
> > where a device can't do certain operations whilst in buffered
> > mode.  Note it can fail and should.
> > 
> > Seems there are more drivers still doing this than I thought.
> > If anyone is bored and wants to clean them out, that would be
> > most appreciated!
> > 
> > If you need locking to protect a local buffer or the device
> > state, define a new lock to do it with clearly documented
> > scope.  
> 
> Just as a reminder, there is a use case for this particular
> chip that requires buffered mode and direct mode at the same
> time.
> 
> https://patchwork.kernel.org/patch/10539021/
> https://patchwork.kernel.org/patch/10527757/

Thanks, I had indeed forgotten that entirely.
So it should have a local lock and not take mlock explicitly at all.

Jonathan
