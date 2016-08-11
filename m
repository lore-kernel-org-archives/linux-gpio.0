From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: pca954x: Add vcc regulator and enable it
Date: Thu, 11 Aug 2016 10:14:58 +0200
Message-ID: <CACRpkdYDgbtog5t72KxrVQPjwz3Xd92hBJH1afDE57qYQSDv1g@mail.gmail.com>
References: <1469763595-38245-1-git-send-email-preid@electromag.com.au> <1469763595-38245-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33439 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932289AbcHKIO7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 04:14:59 -0400
Received: by mail-oi0-f53.google.com with SMTP id c15so91682028oig.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 01:14:59 -0700 (PDT)
In-Reply-To: <1469763595-38245-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 29, 2016 at 5:39 AM, Phil Reid <preid@electromag.com.au> wrote:

> Some i2c gpio devices are connected to a switchable power supply
> which needs to be enabled prior to probing the device. This patch
> allows the drive to enable the devices vcc regulator prior to probing.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied!

Yours,
Linus Walleij
