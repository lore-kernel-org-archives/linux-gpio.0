From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Thu, 20 Sep 2018 07:25:17 -0500
Message-ID: <ebcc344a-469a-d3c0-3e0e-cdabe046cbf3@kernel.org>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com>
 <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
 <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
 <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 9/19/18 10:27 AM, Ricardo Ribalda Delgado wrote:
> "The get_direction callback normally triggers
> a  read/write to hardware, but we shouldn't be touching the hardware
> for   an individual GPIO until after it's been properly claimed." is
> an statement specific for your platform 

That is definitely not true.

> and should be fixed in your
> driver.

There is no bug in my driver.  The driver reports only a subset of the 
GPIOs, because that's all that are available.  Attempting to access an 
invalid GPIO generates an XPU violation.  The original code was 
attempting to access GPIOs that the driver said don't exist.

The code that we have today is the result of months of discussion, 
negotiation, and trial-and-error.
