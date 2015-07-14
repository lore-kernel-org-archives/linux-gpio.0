From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: of: remove unnecessary variable in of_get_gpio_hog()
Date: Tue, 14 Jul 2015 10:03:28 +0900
Message-ID: <CAK7LNAR9wq1FaHbq7qUHt_iiWfE42dZCezeJ-d7vkmPDN5127w@mail.gmail.com>
References: <1435825632-16103-1-git-send-email-yamada.masahiro@socionext.com>
	<CAAVeFuKJSUVv-pvy-zHHTPGyKV16UwejXK9SJWzoitw_oDrnmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:32386 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751966AbbGNBDj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jul 2015 21:03:39 -0400
In-Reply-To: <CAAVeFuKJSUVv-pvy-zHHTPGyKV16UwejXK9SJWzoitw_oDrnmg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2015-07-13 23:27 GMT+09:00 Alexandre Courbot <gnurou@gmail.com>:
> On Thu, Jul 2, 2015 at 5:27 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> The variable "desc" is only used for storing the return value at the
>> end of the function.  It is is unneeded.
>
> Fair enough.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> --


I've noticed my typo.  "It is is unneeded" -> "It is unneeded"


Just in case, I've sent v2 with your Acked-by.




-- 
Best Regards
Masahiro Yamada
