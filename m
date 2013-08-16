From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH] gpio: (gpio-pca953x) move header to linux/platform_data/
Date: Fri, 16 Aug 2013 14:06:24 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F0021DAC7DA184@AUSP01VMBX24.collaborationhost.net>
References: <CACRpkdZdeVNtJSmc6Lr6j=oO9FLsAvjyrwhYS0j4OoAEhxCN9g@mail.gmail.com>
 <82440653.410050.1376665340121.JavaMail.root@mail>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <82440653.410050.1376665340121.JavaMail.root@mail>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel@savoirfairelinux.com" <kernel@savoirfairelinux.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Friday, August 16, 2013 8:02 AM, Vivien Didelot wrote:
> Hi Linus,
>
> You wrote:
> > But:
>>
>>>  drivers/gpio/gpio-pca953x.c                 |  2 +-
>> (...)
>>> diff --git a/drivers/gpio/gpio-pca953x.c
>>> b/drivers/gpio/gpio-pca953x.c
>>> index 426c51d..8804aec 100644
>>> --- a/drivers/gpio/gpio-pca953x.c
>>> +++ b/drivers/gpio/gpio-pca953x.c
>>> @@ -18,7 +18,7 @@
>>>  #include <linux/irq.h>
>>>  #include <linux/irqdomain.h>
>>>  #include <linux/i2c.h>
>>> -#include <linux/i2c/pca953x.h>
>>> +#include <linux/platform_data/pca953x.h>
>> 
>> Why does the GPIO driver need platform data from the
>> I2C driver???
>> 
>> Can't this just be made to go away?
>
> I didn't dig that much in the driver, but I cannot imagine
> another way to pass, for instance, the setup callback.
>
> What would be a good alternative for you?

I think the confusion here is because the pca953x.h header was initially
placed in linux/i2c.

This device is an I2C connected GPIO expander. The pca953x.h header has
the information needed for the platform to hook up to the device. It doesn't
really expose the fact that it's an I2C driver.

Just by 2 cents...
Hartley
