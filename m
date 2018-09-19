From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Wed, 19 Sep 2018 06:50:25 -0500
Message-ID: <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com>
 <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 9/18/18 11:04 PM, Ricardo Ribalda Delgado wrote:
> And should't that be tacked in qcom hardware with something like:
> 
> if (!priv->initialized)
>     return INPUT;
> 
> if you or Timur point me to the harware that was crashing I would not
> mind looking into that, but the current situations seems to me like a
> hack.

I'd say the previous code was the hack.  My comment about not touching 
the hardware until it is properly claimed is valid, and it applies to 
all platforms.
