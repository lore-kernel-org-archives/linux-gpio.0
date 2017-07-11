From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] pinctrl: qcom: msm: constify gpio_chip structure
Date: Tue, 11 Jul 2017 16:57:38 -0500
Message-ID: <20170711165738.Horde.yi2IJ5rdfgW06y48YYbFP4z@gator4166.hostgator.com>
References: <20170711183414.GA24866@embeddedgus>
 <20170711214151.GC20973@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170711214151.GC20973@minitux>
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Bjorn,

Quoting Bjorn Andersson <bjorn.andersson@linaro.org>:

> On Tue 11 Jul 11:34 PDT 2017, Gustavo A. R. Silva wrote:
> [..]
>> In the following log you can see a significant difference in the code size
>> and data segment, hence in the dec segment. This log is the output
>
> "dec" is for "decimal" and is the sum of text, data and bss...
>

You are right. :)

>> of the size command, before and after the code change:
>>
>> before:
>>    text    data     bss     dec     hex filename
>>   13129    2808     192   16129    3f01 drivers/pinctrl/qcom/pinctrl-msm.o
>>
>> after:
>>    text    data     bss     dec     hex filename
>>   12839    2720     192   15751    3d87 drivers/pinctrl/qcom/pinctrl-msm.o
>>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>
> Good catch, thanks!
>

Absolutely, glad to help!

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c  
>> b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 273badd..245ccfd 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -521,7 +521,7 @@ static void msm_gpio_dbg_show(struct seq_file  
>> *s, struct gpio_chip *chip)
>>  #define msm_gpio_dbg_show NULL
>>  #endif
>>
>> -static struct gpio_chip msm_gpio_template = {
>> +static const struct gpio_chip msm_gpio_template = {
>>  	.direction_input  = msm_gpio_direction_input,
>>  	.direction_output = msm_gpio_direction_output,
>>  	.get_direction    = msm_gpio_get_direction,
>> --
>> 2.5.0
>>

--
Gustavo A. R. Silva
