From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-ucb1400.c: Cleaning up null pointer checks
 that could never happen
Date: Tue, 8 Jul 2014 09:29:12 +0200
Message-ID: <CACRpkdbJvDMi54Zvg=NOK=fEN6KH8NnV-5x2=xe6rrGW_d4A8Q@mail.gmail.com>
References: <1403799531-20526-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:53696 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753293AbaGHH3M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 03:29:12 -0400
Received: by mail-ob0-f178.google.com with SMTP id wn1so5898909obc.37
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2014 00:29:12 -0700 (PDT)
In-Reply-To: <1403799531-20526-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 26, 2014 at 6:18 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:

> Removal of null pointer checks that could never happen
>
> This was found using a static code analysis program called cppcheck
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Correct, patch applied.

Yours,
Linus Walleij
