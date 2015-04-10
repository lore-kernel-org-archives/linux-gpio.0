From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [RFT][PATCH 1/2] gpio: bcm-kona: Return error if requesting an
 already taken gpio
Date: Sat, 11 Apr 2015 07:01:39 +0800
Message-ID: <CAFRkauCoC2Ukk9WsdS3CK==WFSVYC=-pyiVcN5ns3_RsuU1CUQ@mail.gmail.com>
References: <1428629325.5384.1.camel@phoenix>
	<5527F4AF.20304@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:36858 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932810AbbDJXBl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Apr 2015 19:01:41 -0400
Received: by lbbqq2 with SMTP id qq2so23808369lbb.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2015 16:01:39 -0700 (PDT)
In-Reply-To: <5527F4AF.20304@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2015-04-11 0:05 GMT+08:00 Ray Jui <rjui@broadcom.com>:
> Hi Axel,
>
> On 4/9/2015 6:28 PM, Axel Lin wrote:
>> If a gpio is already taken, .gpio_request should return error.
>
> Isn't the protection logic already there at the higher layer in gpiolib?

OK, you are right.
Thanks for the review.
Axel
