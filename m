From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Tue, 2 Oct 2018 07:26:47 -0500
Message-ID: <aa06e450-84a7-11f9-3972-08f1c9dbd1c4@kernel.org>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com>
 <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org>
 <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org>
 <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
 <D3E6F4C4-E1C4-4D88-B118-878576BF5281@gmail.com>
 <CACRpkdawwrpEe6AAfdaxw6OMFXkCnq0gpznk1Up5p1=Wigx_2g@mail.gmail.com>
 <CAPybu_1P-RWCP8yjQKkFYAX11KtYGhAfASY24Q_NZ19PD09gxA@mail.gmail.com>
 <CACRpkdaN5G4ephY+6BPLRF+aUrO4-sPa+2erRYrwTGwPBwu8fw@mail.gmail.com>
 <CAPybu_33WNiCdkwgNtkiTP2PL+9ai85Z2LiMB6yqNZrV5JdmXw@mail.gmail.com>
 <CACRpkdaccTSqpKQeUc1c6UEMo+fZmB+w0BQJL--gubrLMmKSgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaccTSqpKQeUc1c6UEMo+fZmB+w0BQJL--gubrLMmKSgw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: jhugo@codeaurora.org, Stephen Boyd <swboyd@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/2/18 2:38 AM, Linus Walleij wrote:
>> But as today the only driver that seems to be using valid_mask is msm,
>> so perhaps a hack is something better and then when we have a second
>> driver that requires it we figure out the real requirements. But it is
>> definately your decision;)

Please note that MSM is supposed to be the *first* driver, not the only, 
driver that needs valid_mask.  So let's not make any code changes that 
limit this feature to the MSM driver.

> I would just add some exported function to gpiolib to do what you
> need so you can set up the valid_mask before calling
> gpiochip_add*.

I think that should be okay.  Drivers should know pretty early whether 
they need valid_mask or not.
