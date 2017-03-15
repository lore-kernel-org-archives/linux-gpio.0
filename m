From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] gpio: acpi: acpi_gpio_resource_lookup: return info
 even if there is no desc
Date: Wed, 15 Mar 2017 11:19:54 +0100
Message-ID: <cf014576-2460-71be-2101-2de3abe4268a@redhat.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
 <20170310205846.16530-2-hdegoede@redhat.com>
 <CACRpkda7+UqubrXXV+KNP66P6b36NNpVZzR3acvDYx=1HrTM3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55410 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751642AbdCOKT5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Mar 2017 06:19:57 -0400
In-Reply-To: <CACRpkda7+UqubrXXV+KNP66P6b36NNpVZzR3acvDYx=1HrTM3Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

On 15-03-17 11:17, Linus Walleij wrote:
> On Fri, Mar 10, 2017 at 9:58 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>
>> Make acpi_gpio_resource_lookup fill acpi_gpio_info even if there is
>> no gpio_desc for the gpio and add a found flag to lookup which is
>> used to indicate that valid info was found.
>>
>> This is a preparation patch for making acpi_dev_gpio_irq_get actually
>> skip interrupts which do not match the requested index, rather then
>> bailing if it cannot retreive a gpio_desc for them.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> I'm totally dependent on Mika/Rafael to review these ACPI patches.

This series has been superseded by: "gpio: acpi: Ignore -EPROBE_DEFER for unselected gpioints"
which is a single simpler patch fixing the issue in a better way.

Regards,

Hans
