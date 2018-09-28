From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Fri, 28 Sep 2018 13:14:23 -0600
Message-ID: <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com>
 <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org>
 <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 9/27/2018 8:04 AM, Jeffrey Hugo wrote:
> On 9/27/2018 6:19 AM, Timur Tabi wrote:
>> On 9/27/18 1:51 AM, Stephen Boyd wrote:
>>> Looks OK to me visually. I haven't tested it because I don't have access
>>> to the locked down hardware anymore.
>>
>> Same here.  Please wait for Jeff Hugo to test it before applying.  
>> Thanks.
> 
> I guess its lucky I saw this then.
> 
> I should be able to test within a week.
> 

Nack.  Causes a XPU violation to the GPIO config registers.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
