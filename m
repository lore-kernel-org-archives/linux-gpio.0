From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC 1/2] gpio: make the GPIOs shareable
Date: Thu, 6 Feb 2014 22:27:19 +0900
Message-ID: <CAAVeFuL_x4p+zk+hHY3XxTG-zoUPcAJ2Zu70PfOpH6yeF8cvmA@mail.gmail.com>
References: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
 <1391011876-7207-2-git-send-email-jjhiblot@traphandler.com>
 <CAAVeFuL9ru0vL7S_caUGRLxPmag+enyCboYXMg+TVd3weZqrKw@mail.gmail.com>
 <CACh+v5N51NztnBqPnyYc3PzjkxBv12cB3AEL0m8G3sAObRib2w@mail.gmail.com> <CAAVeFuJQv9kJB9xN3L5NitoJ5s3YWNC_x6jOF4e-tZbv3+i=AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:58118 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756238AbaBFN1l (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2014 08:27:41 -0500
Received: by mail-vc0-f174.google.com with SMTP id im17so1400812vcb.19
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2014 05:27:40 -0800 (PST)
In-Reply-To: <CAAVeFuJQv9kJB9xN3L5NitoJ5s3YWNC_x6jOF4e-tZbv3+i=AA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 6, 2014 at 10:23 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> There's another feature that I didn't post because its use case is probably
>> not very common. I wanted to be able to share output gpios. My use case is
>> the gpio tracing mechanism I posted a few weeks ago.
>
> Yes, I remember that patch.
>
>> To reduce the complexity of tracking the gpio used by the probes, I thought
>> that maybe this task could be delegated to the gpiolib. Implementation could
>> be very straightforward there:
>> * in gpiod_request (or equivalent) pass an ownership tag (NULL would be a
>> special default value)
>> * in the case were the ouput is already owned, check if the ownership tag
>> are the same and not NULL. If so the request succeeds otherwise it fails.
>
> So the two drivers would need to communicate that ownership tag so the
> second can "hijack" the GPIO with permission from the first? You could
> also pass a handle directly, like PRIME does for buffers (then we
> could plug kdbus in and have user processes exchange GPIO handles
> securely. Now I'm scared).
>
> I would be even more cautious about sharing output GPIOs. If possible
> at all, I'd really prefer to see a scheme where the two consuming
> drivers yield the GPIO when they don't need it. After all, if you
> enter a situation where both drivers want to drive the GPIO output,
> you are obviously going to have a problem.

To elaborate on my thoughts, wouldn't be possible for you to have a
custom DT with the "hijacked" GPIO unmapped from its initial function
and reassigned to the node that represents your probe? I mean, if you
install such a probe you will need to twiddle the hardware anyway, so
while you are at it can't you also represent that change in the DT?
