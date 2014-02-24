From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] gpio: gpio-rcar: init at postcore level
Date: Mon, 24 Feb 2014 11:46:34 +0400
Message-ID: <530AF8DA.8050709@cogentembedded.com>
References: <1393173467-12240-1-git-send-email-vladimir.barinov@cogentembedded.com> <530A477C.6070007@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <530A477C.6070007@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-sh@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, magnus.damm@gmail.com, horms@verge.net.au, gnurou@gmail.com, linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
List-Id: linux-gpio@vger.kernel.org

Hello Ben,

On 02/23/2014 11:09 PM, Ben Dooks wrote:
> On 23/02/14 16:37, vladimir.barinov@cogentembedded.com wrote:
>> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>
>> This adds ability to use gpio API at board init_machine level.
>>
>> F.e. it can be used in the following situation.
>> Many reference hardware has onboard switches that selects which 
>> periferals
>> to connect to the system. The gpio input state from switches can be used
>> in choosing platform devices runtime in board code instead of 
>> ifdefs/defconfig
>> changes.
>
> Firstly, anyone still using platform_devices to describe their
> system needs to be stopped. We cannot go on supporting this when
> our primary boot method is supposed to be device-tree. If we keep
> doing this then we will not get any of the current issues fixed.
Understand. I see that this is not a time for such changes.
Hope that the DT model will take into account such kind of situation in 
the future.
>
> Will it impact the devicetree bindings on rcar?
No

Regards,
Vladimir
