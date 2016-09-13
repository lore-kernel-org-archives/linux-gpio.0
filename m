From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio: pca953x: initialize ret to zero to avoid returning
 garbage
Date: Tue, 13 Sep 2016 12:04:00 +0800
Message-ID: <944b682f-6217-f759-7429-339274cd5894@electromag.com.au>
References: <20160909083154.26442-1-colin.king@canonical.com>
 <CACRpkdYHRjUoANEibzexrmGQiVHL4cgYWZPr6H-_GA1HqqpTNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:36467 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750869AbcIMEEF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 00:04:05 -0400
In-Reply-To: <CACRpkdYHRjUoANEibzexrmGQiVHL4cgYWZPr6H-_GA1HqqpTNw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Colin King <colin.king@canonical.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On 12/09/2016 21:40, Linus Walleij wrote:
> On Fri, Sep 9, 2016 at 10:31 AM, Colin King <colin.king@canonical.com> wrote:
>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> ret is not initialized so it contains garbage.  Ensure garbage
>> is not returned in the case that pdata && pdata->teardown is false
>> by initializing ret to 0.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Patch applied.
G'day Linus,


I believe this does the same as Arnd Bergmanns patch from 26 Aug.
[PATCH 1/5] gpio: pca954x: fix undefined error code from remove

IMO Colin's is the cleaner solution.
Arnd's could be removed.

-- 
Regards
Phil Reid

