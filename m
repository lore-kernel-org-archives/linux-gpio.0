From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] gpio: ts4800: Fix module autoload
Date: Fri, 21 Oct 2016 10:32:14 -0300
Message-ID: <cca95b94-82fc-ff40-76af-bfce8db9bfb4@osg.samsung.com>
References: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
 <1476823442-31104-2-git-send-email-javier@osg.samsung.com>
 <CACRpkdZcopStg7B8si97gLzCvE1y4_VYXFjOsbw=gt+hX6pdfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZcopStg7B8si97gLzCvE1y4_VYXFjOsbw=gt+hX6pdfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hello Linus,

On 10/21/2016 09:55 AM, Linus Walleij wrote:
> On Tue, Oct 18, 2016 at 10:44 PM, Javier Martinez Canillas
> <javier@osg.samsung.com> wrote:
> 
>> If the driver is built as a module, autoload won't work because the module
>> alias information is not filled. So user-space can't match the registered
>> device with the corresponding module.
>>
>> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>>
>> Before this patch:
>>
>> $ modinfo drivers/gpio/gpio-ts4800.ko | grep alias
>> $
>>
>> After this patch:
>>
>> $ modinfo drivers/gpio/gpio-ts4800.ko | grep alias
>> alias:          of:N*T*Ctechnologic,ts4800-gpioC*
>> alias:          of:N*T*Ctechnologic,ts4800-gpio
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Patch applied for fixes.
>

Thanks, I guess this also applies to Patch 1/2?
 
> Yours,
> Linus Walleij
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
