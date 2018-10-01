From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Mon, 1 Oct 2018 08:27:39 -0600
Message-ID: <79878ad4-1c2a-39fa-5baa-042140a6f1ad@codeaurora.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_1P-RWCP8yjQKkFYAX11KtYGhAfASY24Q_NZ19PD09gxA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/1/2018 7:36 AM, Ricardo Ribalda Delgado wrote:
> Hi Linus
> On Mon, Oct 1, 2018 at 1:54 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> On Fri, Sep 28, 2018 at 9:30 PM Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>>
>>> How do we proceed from here? Can you fix your driver somehow to
>>> init the valid mask before enabling the gpio?
>>
>> Just include a hunk to the qcom driver reordering this call
>> at the same time. No need to make it separate patches,
>> it need to be tested together anyways.
>>
>> I guess just switch the order of these two:
>>
>>          ret = gpiochip_add_data(&pctrl->chip, pctrl);
>>          if (ret) {
>>                  dev_err(pctrl->dev, "Failed register gpiochip\n");
>>                  return ret;
>>          }
>>
>>          ret = msm_gpio_init_valid_mask(chip, pctrl);
>>          if (ret) {
>>                  dev_err(pctrl->dev, "Failed to setup irq valid bits\n");
>>                  gpiochip_remove(&pctrl->chip);
>>                  return ret;
>>          }
>>
> 
> the problem is that valid_mask is not a long/integer, is a struct that
> needs to be malloced, and is malloc at gpiochip_add_data :(
> 
> Maybe we need a callback from the driver to init that mask just after
> the allocation?
> 
> A fast grep shows that the only driver using need_valid_mask (not for
> irq) is msm:
> 
> ricardo@neopili:~/curro/kernel-upstream$ git grep "need_valid_mask ="
> | grep -v irq
> drivers/gpio/gpiolib.c: gpiochip->need_valid_mask = true;
> drivers/pinctrl/intel/pinctrl-cherryview.c: bool need_valid_mask =
> !dmi_check_system(chv_no_valid_mask);
> drivers/pinctrl/qcom/pinctrl-msm.c: chip->need_valid_mask =
> msm_gpio_needs_valid_mask(pctrl);
> 
> so hacking something in the driver might not be a terrible idea.
> 

IMO, hack up the driver and I'll test it.  We can figure out what is 
needed to work, then determine what is the proper solution for that.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
