From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] gpio: sprd: Add missing break in switch statement
Date: Mon, 11 Feb 2019 20:11:14 -0600
Message-ID: <aeb131be-bc0d-3195-d40d-3c78b334a51a@embeddedor.com>
References: <20190211185001.GA19472@embeddedor>
 <CAMz4kuLm66+h_Mo45sTZ1et_wGqDBEv2RRLMU_c+Xip1TEVM-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuLm66+h_Mo45sTZ1et_wGqDBEv2RRLMU_c+Xip1TEVM-w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Hi Baolin,

On 2/11/19 8:07 PM, Baolin Wang wrote:
> Hi Gustavo,
> 
> On Tue, 12 Feb 2019 at 02:50, Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
>>
>> Fix the following warning by adding a missing break:
>>
>> drivers/gpio/gpio-eic-sprd.c: In function ‘sprd_eic_irq_set_type’:
>> drivers/gpio/gpio-eic-sprd.c:403:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>    switch (flow_type) {
>>    ^~~~~~
>> drivers/gpio/gpio-eic-sprd.c:435:2: note: here
>>   default:
>>   ^~~~~~~
>>
>> This patch is part of the ongoing efforts to enable
>> -Wimplicit-fallthrough.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> Thanks for fixing my mistake.
> Reviewed-by: Baolin Wang <baolin.wang@linaro.org>
> 

Glad to help. :)

Thanks
--
Gustavo
