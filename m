From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH] iio: adc: ti-ads7950: add GPIO support
Date: Sat, 9 Feb 2019 12:56:11 -0600
Message-ID: <2e692086-4be5-10ea-34b0-4444995c4275@lechnology.com>
References: <1549653856-47409-1-git-send-email-justinpopo6@gmail.com>
 <20190209170042.69a78684@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190209170042.69a78684@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, justinpopo6@gmail.com
Cc: linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2/9/19 11:00 AM, Jonathan Cameron wrote:
> Nope.  This is a state lock used to protect against transitions between
> different modes of the IIO device (buffered vs polled), it
> isn't suitable for general use.
> 
> The driver should be modified to handle that correctly.
> We have iio_claim_direct_mode etc that deal with the case
> where a device can't do certain operations whilst in buffered
> mode.  Note it can fail and should.
> 
> Seems there are more drivers still doing this than I thought.
> If anyone is bored and wants to clean them out, that would be
> most appreciated!
> 
> If you need locking to protect a local buffer or the device
> state, define a new lock to do it with clearly documented
> scope.

Just as a reminder, there is a use case for this particular
chip that requires buffered mode and direct mode at the same
time.

https://patchwork.kernel.org/patch/10539021/
https://patchwork.kernel.org/patch/10527757/
