From: Yong Li <sdliyong@gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Use correct u16 value for register word write
Date: Fri, 1 Apr 2016 22:38:55 +0800
Message-ID: <CADO9-pfvRUnKM104YbM2PEewWSh3K0qqS-LJoUqXbN-UEdbdNg@mail.gmail.com>
References: <1459320554-2455-1-git-send-email-sdliyong@gmail.com> <CACRpkdZ9ojn1rhbX8v9zJ8srkQWrQzSZZ6BLYiyyQwU3oz5BTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:35168 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758384AbcDAOjP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 10:39:15 -0400
In-Reply-To: <CACRpkdZ9ojn1rhbX8v9zJ8srkQWrQzSZZ6BLYiyyQwU3oz5BTQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexander Stein <alexander.stein@systec-electronic.com>, Phil Reid <preid@electromag.com.au>

Yes it is a regression. I think it should be tagged for stable too

Thanks,
Yong

2016-04-01 20:51 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Mar 30, 2016 at 8:49 AM, Yong Li <sdliyong@gmail.com> wrote:
>
>> The current implementation only uses the first byte in val,
>> the second byte is always 0. Change it to use cpu_to_le16
>> to write the two bytes into the register
>>
>> Signed-off-by: Yong Li <sdliyong@gmail.com>
>
> Patch applied to fixes with Phil's review tag.
>
> It is a regression, right?
>
> Should it be tagged for stable?
>
> Yours,
> Linus Walleij
