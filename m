From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Add Intel Sunrisepoint pin controller and
 GPIO support
Date: Wed, 8 Apr 2015 16:52:53 +0200
Message-ID: <CACRpkdaoidr5RJs6d+4Vxtc9HXw6HOXsfQkqkui0h6za0_BQZA@mail.gmail.com>
References: <1427725909-79500-1-git-send-email-mika.westerberg@linux.intel.com>
	<CACRpkdbhwOd9P56Hwn5XaOMrSTp--XW-i9aDXwmYR+GbzAWurQ@mail.gmail.com>
	<20150407134201.GA1734@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150407134201.GA1734@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2015 at 3:42 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> We are going to use the same core for newer hardware as much as
> possible. Hopefully all new SoCs will have GPIO controller which is
> based on the same hardware design.
>
> For the existing, unfortunately the hardware differentiates too much
> from Sunrisepoint that it does not make much sense to factor them to use
> this new core.

OK fine. I was going to enquire into the similarity of this embedded Intel
HW IP to the old StrongARM, Xscale, and PXA or whatever other
embedded Intel things that have been around for ages, sometimes IP
is inherited in the strangest ways. Oh well I guess we might see if we
look at the register maps a bit.

Yours,
Linus Walleij
