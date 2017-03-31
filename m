From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Fri, 31 Mar 2017 15:28:22 +0200
Message-ID: <20170331152822.20d30bb4@bbrezillon>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
        <CACRpkdZ6w_tuzSNmFE=2BpeASNOSq0cV4fYM6F8-57Q2+3n-aQ@mail.gmail.com>
        <20170330132946.41314874@bbrezillon>
        <3422ee23-53b5-8d09-2a5e-d700358ab09d@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3422ee23-53b5-8d09-2a5e-d700358ab09d@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Hatliff <hatliff@cadence.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, 30 Mar 2017 18:26:01 +0100
Simon Hatliff <hatliff@cadence.com> wrote:


> > Another solution would be to write 0xffffffff into CDNS_GPIO_OUTPUT_EN
> > at probe time so that each time CDNS_GPIO_DIRECTION_MODE is modified to
> > set a pin in output mode, the CDNS_GPIO_OUTPUT_EN is already correctly
> > configured.
> > Simon, would that work? Is there a good reason to keep a bit in
> > CDNS_GPIO_OUTPUT_EN set to 0 when the GPIO is in input mode (power
> > consumption?)?  
> If direction_mode is set to input then output_en is ignored so this 
> should work.  The hardware defaults to output mode, so as long as you 
> set all pins to input mode before you set all output_en bits there 
> should be no negative effect.

Okay, I'll try something like that, except I'll probably keep already
output-enabled in their existing state to avoid modifying bootloader's
GPIO settings.

Thanks for the feedback.

Boris
