From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/4] gpio: sysfs: change 'value' attribute to prealloc
Date: Mon, 18 Dec 2017 18:40:14 +0100
Message-ID: <CAMRc=McjSUEMxZmaU+FZVzXivQydkMyF_cW1_d4e7mfX=KM3qg@mail.gmail.com>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
 <CAMRc=McJVH1c945oCSNbn7qycy8pX4w4mkUqm0tOdBEdR7z25g@mail.gmail.com> <6bdd0809-f6b5-e36e-877b-fc29b647f38d@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:38772 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937475AbdLRRkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Dec 2017 12:40:15 -0500
Received: by mail-ot0-f193.google.com with SMTP id p3so14041673oti.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2017 09:40:14 -0800 (PST)
In-Reply-To: <6bdd0809-f6b5-e36e-877b-fc29b647f38d@c-s.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe LEROY <christophe.leroy@c-s.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

2017-12-18 16:07 GMT+01:00 Christophe LEROY <christophe.leroy@c-s.fr>:
>
>
> Le 18/12/2017 =C3=A0 11:18, Bartosz Golaszewski a =C3=A9crit :
>>
>> 2017-12-18 11:08 GMT+01:00 Christophe Leroy <christophe.leroy@c-s.fr>:
>>>
>>> The GPIO 'value' attribute is time critical. A small bench with
>>> 'perf record' on the app below shows that 80% of the time spent in
>>> sysfs_kf_seq_show() is spent in memset() for zeroising the buffer.
>>>
>>> |--67.48%--sysfs_kf_seq_show
>>> |          |
>>> |          |--54.40%--memset
>>> |          |
>>> |          |--11.49%--dev_attr_show
>>> |          |          |
>>> |          |          |--10.06%--value_show
>>> |          |          |          |
>>> |          |          |          |--4.75%--sprintf
>>> |          |          |          |          |
>>>
>>> This patch changes the attribute type to prealloc, eliminating the
>>> need to zeroise the buffer at each read. 'perf record' gives the
>>> following result.
>>>
>>> |--42.41%--sysfs_kf_read
>>> |          |
>>> |          |--39.73%--dev_attr_show
>>> |          |          |
>>> |          |          |--38.23%--value_show
>>> |          |          |          |
>>> |          |          |          |--29.22%--sprintf
>>> |          |          |          |          |
>>>
>>> Test done with the following small app:
>>>
>>> int main(int argc, char **argv)
>>> {
>>>          int fd =3D open(argv[1], O_RDONLY);
>>>
>>>          for (;;) {
>>>                  int buf[512];
>>>
>>>                  read(fd, buf, 512);
>>>                  lseek(fd, 0, SEEK_SET);
>>>          }
>>>          exit(0);
>>> }
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>   drivers/gpio/gpiolib-sysfs.c | 2 +-
>>>   include/linux/device.h       | 3 +++
>>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.=
c
>>> index 3f454eaf2101..7a3f4271393b 100644
>>> --- a/drivers/gpio/gpiolib-sysfs.c
>>> +++ b/drivers/gpio/gpiolib-sysfs.c
>>> @@ -138,7 +138,7 @@ static ssize_t value_store(struct device *dev,
>>>
>>>          return status;
>>>   }
>>> -static DEVICE_ATTR_RW(value);
>>> +static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show,
>>> value_store);
>>>
>>>   static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
>>>   {
>>> diff --git a/include/linux/device.h b/include/linux/device.h
>>> index 9d32000725da..46ac622e5c6f 100644
>>> --- a/include/linux/device.h
>>> +++ b/include/linux/device.h
>>> @@ -575,6 +575,9 @@ ssize_t device_store_bool(struct device *dev, struc=
t
>>> device_attribute *attr,
>>>
>>>   #define DEVICE_ATTR(_name, _mode, _show, _store) \
>>>          struct device_attribute dev_attr_##_name =3D __ATTR(_name, _mo=
de,
>>> _show, _store)
>>> +#define DEVICE_ATTR_PREALLOC(_name, _mode, _show, _store) \
>>> +       struct device_attribute dev_attr_##_name =3D \
>>> +               __ATTR_PREALLOC(_name, _mode, _show, _store)
>>>   #define DEVICE_ATTR_RW(_name) \
>>>          struct device_attribute dev_attr_##_name =3D __ATTR_RW(_name)
>>>   #define DEVICE_ATTR_RO(_name) \
>>> --
>>> 2.13.3
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>> I'm not sure we should be fixing performance issues in an interface
>> that's deprecated anyway...
>
>
> Many applications use that interface. I agree not to make deep changes fo=
r
> performance, but here the few changes are quite tiny, yet for a significa=
nt
> improvement, so aren't they worth it anyway ?
>
> Christophe

Well, TBH if anything, I'd prefer to worsen the performance to
actually discourage people from using sysfs for GPIOs. :)

It's not up to me though, so let's wait for Linus' opinion.

Thanks,
Bartosz

>
>
>>
>> The character device doesn't deal with strings so it will be much faster
>> anyway.
>>
>> Best regards,
>> Bartosz Golaszewski
>>
>
