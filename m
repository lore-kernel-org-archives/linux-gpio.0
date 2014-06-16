From: Philipp Hachtmann <hachti@hachti.de>
Subject: Re: [PATCH] USB: ftdi_sio: add GPIO support
Date: Mon, 16 Jun 2014 09:15:55 +0200
Message-ID: <539E99AB.9030907@hachti.de>
References: <1402320115-13171-1-git-send-email-x-linux@infra-silbe.de> <20140610105631.GA10256@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140610105631.GA10256@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Sascha Silbe <x-linux@infra-silbe.de>
Cc: Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

> Would this patch interfere with adding support for using the CBUS pins
> as GPIOs while operating in normal UART mode?

Most interesting question!

>> Care was taken to prevent using GPIOs if the serial device is in use
>> and vice versa.

What about CBUS GPIO support?

> Ok, so we're not extending the serial driver with support for
> controlling some unused pins (e.g. CBUS) but rather implementing support
> for a mutually exclusive mode.
For bitbang mode (on the data lines) - yes. But for bitbang on CBUS - no.


I have sent a proposal a few weeks ago but Greg did not like special 
sysfs stuff :-P
He asked me to use the GPIO subsystem for the CBUS pins. I am out of 
time until july. But I still want and need CBUS support in parallel with 
serial/FIFO operation.


Regards

Philipp
