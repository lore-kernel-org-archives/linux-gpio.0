From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Fri, 07 Jul 2017 09:48:48 +0200
Message-ID: <87y3s0adr3.fsf@miraculix.mork.no>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499374158-12388-2-git-send-email-agust@denx.de> (Anatolij
        Gustschin's message of "Thu, 6 Jul 2017 22:49:16 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

[adding Johan on the CC list]

Anatolij Gustschin <agust@denx.de> writes:

> +static struct usb_device_id ftdi_mfd_table[] =3D {
> +	{ USB_DEVICE(0x0403, 0x6014) },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(usb, ftdi_mfd_table);

This device ID is currently handled by the ftdi_sio driver, so I believe
you at least have to explain how you intend these two drivers to
cooperate...



Bj=C3=B8rn
