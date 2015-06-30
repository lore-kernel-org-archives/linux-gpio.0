From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/2] USB: ftdi_sio: add CBUS mode for FT232R devices
Date: Tue, 30 Jun 2015 08:54:03 +0200
Message-ID: <20150630065403.GA16582@localhost>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
 <1434838377-8042-2-git-send-email-stefan@agner.ch>
 <CACRpkdbAEJAf0jGCtcXi23scFPYtJeLrkBo6FoRqwJ8X4kmPTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:32905 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846AbbF3GyD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 02:54:03 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbAEJAf0jGCtcXi23scFPYtJeLrkBo6FoRqwJ8X4kmPTA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Greg KH <gregkh@linuxfoundation.org>, Sascha Silbe <x-linux@infra-silbe.de>, hachti@hachti.de, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2015 at 08:46:51AM +0200, Linus Walleij wrote:
> On Sun, Jun 21, 2015 at 12:12 AM, Stefan Agner <stefan@agner.ch> wrote:
> 
> > Add interface to allow CBUS access. The functions set_bitmode and
> > read_pins use control transfers only hence should not interfere
> > with the serial operation mode.
> >
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Interesting. Waiting for Johan's review on both patches.

See the discussion in the cover letter thread. 

	https://lkml.org/lkml/2015/6/20/205

Johan
