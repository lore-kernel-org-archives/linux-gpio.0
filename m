From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Fri, 7 Jul 2017 11:53:29 +0200
Message-ID: <20170707115329.06dcdb69@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <87y3s0adr3.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y3s0adr3.fsf@miraculix.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, 07 Jul 2017 09:48:48 +0200
Bjørn Mork bjorn@mork.no wrote:

>[adding Johan on the CC list]
>
>Anatolij Gustschin <agust@denx.de> writes:
>
>> +static struct usb_device_id ftdi_mfd_table[] = {
>> +	{ USB_DEVICE(0x0403, 0x6014) },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(usb, ftdi_mfd_table);  
>
>This device ID is currently handled by the ftdi_sio driver, so I believe
>you at least have to explain how you intend these two drivers to
>cooperate...

these drivers cannot cooperate, the different ftdi function modes
use same device pins as in UART mode. So, you either can use the
device in UART interface mode or in some different mode. I do not
load the ftdi_sio module or do unbind the USB device from the
ftdio_sio driver and bind it to the mfd driver, e.g.:

  sh -c "echo -n "3-2:1.0" > /sys/bus/usb/drivers/ftdi_sio/unbind"
  sh -c "echo -n "3-2:1.0" > /sys/bus/usb/drivers/ftdi-mfd/bind"

thanks,

Anatolij
