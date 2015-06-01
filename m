From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Prevent an integer overflow in the pca953x driver
Date: Mon, 1 Jun 2015 15:52:29 +0200
Message-ID: <CACRpkdY6AM41X4XXR4=BVV5-fJo0nK=27cnixC+-5f0YLUD4bA@mail.gmail.com>
References: <1432254912-17153-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33502 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753189AbbFANwa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 09:52:30 -0400
Received: by oiww2 with SMTP id w2so101688043oiw.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 06:52:29 -0700 (PDT)
In-Reply-To: <1432254912-17153-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>

On Fri, May 22, 2015 at 2:35 AM, Joshua Scott
<joshua.scott@alliedtelesis.co.nz> wrote:

> Interrupts were missed if an 8-bit integer overflow occurred. This was
> observed when bank0,pin7 and bank1,pin7 changed simultaniously.
>
> As the 8-bit totals were only checked against zero, replace them with
> booleans. Name the booleans so that their purpose is clear.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>

Patch applied with Alex' review tag.

Yours,
Linus Walleij
