From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [REGRESSION][BISECTED] i.MX6 pinctrl hogs stopped working
Date: Tue, 17 Apr 2018 09:50:21 +0100
Message-ID: <88a3855d-db5f-9086-2901-2360d0cd26ec@opensource.cirrus.com>
References: <8b07e30a-7dd1-7923-dc50-b84f0e43e9e9@nextfour.com>
 <1d3c6099-3b33-d5dd-e12b-903586dc79f3@opensource.cirrus.com>
 <950ec4db-4121-2faf-b6fd-5fcabef91e90@nextfour.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <950ec4db-4121-2faf-b6fd-5fcabef91e90@nextfour.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>, linus.walleij@linaro.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

On 10/04/18 19:33, Mika Penttilä wrote:
> 
> 
> On 10.04.2018 13:21, Richard Fitzgerald wrote:
>> On 04/04/18 06:33, Mika Penttilä wrote:
>>> Hi!
>>>
>>> Reverting this made the hogs on a i.MX6 board work again. :
>>>
>>>
>>> commit b89405b6102fcc3746f43697b826028caa94c823
>>> Author: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> Date:   Wed Feb 28 15:53:06 2018 +0000
>>>
>>>       pinctrl: devicetree: Fix dt_to_map_one_config handling of hogs
>>>
>>>
>>>
>>> --Mika
>>>
>>
>> I think you should check whether the bug is with the i.MX6 driver
>> relying on the previous buggy behaviour of pinctrl. I haven't got
>> i.MX6 hardware to test myself.
>>
>> The bug I fixed in that patch was that when pinctrl is probing a
>> pinctrl driver it would try to apply all the pinctrl settings
>> listed in a dt node to the pinctrl driver it is probing instead
>> of the pinctrl drivers they actually refer to. This was a bug
>> introduced by an earlier patch (which unfortunately I forgot to
>> include a fixes line reference to)
>>
>>    pinctrl: core: Use delayed work for hogs
>>
>> So if a pinctrl driver "A" had a dependency on another pinctrl
>> driver "B" those dependencies wouldn't be properly created because
>> all the "B" pinctrl DT entries would be attempted against "A"
>> instead of "B". This caused failures if a pinctrl driver had a
>> dependency on another pinctrl driver, of if creating a pinctrl
>> driver that is a child of an MFD and that MFD has dependencies
>> on another pinctrl driver.
>>
> 
> Hard to say, but the kernel/dts has worked ok for 3+ years, from 3.17 until 4.17-rc. Nothing fancy, just normal hogs, in two groups.
> Can send you relevant pieces of DT if interested.
> 
> --Mika
> 

Tell me where in the kernel tree the the dts files and the source for
the pinctrl driver that uses them and which dts node, and I will look
at what the driver is doing.
