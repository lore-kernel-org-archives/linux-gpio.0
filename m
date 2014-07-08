From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-twl4030.c: Cleaning up null pointer checks
 that could never happen
Date: Tue, 8 Jul 2014 09:27:13 +0200
Message-ID: <CACRpkdaa=1Y-XiOaf_e1OjMFkOdJ4SJbJGDEUu-e4puzvr+opA@mail.gmail.com>
References: <1403799441-20362-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:61618 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbaGHH1N (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 03:27:13 -0400
Received: by mail-oa0-f44.google.com with SMTP id i7so5917210oag.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2014 00:27:13 -0700 (PDT)
In-Reply-To: <1403799441-20362-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Jun 26, 2014 at 6:17 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:

> Removal of null pointer checks that could never happen
>
> This was found using a static code analysis program called cppcheck
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

That's correct. Patch applied!

Yours,
Linus Walleij
