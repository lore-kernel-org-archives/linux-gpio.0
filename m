From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v5 3/3] gpiolib: Show correct direction from the beginning
Date: Tue, 9 Oct 2018 11:14:44 -0600
Message-ID: <8d8c1aca-c194-c473-3906-c0e7d4a0d0c8@codeaurora.org>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
 <20181005065300.22882-3-ricardo.ribalda@gmail.com>
 <8d10f9b4-7ea9-7d27-478a-39982ba49587@codeaurora.org>
 <CAOZdJXU=p0kz0PNhP8KwCQ0o7TuM=z2SvEz4b60_KveCrT7zPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOZdJXU=p0kz0PNhP8KwCQ0o7TuM=z2SvEz4b60_KveCrT7zPA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus <linus.walleij@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/5/2018 10:54 AM, Timur Tabi wrote:
> On 10/05/2018 11:17 AM, Jeffrey Hugo wrote:>
>> Looks like the driver is initing just fine to me.  Is setting up the
>> jumpers and running gpio-test warranted?
> 
> Well, that test only makes sure that input/output is actually working
> on the hardware level, but it also makes sure that the GPIOs are
> numbered correctly.
> 
> If you want, just put a printk(... offset) in msm_gpio_get() and read
> from a GPIO that you know you have access to, and make sure the
> 'offset' is correct.
> 
> Then try reading from a GPIO that you don't have access to, and make
> sure you get a failure before msm_gpio_get() is called.
> 

Done.

For the series:

Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
