From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v4 3/3] gpiolib: Show correct direction from the beginning
Date: Fri, 5 Oct 2018 08:18:59 -0600
Message-ID: <b020854a-819e-a0b4-5e29-a2aca19fad59@codeaurora.org>
References: <20181002140858.16833-1-ricardo.ribalda@gmail.com>
 <d1bbafcb-1b6a-b137-1fd1-954c17e14836@codeaurora.org>
 <da760bcf-4716-e685-1ce4-1dbc6eb7c272@codeaurora.org>
 <CAPybu_1qqdffE4K2BonCV0X_eYY+or6NSK9Bbco9A68N9aasVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_1qqdffE4K2BonCV0X_eYY+or6NSK9Bbco9A68N9aasVw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/5/2018 12:52 AM, Ricardo Ribalda Delgado wrote:
> Hi
> On Fri, Oct 5, 2018 at 12:26 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 10/2/2018 9:21 AM, Jeffrey Hugo wrote:
>>> On 10/2/2018 8:08 AM, Ricardo Ribalda Delgado wrote:
>>>> Current code assumes that the direction is input if direction_input
>>>> function is set.
>>>> This might not be the case on GPIOs with programmable direction.
>>>>
>>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>>
>>> I'll try to get this series tested on QDF2400 by the end of the week.
>>
>> 1-2/3 (v3) and 3/3 (v4) still fails.  Same issue.  Attempting to access
>> config registers for GPIO 0 when the OS is not allowed to do that.
>>
> 
> I think that I might found the bug. if gpio-reserved-ranges was
> present the initialization was lost.
> 
> Can you try with v5
> 
> Thanks for your help

I'll let you know how it goes.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
