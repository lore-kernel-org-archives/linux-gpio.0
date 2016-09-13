From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: initialize ret to zero to avoid returning garbage
Date: Tue, 13 Sep 2016 13:49:25 +0200
Message-ID: <CACRpkdYFSRjo7ncqOv87_r0Ms1moVxXZTOGwWoq-YCqtDh5WNA@mail.gmail.com>
References: <20160909083154.26442-1-colin.king@canonical.com>
 <CACRpkdYHRjUoANEibzexrmGQiVHL4cgYWZPr6H-_GA1HqqpTNw@mail.gmail.com> <944b682f-6217-f759-7429-339274cd5894@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36531 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750999AbcIMLt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 07:49:26 -0400
Received: by mail-oi0-f48.google.com with SMTP id q188so261702278oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 04:49:26 -0700 (PDT)
In-Reply-To: <944b682f-6217-f759-7429-339274cd5894@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Colin King <colin.king@canonical.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On Tue, Sep 13, 2016 at 6:04 AM, Phil Reid <preid@electromag.com.au> wrote:
> On 12/09/2016 21:40, Linus Walleij wrote:
>>
>> On Fri, Sep 9, 2016 at 10:31 AM, Colin King <colin.king@canonical.com>
>> wrote:
>>
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> ret is not initialized so it contains garbage.  Ensure garbage
>>> is not returned in the case that pdata && pdata->teardown is false
>>> by initializing ret to 0.
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>
>>
>> Patch applied.
>
> G'day Linus,
>
>
> I believe this does the same as Arnd Bergmanns patch from 26 Aug.
> [PATCH 1/5] gpio: pca954x: fix undefined error code from remove
>
> IMO Colin's is the cleaner solution.
> Arnd's could be removed.

OK you're right. I reverted Arnd's patch.

Yours,
Linus Walleij
