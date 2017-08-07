From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: Add FT232H CBUS GPIO driver
Date: Mon, 7 Aug 2017 11:24:50 +0200
Message-ID: <CACRpkda00FBjcWfX2g2MFPsTL_pnixSOfcfk5iM8Y6S-sSJBOA@mail.gmail.com>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <1499374158-12388-3-git-send-email-agust@denx.de> <CACRpkdb7jOtNscyJPJYXL+VmvwBtHmBH1hhwZ75rBquWpSUVMQ@mail.gmail.com>
 <20170801092404.GA30136@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801092404.GA30136@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Anatolij Gustschin <agust@denx.de>, Lee Jones <lee.jones@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-fpga@vger.kernel.org, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 1, 2017 at 11:24 AM, Johan Hovold <johan@kernel.org> wrote:
> On Tue, Aug 01, 2017 at 08:49:02AM +0200, Linus Walleij wrote:
>> On Thu, Jul 6, 2017 at 10:49 PM, Anatolij Gustschin <agust@denx.de> wrote:
>>
>> > Add driver for CBUS pins on FT232H. The driver supports setting
>> > GPIO direction and getting/setting CBUS 0-3 pin value. The CBUS
>> > pins have to be enabled by configuring I/O mode in the FTDI EEPROM.
>> >
>> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
>
>> Apart from these small things it looks like a solid and nice driver,
>> do you plan to merge this into MFD or should I merge it? Since it depends
>> on the Kconfig symbol I guess I can merge it orthogonally if I am sure
>> Lee will pick the MFD part.
>
> There are some fundamental problems with this series which prevents it
> from being merged. Please take a look at the discussion following patch
> 1/3.

Allright it is on hold pending the MFD discussion.

Yours,
Linus Walleij
