From: Song Qiang <songqiang1304521@gmail.com>
Subject: Re: Externally multiplexing interfaces on the same processor pins
Date: Wed, 5 Dec 2018 22:29:19 +0800
Message-ID: <ca1c00e1-8104-b697-24dd-d43a47adcac1@gmail.com>
References: <BL0PR05MB4594E94CC5D74DC038E35EFBA90A0@BL0PR05MB4594.namprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BL0PR05MB4594E94CC5D74DC038E35EFBA90A0@BL0PR05MB4594.namprd05.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frederick Heinecke <fheinecke@ksu.edu>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


On 8/29/18 2:46 AM, Frederick Heinecke wrote:
> Hello all,
>
> Does anybody here know how the kernel handles externally multiplexed peripherals and and what the proper way to setup the device tree for multiplexed peripherals? For example, if I have two interfaces (say USB and I2C) on the same pins, and I want both to be available and usable (not at the same time of course), does the kernel natively support this or is this something that needs to be written into the drivers for both interfaces? Could the kernel or a user-space process potentially attempt to access both at the same time?
>
>   Here's a poorly drawn example of what I'm asking about: https://i.snag.gy/SJQnH1.jpg
>       
>   Thank you,
>   
>   Fred Heinecke
>      

Hi Fred,


Recently I've been looking at a devices just act as you described. A FT232H 
adapter. It has several interfaces including i2c, spi, jtag, etc but share some 
pins. As far as I know these kind of devices should fall in mfd subsystem and as 
for mfd subsystem, it handles devices with functions enabled together. Doing 
what we want would need dynamic device register and unregister support. I;m just 
planning to write a more support driver for FT232H and I handle this situation 
with another sysfs entry 'current_mode', through this, I select which mode this 
device should be working on. I haven't found any facility in kernel supports this.

Would you share what you device is? I think we can help you insight the 
corresponding driver and check how did the manufacture do with it.


yours,

Song Qiang
