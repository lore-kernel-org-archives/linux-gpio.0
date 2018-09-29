From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Sat, 29 Sep 2018 08:25:30 -0500
Message-ID: <c9600a0d-46a3-70df-816c-e7c7687f324b@kernel.org>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com>
 <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org>
 <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org>
 <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
 <CAPybu_3v6Y1Bs1+WQKFfdNmAFdBN6VJTDiCG1ApNVM2AWt4vjA@mail.gmail.com>
 <9df3f61f-ac54-f5b1-6b86-db539e07c5bd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9df3f61f-ac54-f5b1-6b86-db539e07c5bd@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: jhugo@codeaurora.org, swboyd@chromium.org, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 9/29/18 8:21 AM, Timur Tabi wrote:
> 
>> Is it possible to access the hardware?
> 
> Linaro and some Linux OSVs should still have systems, but I usually just 
> ask Jeff to test code for me.

Alternatively, you can just add valid_mask support to your driver, and 
add a check to your get_direction() function to see if it ever is asked 
to access an invalid GPIO.
