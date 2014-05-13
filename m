From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 13 May 2014 13:33:09 +0200
Message-ID: <537202F5.6070609@cit-ec.uni-bielefeld.de>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de> <CACRpkdZu0BAfR5b=-AbURxQ1VtGJbBmBwrTmLkO3Te--EHYWyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:63492 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753281AbaEMLcx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 07:32:53 -0400
Received: by mail-ee0-f47.google.com with SMTP id c13so313815eek.20
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2014 04:32:52 -0700 (PDT)
In-Reply-To: <CACRpkdZu0BAfR5b=-AbURxQ1VtGJbBmBwrTmLkO3Te--EHYWyQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On 13 May 2014 10:42, Linus Walleij wrote:
> Since I've merged Alexandre's other patch making the function private 
> I'm dropping this assuming you have sorted things out...
No, I just stopped responding, because I grew tired of his stupid argument.
You want broken functions, you get broken functions.

Alexandre's claim that

On 05 May 2014 17:14, Alexandre Courbot wrote:
> Good news, once of_get_gpiod_flags() becomes private all public gpiod_
> functions should return a correct gpio_desc.
is wrong, of course. And ridiculous, I might add.
None of the gpiod_* functions return valid gpio_desc with the singular 
exception of gpiod_get, which happens to be aware of the shortcomings of 
all other public functions and corrects their mistakes after the fact.

Regards,

Robert
