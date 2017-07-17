From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] pinctrl: qcom: ssbi: mpp: constify gpio_chip structure
Date: Sun, 16 Jul 2017 23:13:00 -0500
Message-ID: <2d499e4d-e4be-0eb2-00a5-bfc19fd81d07@embeddedor.com>
References: <20170711211836.GA31321@embeddedgus>
 <20170711214401.GE20973@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711214401.GE20973@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On 07/11/2017 04:44 PM, Bjorn Andersson wrote:
> On Tue 11 Jul 14:18 PDT 2017, Gustavo A. R. Silva wrote:
> [..]
>> before:
>>     text    data     bss     dec     hex filename
>>    15136    5112       0   20248    4f18 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.o
>>
>> after:
>>              bss     dec     hex filename
>>    14849    5024       0   19873    4da1 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.o
>>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thank you, Bjorn.

-- 
Gustavo A. R. Silva
