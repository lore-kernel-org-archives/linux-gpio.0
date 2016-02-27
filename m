From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [RFD] gpiolib: gpiochip is always dangling after remove
Date: Sat, 27 Feb 2016 11:08:46 +0800
Message-ID: <CAFy1USSRNw-h9fTfhJUA4P4hRp7fFFgU5qEjhBw9Fv5zfumq2w@mail.gmail.com>
References: <1456491974-26997-1-git-send-email-bamv2005@gmail.com>
	<20160226140542.GU18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:36187 "EHLO
	mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755533AbcB0DIr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 22:08:47 -0500
Received: by mail-io0-f169.google.com with SMTP id l127so140292359iof.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2016 19:08:46 -0800 (PST)
In-Reply-To: <20160226140542.GU18327@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Mark

On 26 February 2016 at 22:05, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Feb 26, 2016 at 09:06:14PM +0800, Bamvor Jian Zhang wrote:
>
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -452,7 +452,6 @@ static void gpiodevice_release(struct device *dev)
>>  {
>>       struct gpio_device *gdev = dev_get_drvdata(dev);
>>
>> -     cdev_del(&gdev->chrdev);
>
> This seems weird - we're moving the deletion of the chardev (which is
> the route userspace has to opening the device) later which seems like it
> isn't relevant to the issue and is likely to create problems since it
> means userspace can start to try to use the device while we're in the
> process of trying to tear it down.  If this is needed it should probably
> be explicitly discussed in the changelog, it may be worth splitting into
> a separate patch.
>
>> @@ -633,7 +632,6 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
>>
>>       /* From this point, the .release() function cleans up gpio_device */
>>       gdev->dev.release = gpiodevice_release;
>> -     get_device(&gdev->dev);
>>       pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
>>                __func__, gdev->base, gdev->base + gdev->ngpio - 1,
>>                dev_name(&gdev->dev), chip->label ? : "generic");
>
>> +     device_del(&gdev->dev);
>
> We're removing a get but adding a delete?  Again this is surprising,
> explicitly saying what took the reference we're going to delete would
> probably make this a lot clearer.
>
> In general I'd say your changelog for a change like this should be in
> the form of "When $THING happens $PROBLEM occurs because $REASON,
> instead do $FIX which avoids that because $REASON".
As you said, the commit message is not clear enough to know what is
going on here. Try this one:

When gpiochip_remove is called the gpiochips is not removed because
the refcount is not going down to zero.

The issue I found is that after gpiochip_remove, the gpipchio is not
remove(in dangling state), the reference count in
gdev(gdev->dev->kobj->kref->refcount.count) is 4. So, my first thought
is that where the reference count came from.
On gpiochip_add_data:
refcount    after this function
1           device_initialize(&gdev->dev);
2           status = cdev_add(&gdev->chrdev, gdev->dev.devt, 1);
4           status = device_add(&gdev->dev);
5           get_device(&gdev->dev);
Notes: "gdev->chrdev.kobj.parent" is "&gdev->dev.kobj;"

On gpiochip_remove:
refcount    after this function
4           put_device(&gdev->dev);

And I also check the other code in which chardev is the children of
the device. I found that the flows of add and remove are(e.g.
evdev.c):
Add(e.g. evdev_connect):
device_initialize();
cdev_add();
device_add();

Remove(e.g. evdev_disconnect):
device_del();
cdev_del();
put_device();

If I change the flows in gpiochip_add_data and gpiochip_remove like
above. The gpiochip could be removed in the put_device. But it seems
that it conflict with the comment before put_device:
/*
 * The gpiochip side puts its use of the device to rest here:
 * if there are no userspace clients, the chardev and device will
 * be removed, else it will be dangling until the last user is
 * gone.
 */

So, I feel that maybe I do not fix root issue. Hope I could learn/
help.

Regards

Bamvor
