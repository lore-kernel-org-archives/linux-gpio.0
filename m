From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] USB: ftdi_sio: add CBUS mode for FT232R devices
Date: Tue, 30 Jun 2015 08:46:51 +0200
Message-ID: <CACRpkdbAEJAf0jGCtcXi23scFPYtJeLrkBo6FoRqwJ8X4kmPTA@mail.gmail.com>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
	<1434838377-8042-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:35807 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751496AbbF3Gqv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 02:46:51 -0400
Received: by obbop1 with SMTP id op1so466703obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2015 23:46:51 -0700 (PDT)
In-Reply-To: <1434838377-8042-2-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Greg KH <gregkh@linuxfoundation.org>, Sascha Silbe <x-linux@infra-silbe.de>, hachti@hachti.de, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Jun 21, 2015 at 12:12 AM, Stefan Agner <stefan@agner.ch> wrote:

> Add interface to allow CBUS access. The functions set_bitmode and
> read_pins use control transfers only hence should not interfere
> with the serial operation mode.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Interesting. Waiting for Johan's review on both patches.

Need his or Greg's ACK on patch 1 if I should merge through the GPIO
tree.

Yours,
Linus Walleij
