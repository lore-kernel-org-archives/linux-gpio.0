From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 4/6] gpio: mxc: use devres for irq generic chip
Date: Wed, 2 Aug 2017 10:26:11 +0200
Message-ID: <CAMRc=Mey6vJB1sgv7MJ79C_fPSqjb8j23A=eUPjh0is61K0wUQ@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-5-brgl@bgdev.pl>
 <2153314.vmO4TSUiTO@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:34066 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752161AbdHBI0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 04:26:12 -0400
Received: by mail-qt0-f171.google.com with SMTP id s6so22972379qtc.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 01:26:12 -0700 (PDT)
In-Reply-To: <2153314.vmO4TSUiTO@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

2017-08-02 10:09 GMT+02:00 Alexander Stein
<alexander.stein@systec-electronic.com>:
> Hi,
>
> On Wednesday 02 August 2017 09:51:24, Bartosz Golaszewski wrote:
>> Use resource managed variants of irq_alloc_generic_chip() and
>> irq_setup_generic_chip().
>
> Is this really useful for drivers which can only be built-in? This is probably
> valid for the other drives as well.
>
> Best regards,
> Alexander
>

gpio-pch and gpio-ml-ioh are loadable and they leak the resources
allocated with these routines. Other drivers affected by this series
already use other devm_*() functions and these changes just make them
more consistent.

Thanks,
Bartosz
