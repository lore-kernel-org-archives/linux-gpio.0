From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/3][v2] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Fri, 30 Jan 2015 19:02:55 +0900
Message-ID: <CAAVeFuJn1rvq1cw4tSqQy_LjCp6kiJqMFDgHp6zifS5q2AH0rA@mail.gmail.com>
References: <1485356.H0CQOKK5aG@pcimr> <CACRpkdb6RZLP-Cv=UvDcO+_pZb34fDeigtABLmKLPpLkPAWfQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:65366 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543AbbA3KDQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 05:03:16 -0500
Received: by mail-ie0-f180.google.com with SMTP id rl12so2313695iec.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 02:03:16 -0800 (PST)
In-Reply-To: <CACRpkdb6RZLP-Cv=UvDcO+_pZb34fDeigtABLmKLPpLkPAWfQg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>, Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 30, 2015 at 6:44 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jan 21, 2015 at 5:46 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
>
>> Introduce new functions for conveniently obtaining and disposing of an entire
>> array of GPIOs with one function call.
>>
>> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
>> ---
>> v2: change interface
>>
>> The ACPI and platform stuff is only compile-tested.
>
> I'm waiting for Alexandre to review this before any merging,
> it's too big a change for me to dare it without his review.

Sorry for taking so long - I have to prep some slides for FOSDEM this
weekend, will review this series right after that.
