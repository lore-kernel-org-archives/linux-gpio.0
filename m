From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] gpio: davinci: Use unique labels for each gpio chip
Date: Tue, 8 Nov 2016 20:16:07 +0530
Message-ID: <e17837bb-5856-63f8-5c32-3108651fbb65@ti.com>
References: <20161103113410.2163-1-ahaslam@baylibre.com>
 <CACRpkdbVUwOtR9k7hXp+xdfro4QvTE5HWTdvXvD6FYBQi-pyYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:47450 "EHLO
        devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbcKHOrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 09:47:03 -0500
In-Reply-To: <CACRpkdbVUwOtR9k7hXp+xdfro4QvTE5HWTdvXvD6FYBQi-pyYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Axel Haslam <ahaslam@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, David Lechner <david@lechnology.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "J, KEERTHY" <j-keerthy@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday 08 November 2016 07:01 PM, Linus Walleij wrote:
> On Thu, Nov 3, 2016 at 12:34 PM, Axel Haslam <ahaslam@baylibre.com> wrote:
> 
>> The gpiod framework uses the chip label to match a specific chip.
>> The davinci gpio driver, creates several chips using always the same
>> label, which is not compatible with gpiod.
>>
>> To allow platform data to declare gpio lookup tables, and for drivers
>> to use the gpiod framework, allocate unique label per registered chip.
>>
>> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> 
> Sekhar/Kevin: can either of you review this patch?

The patch looks good to me.

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

I am traveling and did not really test the patch.

Thanks,
Sekhar

