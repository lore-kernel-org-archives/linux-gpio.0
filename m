From: Robert Abel <rabel@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] GPIOD: fix gpiod_direction_output initial value
Date: Mon, 05 May 2014 11:31:57 +0200
Message-ID: <53675A8D.5060102@cit-ec.uni-bielefeld.de>
References: <1398774442-2407-1-git-send-email-rabel@cit-ec.uni-bielefeld.de> <CAAVeFu+vLibyz8nkfPRzbi6wMN058say-jVGH9zRFf+Gm1M3sw@mail.gmail.com>
Reply-To: rabel@cit-ec.uni-bielefeld.de
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:57649 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755961AbaEEJb7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 05:31:59 -0400
Received: by mail-ee0-f45.google.com with SMTP id d49so1118705eek.18
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 02:31:58 -0700 (PDT)
In-Reply-To: <CAAVeFu+vLibyz8nkfPRzbi6wMN058say-jVGH9zRFf+Gm1M3sw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 01.05.2014 08:28, Alexandre Courbot wrote:
> What your change effectively does is changing 
> gpiod_direction_output_raw() into gpiod_direction_output() (look at 
> the latter).
The issue my patch fixed was already fixed by 
ef70bbe1aaa612f75360e5df5952fddec50b7ca9.
I didn't notice that the function had been renamed when checking after 
merging.

