From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio-pca953x: Support NXP PCAL9555A with Agile I/O
Date: Thu, 16 Jul 2015 14:41:46 +0200
Message-ID: <CACRpkda0_XG91a1UgsC2wN46xOLsfPF9OPLEygrXwF2nTdoF7g@mail.gmail.com>
References: <1436298146-26451-1-git-send-email-clemens.gruber@pqgruber.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33452 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959AbbGPMlq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 08:41:46 -0400
Received: by oige126 with SMTP id e126so49289808oig.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 05:41:46 -0700 (PDT)
In-Reply-To: <1436298146-26451-1-git-send-email-clemens.gruber@pqgruber.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 7, 2015 at 9:42 PM, Clemens Gruber
<clemens.gruber@pqgruber.com> wrote:

> +Optional properties for chips with Agile I/O:
> +- nxp,input-latch: Enable input latch, one bit per pin
> +- nxp,intr-mask: Unmask interrupts by clearing the mask bits per pin
> +- nxp,open-drain: Configure outputs as open-drain, one bit per bank

Same comments as on v1.

Yours,
Linus Walleij
