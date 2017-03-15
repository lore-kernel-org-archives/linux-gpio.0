From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/19] gpio: bcm-kona: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 10:57:49 +0100
Message-ID: <CACRpkdaCo2xOhfrEKzn8jrWRzQ=Qu0Y4Ntq1yvddSf_ndOjKeA@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <77d635877e765a6b4b0935debfe5836e554572c0.1489015238.git.julia@ni.com>
 <78b657c5-0f6a-6481-a0cf-e241c0632c7f@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35778 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751885AbdCOJ5v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:57:51 -0400
Received: by mail-it0-f46.google.com with SMTP id m27so62695416iti.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:57:51 -0700 (PDT)
In-Reply-To: <78b657c5-0f6a-6481-a0cf-e241c0632c7f@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Julia Cartwright <julia@ni.com>, Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 10, 2017 at 6:28 PM, Ray Jui <ray.jui@broadcom.com> wrote:

> Is such API use change well accepted by the open source community already?

The raw_*spinlock APIs are in the kernel header files and used at several
sites in the kernel, so yes.

Yours,
Linus Walleij
