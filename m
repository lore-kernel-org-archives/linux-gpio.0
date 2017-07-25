From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Tue, 25 Jul 2017 14:14:16 +0200
Message-ID: <20170725141416.5b7764ed@crub>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
        <1499374158-12388-2-git-send-email-agust@denx.de>
        <20170710125210.GK29638@localhost>
        <20170719085934.GU29638@localhost>
        <20170719145900.42172f44@crub>
        <20170725115235.GO2729@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725115235.GO2729@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, 25 Jul 2017 13:52:35 +0200
Johan Hovold johan@kernel.org wrote:

>On Wed, Jul 19, 2017 at 02:59:00PM +0200, Anatolij Gustschin wrote:
>> On Wed, 19 Jul 2017 10:59:34 +0200
>> Johan Hovold johan@kernel.org wrote:  
>
>> >> And as David Laight already pointed out, your ftdi-fifo-fpp-mgr driver
>> >> seems too application specific for a generic chip like this.    
>> >
>> >Of which this is one is one of the major.  
>> 
>> Thanks all for feedback. I'm still pondering how to interface the
>> fpga manager driver to FTDI FIFO driver.
>>   
>> >In short, your driver is much to application specific and is probably
>> >something that needs to be implemented in userspace using libftdi.  
>> 
>> I have a requirement to use the fpga manager framework, therefore the
>> kernel driver is needed. Our usage scenario is a multi stage fpga
>> configuration process, the first stage is a pre-configuration via
>> FTDI SPI/FIFO, all subsequent stages are also done by other fpga
>> manager drivers. libftdi based driver already existed for hardware
>> bring-up, now I need similar functionality as kernel fpga manager.  
>
>How are you even accessing these fpga-managers from userspace? I thought
>current interface was for in-kernel use only?

We have different possibilities to access to these fpga-managers from
userspace. On platforms with device-tree support there is a DT-Overlay
configfs interface for inserting a blob with configuration data and
fpga device description. After inserting the blob the fpga manager is
invoked automatically. There are also fpga-mgr debugfs config interface
patches in Altera linux-socfpga git tree for accessing from userspace.
I used them for initial testing, but now I'm using additional kernel
module with a single configuration interface for different managers.

Thanks,
Anatolij
