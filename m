From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH 1/1] gpio: gpiolib: fix identation
Date: Thu, 24 Sep 2015 09:39:51 +0200
Message-ID: <5603A8C7.9050104@schinagl.nl>
References: <1443078892-4417-1-git-send-email-oliver+list@schinagl.nl> <CAAVeFuKYcNFpRMMUQG9OeXGt6cPG68e8FvmvefXocU-b_6eY8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKYcNFpRMMUQG9OeXGt6cPG68e8FvmvefXocU-b_6eY8g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Olliver Schinagl <oliver+list@schinagl.nl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Appologies! I should not do this early in the morning. It is indeed a 
copy/paste fail (and not noticing the missing minus) from the section 
above i was working on.

I'm sorry for the noise!

Olliver

On 24-09-15 09:17, Alexandre Courbot wrote:
> On Thu, Sep 24, 2015 at 4:14 PM, Olliver Schinagl
> <oliver+list@schinagl.nl> wrote:
>> From: Olliver Schinagl <oliver@schinagl.nl>
>>
>> Just a very small cosmetical indentation fix, no code changes
> You are adding two lines and not removing any, so it is not just a
> cosmetic fix and actually adds code.
>
>> Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
>> ---
>>   drivers/gpio/gpiolib.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 980c1f8..5ef9ac2 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1746,6 +1746,8 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
>>                  if (con_id && strcmp(con_id, "gpios")) {
>>                          snprintf(propname, sizeof(propname), "%s-%s",
>>                                   con_id, gpio_suffixes[i]);
>> +                       if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
>> +                               break;
>>                  } else {
>>                          snprintf(propname, sizeof(propname), "%s",
>>                                   gpio_suffixes[i]);
>> --
>> 2.5.1
>>
