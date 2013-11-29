From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: better lookup method for platform GPIOs
Date: Fri, 29 Nov 2013 08:17:15 +0200
Message-ID: <CAHp75VcsYjj0_QKSeHFiFjrA92uZWdJPs5pLrzFK_HGM1ehUDw@mail.gmail.com>
References: <1385628388-23827-1-git-send-email-acourbot@nvidia.com>
	<CAHp75VcHa7cxAt_utwMVp7j+YeKcqa0_N5B=7-ZmTMD_6AV1Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcHa7cxAt_utwMVp7j+YeKcqa0_N5B=7-ZmTMD_6AV1Lw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rhyland Klein <rklein@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

> On Thu, Nov 28, 2013 at 10:46 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

One missed, but not least, thing.

>> +static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
>>  {
>>         const char *dev_id = dev ? dev_name(dev) : NULL;
>> -       struct gpio_desc *desc = ERR_PTR(-ENODEV);
>> -       unsigned int match, best = 0;
>> -       struct gpiod_lookup *p;
>> +       struct gpiod_lookup_table *table;
>>
>>         mutex_lock(&gpio_lookup_lock);
>>
>> -       list_for_each_entry(p, &gpio_lookup_list, list) {
>> -               match = 0;
>> +       list_for_each_entry(table, &gpio_lookup_list, list) {

[]

>> +               if (dev_id != table->dev_id)
>> +                       continue;
>>
>> -                       match += 2;
>> -               }
>> +               return table;
>
> What  about
>
> if (dev_id == table->dev_id)
>  return table;
>
> ?

And unlock mutex, of course! It seems you missed this in the first place.

>
>> +       }
>>
>> -               if (p->con_id) {
>> -                       if (!con_id || strcmp(p->con_id, con_id))
>> -                               continue;
>> +       mutex_unlock(&gpio_lookup_lock);
>>
>> -                       match += 1;
>> -               }
>> +       return NULL;
>> +}

-- 
With Best Regards,
Andy Shevchenko
