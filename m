From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 2/2] gpiolib: Defer gpio device setup until after gpiolib
 initialization
Date: Fri, 1 Apr 2016 11:33:19 +1000
Message-ID: <56FDCFDF.2090107@westnet.com.au>
References: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
 <1459437090-10029-2-git-send-email-linux@roeck-us.net>
 <56FDC0D7.5040101@westnet.com.au> <20160401005301.GA17066@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:44697
	"EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752422AbcDABdJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Mar 2016 21:33:09 -0400
In-Reply-To: <20160401005301.GA17066@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Greg Ungerer <gerg@uclinux.org>

On 01/04/16 10:53, Guenter Roeck wrote:
> On Fri, Apr 01, 2016 at 10:29:11AM +1000, Greg Ungerer wrote:
>> Hi Guenter,
>>
>> On 01/04/16 01:11, Guenter Roeck wrote:
>>> Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
>>> attempts to add a gpio chip prior to gpiolib initialization cause
>>> the system to crash. This happens because gpio_bus_type has not been
>>> registered yet. Defer creating gpio devices until after gpiolib has
>>> been initialized to fix the problem.
>>>
>>> Cc: Greg Ungerer <gerg@uclinux.org>
>>> Cc: Alexandre Courbot <gnurou@gmail.com>
>>> Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Thanks for putting these patches together.
>> I can now boot all my boards again with them applied :-)
>>
>> But, I am seeing an issue on one of my targets during boot:
>>
>> ...
>> Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
>> Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
>> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 0x000da0e6
>> sysfs: cannot create duplicate filename '/bus/gpio'
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-rc1-dirty #1
>> Stack from 0383de38:
>>         0383de38 0021f692 00027eb0 03841000 002134f2 038261b0 0382f688 00111c1e
>>         00027efe 0021ccc4 0000001f 000da0e6 00000009 00000000 0383de74 0021cc91
>>         0383de90 0383df8c 000da0e6 0021ccc4 0000001f 0021cc91 03841000 002134f2
>>         038261b0 0382f688 00000000 000da1f0 038261b0 002134f2 0382f688 0382f688
>>         00111d86 0382f688 00000000 0382f688 0382f688 0382f680 0024fe84 0002118e
>>         0383df8c 0382f688 00112094 0382f688 00000000 0013f5dc 0382f680 00000001
>> Call Trace:
>>  ...
>> ---[ end trace 013025e2024d8831 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 1 at lib/kobject.c:240 0x00111fc0
>> kobject_add_internal failed for gpio with -EEXIST, don't try to register things with the same name in the same directory.
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.6.0-rc1-dirty #1
>> Stack from 0383de68:
>>         0383de68 0021f692 00027eb0 ffffffef 0382f688 00000000 0382f688 00111a26
>>         00027efe 0021f817 000000f0 00111fc0 00000009 00000000 0383dea4 0021f8cd
>>         0383dec0 0383df8c 00111fc0 0021f817 000000f0 0021f8cd 002069e9 002134f2
>>         0382f688 0382f680 0024fe84 0002118e 0383df8c 0382f688 00112094 0382f688
>>         00000000 0013f5dc 0382f680 00000001 0000001f 002600de 00265950 0002118e
>>         0383df8c 002600f2 0024fe84 00000001 002600de 00265950 0002118e 00021274
>> Call Trace:
>> ...
>> ---[ end trace 013025e2024d8832 ]---
>> gpiolib: could not register GPIO bus type
>> NET: Registered protocol family 16
> 
> Probably coldfire ?
> 
> arch/m68k/coldfire/gpio.c:

Yes, that is the one.


> static struct bus_type mcfgpio_subsys = {
>         .name           = "gpio",
> 	.dev_name       = "gpio",
> };
> 
> No idea what to do about that. Can that bus be renamed ?

Yeah, it could. But is it even necessary at all now?

I am thinking I could remove the subsys_system_register(&mcfgpio_subsys, NULL)
call from that coldfire/gpio.c. Doing that certainly cleans up the
boot. There was nothing much under the old coldfire /sys/gpio other than
the standard devices/drivers/etc. And the new gpio api ofcourse has all
that as well.

Regards
Greg


>> The boot otherwise continues and is successful.
>>
> Thanks for testing!
> 
> Guenter
> 
>> Regards
>> Greg
>>
>>
>>> ---
>>>  drivers/gpio/gpiolib.c | 98 ++++++++++++++++++++++++++++++++++----------------
>>>  1 file changed, 67 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index f1531070814d..8bb24dc8dc3d 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -68,6 +68,7 @@ LIST_HEAD(gpio_devices);
>>>  static void gpiochip_free_hogs(struct gpio_chip *chip);
>>>  static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
>>>  
>>> +static bool gpiolib_initialized;
>>>  
>>>  static inline void desc_set_label(struct gpio_desc *d, const char *label)
>>>  {
>>> @@ -445,6 +446,58 @@ static void gpiodevice_release(struct device *dev)
>>>  	kfree(gdev);
>>>  }
>>>  
>>> +static int gpiochip_setup_dev(struct gpio_device *gdev)
>>> +{
>>> +	int status;
>>> +
>>> +	cdev_init(&gdev->chrdev, &gpio_fileops);
>>> +	gdev->chrdev.owner = THIS_MODULE;
>>> +	gdev->chrdev.kobj.parent = &gdev->dev.kobj;
>>> +	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
>>> +	status = cdev_add(&gdev->chrdev, gdev->dev.devt, 1);
>>> +	if (status < 0)
>>> +		chip_warn(gdev->chip, "failed to add char device %d:%d\n",
>>> +			  MAJOR(gpio_devt), gdev->id);
>>> +	else
>>> +		chip_dbg(gdev->chip, "added GPIO chardev (%d:%d)\n",
>>> +			 MAJOR(gpio_devt), gdev->id);
>>> +	status = device_add(&gdev->dev);
>>> +	if (status)
>>> +		goto err_remove_chardev;
>>> +
>>> +	status = gpiochip_sysfs_register(gdev);
>>> +	if (status)
>>> +		goto err_remove_device;
>>> +
>>> +	/* From this point, the .release() function cleans up gpio_device */
>>> +	gdev->dev.release = gpiodevice_release;
>>> +	get_device(&gdev->dev);
>>> +	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
>>> +		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
>>> +		 dev_name(&gdev->dev), gdev->chip->label ? : "generic");
>>> +
>>> +	return 0;
>>> +
>>> +err_remove_device:
>>> +	device_del(&gdev->dev);
>>> +err_remove_chardev:
>>> +	cdev_del(&gdev->chrdev);
>>> +	return status;
>>> +}
>>> +
>>> +static void gpiochip_setup_devs(void)
>>> +{
>>> +	struct gpio_device *gdev;
>>> +	int err;
>>> +
>>> +	list_for_each_entry(gdev, &gpio_devices, list) {
>>> +		err = gpiochip_setup_dev(gdev);
>>> +		if (err)
>>> +			pr_err("%s: Failed to initialize gpio device (%d)\n",
>>> +			       dev_name(&gdev->dev), err);
>>> +	}
>>> +}
>>> +
>>>  /**
>>>   * gpiochip_add_data() - register a gpio_chip
>>>   * @chip: the chip to register, with chip->base initialized
>>> @@ -459,6 +512,9 @@ static void gpiodevice_release(struct device *dev)
>>>   * the gpio framework's arch_initcall().  Otherwise sysfs initialization
>>>   * for GPIOs will fail rudely.
>>>   *
>>> + * gpiochip_add_data() must only be called after gpiolib initialization,
>>> + * ie after core_initcall().
>>> + *
>>>   * If chip->base is negative, this requests dynamic assignment of
>>>   * a range of valid GPIOs.
>>>   */
>>> @@ -515,7 +571,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
>>>  	if (chip->ngpio == 0) {
>>>  		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
>>>  		status = -EINVAL;
>>> -		goto err_free_gdev;
>>> +		goto err_free_descs;
>>>  	}
>>>  
>>>  	if (chip->label)
>>> @@ -597,39 +653,16 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
>>>  	 * we get a device node entry in sysfs under
>>>  	 * /sys/bus/gpio/devices/gpiochipN/dev that can be used for
>>>  	 * coldplug of device nodes and other udev business.
>>> +	 * We can do this only if gpiolib has been initialized.
>>> +	 * Otherwise, defer until later.
>>>  	 */
>>> -	cdev_init(&gdev->chrdev, &gpio_fileops);
>>> -	gdev->chrdev.owner = THIS_MODULE;
>>> -	gdev->chrdev.kobj.parent = &gdev->dev.kobj;
>>> -	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
>>> -	status = cdev_add(&gdev->chrdev, gdev->dev.devt, 1);
>>> -	if (status < 0)
>>> -		chip_warn(chip, "failed to add char device %d:%d\n",
>>> -			  MAJOR(gpio_devt), gdev->id);
>>> -	else
>>> -		chip_dbg(chip, "added GPIO chardev (%d:%d)\n",
>>> -			 MAJOR(gpio_devt), gdev->id);
>>> -	status = device_add(&gdev->dev);
>>> -	if (status)
>>> -		goto err_remove_chardev;
>>> -
>>> -	status = gpiochip_sysfs_register(gdev);
>>> -	if (status)
>>> -		goto err_remove_device;
>>> -
>>> -	/* From this point, the .release() function cleans up gpio_device */
>>> -	gdev->dev.release = gpiodevice_release;
>>> -	get_device(&gdev->dev);
>>> -	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
>>> -		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
>>> -		 dev_name(&gdev->dev), chip->label ? : "generic");
>>> -
>>> +	if (gpiolib_initialized) {
>>> +		status = gpiochip_setup_dev(gdev);
>>> +		if (status)
>>> +			goto err_remove_chip;
>>> +	}
>>>  	return 0;
>>>  
>>> -err_remove_device:
>>> -	device_del(&gdev->dev);
>>> -err_remove_chardev:
>>> -	cdev_del(&gdev->chrdev);
>>>  err_remove_chip:
>>>  	acpi_gpiochip_remove(chip);
>>>  	gpiochip_free_hogs(chip);
>>> @@ -2834,6 +2867,9 @@ static int __init gpiolib_dev_init(void)
>>>  	if (ret < 0) {
>>>  		pr_err("gpiolib: failed to allocate char dev region\n");
>>>  		bus_unregister(&gpio_bus_type);
>>> +	} else {
>>> +		gpiolib_initialized = true;
>>> +		gpiochip_setup_devs();
>>>  	}
>>>  	return ret;
>>>  }
>>>
>>
> 

